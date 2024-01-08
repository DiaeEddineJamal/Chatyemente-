package Server;


import application.Packet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class FileSender {
    public static void sendFile(Packet packet) throws IOException {
        InputStream in = new FileInputStream(packet.string1);//string1 contains the path
        byte[] buf = new byte[8388608];// 80 KB
        int len = in.read(buf);
        packet.buff=buf;
        return;
    }
}
