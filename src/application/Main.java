package application;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;

public class Main extends Application {
    private static Socket socket;
    private ObjectOutputStream oos;
    private ObjectInputStream ois;
    private MainController mainController;
    private static People user;
    private ClientSender clientSender;
    private ClientReceivingThread clientReceivingThread;
    private Stage stage;
    private LoginController loginController;
    public static int isConnected;

    @Override
    public void init() throws Exception {
        super.init();
        if(establishConnection()==0)
            System.out.println("Connection problem");
    }

    @Override
    public void start(Stage primaryStage) throws Exception{
//        FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("../resources/fxml/main.fxml"));
//        Parent root=fxmlLoader.load();
//        mainController=fxmlLoader.<MainController>getController();
//        mainController.setMain(this);
//        this.stage=primaryStage;
//        primaryStage.setTitle("Let's Chit-Chat "+user.getUserName());
//        primaryStage.setScene(new Scene(root, 1000, 550));
//        primaryStage.show();
        FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("../resources/fxml/login.fxml"));
        Parent root=fxmlLoader.load();
        loginController=fxmlLoader.<LoginController>getController();
//        loginController.setMain(this);
        this.stage=primaryStage;
        primaryStage.setTitle("Login or SignUp ");
        primaryStage.setScene(new Scene(root, 637, 435));
        primaryStage.setResizable(false);
        primaryStage.setOnCloseRequest(event -> {

            System.out.println("Stage closed");
            //send the logout information to server
            try {
                ClientSender.logout();
            } catch (IOException e) {
                e.printStackTrace();
            }
            //close the appropriate sockets
        });
        primaryStage.show();
    }
    public int establishConnection(){

        try {
            socket=new Socket("127.0.0.1",7777);
            ClientSender.setSocket(socket);
            System.out.println("Connection to server established!!");
//            clientSender=new ClientSender(user);
//            ClientSender.login("anubhav","anubhav");//to fill the connectionMap at server
            isConnected=1;
        } catch (IOException e) {
            isConnected=0;
            return 0;
        }
        return 1;
    }

    public static void main(String[] args) {
//        user=new People("anubhav",1,0);
        System.out.println(System.getProperty("user.dir"));
        launch(args);
    }

    public static Socket getSocket() {
        return socket;
    }
    public static People getUser(){
        return user;
    }
    public static void setUser(People u){
        user=u;
    }
    public Stage getStage() {
        return stage;
    }
}
