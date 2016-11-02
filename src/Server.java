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
                    System.out.println("Client " + conn.getInetAddress().getHostAddress() + " connected on port " + conn.getLocalPort() );
                    BufferedReader inReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                    BufferedWriter outWriter = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
                    
                    //parse
                    String message = "";
                    while ((message = inReader.readLine()) != null){
                    	//send response
                        System.out.println("recieved: " +  message);
                        outWriter.write("Message Received\r\n");
                        outWriter.flush();
                    }
                    System.out.println("Client Exited");
                    inReader.close();
                    outWriter.close();// close w
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
