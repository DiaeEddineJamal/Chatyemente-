package Server;

import application.Message;
import application.Notification;
import application.Packet;
import application.People;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.DriverManager;

public class DatabaseProxy {
    private Connection conn;
    public DatabaseProxy(){
        try {
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/chitchat","root","10614231061423");
            System.out.println("Connection to the database has been established!!");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("problem in connection with the database");
        }
    }
    public synchronized String getEmail(String username) throws SQLException {
        String query="SELECT * FROM users WHERE username='"+username+"'";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        while(rs.next())
            return rs.getString("email");
        return null;
    }
    public synchronized String getContact(String username) throws SQLException {
        String query="SELECT * FROM users WHERE username='"+username+"'";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        while(rs.next())
            return rs.getString("contact");
        return null;
    }
    public synchronized byte[] getPhoto(String username) throws SQLException, IOException {
        String path=null;
        String query="SELECT * FROM users WHERE username='"+username+"'";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        while(rs.next())
            path=rs.getString("photo");
        if(path!=null){
            Packet temp=new Packet("tempPacket");
            temp.string1=path;
            FileSender.sendFile(temp);
            return temp.buff;
        }
        return null;
    }
    public synchronized void signup(String filename,Packet p) throws SQLException {
        String query;
        if(filename!=null)
            query="INSERT INTO users values(null,'"+p.string1+"','"+p.string2+"',0,'"+p.string4+"','"+p.string5+"','"+filename+"')";
        else
            query="INSERT INTO users values(null,'"+p.string1+"','"+p.string2+"',0,'"+p.string4+"','"+p.string5+"',null)";
        Statement stmt=conn.createStatement();
        stmt.execute(query);
    }
    public synchronized boolean login(Packet packet) throws SQLException, IOException {
        String username=packet.string1;
        String password=packet.string2;
        String query="SELECT * FROM users WHERE username='"+username+"' AND password='"+password+"'";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        if(rs.next()){
            packet.string3=rs.getString("email");
            packet.string4=rs.getString("contact");
            packet.buff=getPhoto(packet.string1);
            return true;
        }else{
            return false;
        }
    }
    public synchronized void setPeopleList(List<People> peopleList) throws SQLException, IOException {
        String query="SELECT * FROM users;";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        while (rs.next()){
            String username=rs.getString("username");
            People pp=new People(username,0,rs.getInt("isGroup"),rs.getString("email"),rs.getString("contact"),getPhoto(username));
            if(rs.getInt("isGroup")==1){//it is a group
                //add participants
                List<String> list=new ArrayList<>();
                getParticipants(username,list);
                pp.setParticipants(list);
                pp.setAdmin(getAdmin(username));
            }
            peopleList.add(pp);
        }
        return;
    }
    public synchronized void setNotificationsList(List<Notification> notificationsList, String userName, String senderName, int online) throws SQLException {
        String query="SELECT * FROM messages WHERE messageto='"+userName+"' AND sent=0 order by date";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        while(rs.next()){
            String sender=rs.getString("messagefrom");
            String receiver=userName;
            Message message=new Message(rs.getString("message"),rs.getTimestamp("date"),sender,receiver,rs.getInt("sent"),rs.getInt("type"),rs.getString("actualsender"));
            notificationsList.add(new Notification(sender,receiver,message,2));
        }
        //notifications for group invitations
        query="SELECT * FROM invitations WHERE touser='"+userName+"' AND type=0";
        rs=stmt.executeQuery(query);
        while(rs.next()){
            String messagefrom=rs.getString("fromuser");
            notificationsList.add(new Notification(messagefrom,userName,null,0));
        }
        //notifications for group requests
        query="SELECT * FROM invitations WHERE type=1";
        rs=stmt.executeQuery(query);
        while(rs.next()){
            String groupName=rs.getString("touser");
            if(isAdmin(groupName,userName)){
                notificationsList.add(new Notification(rs.getString("fromuser"),groupName,null,1));
            }
        }

        if(online==1) {
            query = "UPDATE messages SET sent=1 WHERE messageto='" + userName + "' AND messagefrom='" + senderName + "' AND type=0";
            stmt.execute(query);
        }
        return;
    }
    public synchronized boolean isAdmin(String groupName, String userName) throws SQLException {
        String query="SELECT * from "+groupName+" WHERE participants='"+userName+"' AND isAdmin=1";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        return rs.next();
    }
    public synchronized void setMessagesList(List<Message> messageList,String toUser,String fromUser) throws SQLException {
        String query="SELECT * FROM messages WHERE (messageto='"+toUser+"' AND messagefrom='"+fromUser+"') OR (messagefrom='"+toUser+"' AND messageto='"+fromUser+"') order by date";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        while(rs.next()){
            messageList.add(new Message(rs.getString("message"),rs.getTimestamp("date"),rs.getString("messagefrom"),rs.getString("messageto"),rs.getInt("sent"),rs.getInt("type"),rs.getString("actualsender")));
        }
        query="UPDATE messages SET sent=1 WHERE messageto='"+toUser+"' AND messagefrom='"+fromUser+"' AND type=0";
        stmt.execute(query);
        return;
    }
    public synchronized void updateMessages(Message message) throws SQLException {
        Statement stmt=conn.createStatement();
        if(isGroup(message.getSender())) {
            String fromUser = message.getSender();
            String m = message.getMessage();
            String query = "SELECT * FROM " + fromUser;
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                String toUser = rs.getString("participants");
                int invitationAccepted=rs.getInt("accepted");
                if(invitationAccepted==0)
                    continue;
                if(toUser.equals(message.getReceiver()))
                    continue;
                query = "INSERT INTO messages values (null,'" + fromUser + "','" + toUser + "','" + message.getMessage() + "','" + message.getTimestamp() + "',0," + message.getType() + ",'" + message.getReceiver() + "')";
                Statement stmt2=conn.createStatement();
                stmt2.execute(query);
//            }
            }
            query="INSERT INTO messages values (null,'"+message.getReceiver()+"','"+fromUser+"','" + message.getMessage() + "','" + message.getTimestamp() + "',0," + message.getType() + ",'" + message.getReceiver() + "')";
            stmt.execute(query);
            return;
        }
        String q="INSERT INTO messages values (null,'"+message.getSender()+"','"+message.getReceiver()+"','"+message.getMessage()+"','"+message.getTimestamp()+"',0,"+message.getType()+",'"+message.getSender()+"')";
        stmt.execute(q);
    }
    public synchronized void setMessageStatus(Message message) throws SQLException {
        String query="UPDATE messages SET sent=1 WHERE message='"+message.getMessage()+"' AND messagefrom='"+message.getSender()+"' AND messageto='"+message.getReceiver()+"'";
        Statement stmt=conn.createStatement();
        stmt.execute(query);
    }
    public synchronized boolean isGroup(String groupName) throws SQLException {
        String query="SELECT * FROM users WHERE username='"+groupName+"' AND isGroup=1";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        if(rs.next())
            return true;
        return false;
    }
    public synchronized void getParticipants(String groupName, List<String> list) throws SQLException {
        String query="SELECT * from "+groupName+" WHERE accepted=1";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        while(rs.next()){
            list.add(rs.getString("participants"));
        }
        return;
    }
    public synchronized String getAdmin(String groupName) throws SQLException {
        String query="SELECT * from "+groupName+" WHERE isAdmin=1";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        while(rs.next()){
            return rs.getString("participants");
        }
        return null;
    }
    public synchronized boolean isAvailable(String username) throws SQLException {
        String query="SELECT * FROM users WHERE username='"+username+"'";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        if(rs.next())
            return false;
        else
            return true;
    }
    public synchronized void acceptInvitation(String groupName, String userName) throws SQLException {
        String query="UPDATE "+groupName+" SET accepted=1 WHERE participants='"+userName+"'";
        Statement stmt=conn.createStatement();
        stmt.execute(query);
        query="DELETE FROM invitations WHERE fromUser='"+groupName+"' AND toUser='"+userName+"'";
        stmt.execute(query);
    }
    public synchronized void rejectInvitation(String groupName, String userName) throws SQLException {
        String query="DELETE FROM "+groupName+" WHERE participants='"+userName+"'";
        Statement stmt=conn.createStatement();
        stmt.execute(query);
        query="DELETE FROM invitations WHERE fromUser='"+groupName+"' AND toUser='"+userName+"'";
        stmt.execute(query);
    }
    public synchronized void groupRequest(String groupName, String fromUser) throws SQLException {
        //first check if a request is already present
        String query="SELECT * FROM invitations where fromuser='"+fromUser+"' AND touser='"+groupName+"'";
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        if(rs.next())
            return;
        //if not then insert the request
        query="INSERT INTO invitations values ('"+fromUser+"','"+groupName+"',1)";
        stmt=conn.createStatement();
        stmt.execute(query);
    }
    public synchronized void acceptRequest(String fromUser, String groupName) throws SQLException {
        String query="INSERT INTO "+groupName+" VALUES ('"+fromUser+"',0,1)";
        Statement stmt=conn.createStatement();
        stmt.execute(query);
        query="DELETE FROM invitations WHERE fromuser='"+fromUser+"' AND touser='"+groupName+"'";
        stmt.execute(query);
    }
    public synchronized void rejectRequest(String fromUser, String groupName) throws SQLException {
        String query="DELETE FROM invitations WHERE fromuser='"+fromUser+"' AND touser='"+groupName+"'";
        Statement stmt=conn.createStatement();
        stmt.execute(query);
    }
    public synchronized void createGroup(String filename,Packet p) throws SQLException {
        String name=p.string1;
        String admin=p.string2;
        String query;
        if(filename!=null)
            query="INSERT INTO users VALUES (null,'"+name+"',null,1,null,null,'"+filename+"')";
        else
            query="INSERT INTO users VALUES (null,'"+name+"',null,1,null,null,null)";
        System.out.println(query);
        Statement stmt=conn.createStatement();
        stmt.execute(query);
        query="CREATE TABLE "+name+" (participants VARCHAR(70), isAdmin boolean, accepted boolean)";
        stmt.execute(query);
        for (People pp : p.peopleList){
            query="INSERT INTO "+name+" VALUES ('"+pp.getUserName()+"',0,0)";
            stmt.execute(query);
            query="INSERT INTO invitations VALUES ('"+name+"','"+pp.getUserName()+"',0)";//filling the invitations table
            stmt.execute(query);
        }
        query="INSERT INTO "+name+" VALUES ('"+admin+"',1,1)";
        stmt.execute(query);
        return;
    }
}
