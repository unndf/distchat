import java.net.Socket;
import java.net.ServerSocket;
import java.net.*;
import java.io.*;
//import java.nio.*;
//import java.nio.channels.*;

public class Server extends Thread{
    private boolean exit = false;
    private int port = 0;
    private ServerSocket socket = null;

    Server(int port) 
    {
        this.port = port;
        try{
            socket = new ServerSocket(port);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void run () 
    {
        try 
        {
            while (!exit)
            {
                    //accept connections
                    Socket conn = socket.accept();
                    BufferedReader inReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                    BufferedWriter outWriter = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
                    //parse
                    String message = inReader.readLine();
                    System.out.println("recieved: " +  message);
                    outWriter.write("Message Received\r\n");
                    outWriter.flush();
                    //send response
            } 
        } catch (IOException e) {
            e.printStackTrace();
        }
        //cleanup
    }

    public static void main (String[] args) 
    {
        Server mainServ = new Server(Integer.parseInt(args[0]));
        mainServ.start();
    }
}
