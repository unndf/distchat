import java.net.Socket;
import java.util.Random;
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
        	// Create a file to write the messages to
        	File outputFile = new File("clientOutput.txt");
        	FileOutputStream outputStream = new FileOutputStream(outputFile);
        	BufferedWriter toFile = new BufferedWriter(new OutputStreamWriter(outputStream));
        	int messageNum = 0;	// Keep track of the message number
        	while (!exit)
            {
	            	//accept connections
	        		Socket conn = socket.accept();
	                BufferedReader inReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	                BufferedWriter outWriter = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	                toFile.append("**Client joined chat room**\n");                   
	                toFile.flush();
	                
	                String message = "";
	                
                    while ((message = inReader.readLine()) != null){
                    	//send response
                        System.out.println("Recieved Message: " +  message);
                        toFile.append("Message " + messageNum + ": " + message);
                        toFile.newLine();
                        toFile.flush();
                        messageNum++;
                        
                        // Enforce communication delay
                        Random rand = new Random();
                        // Numbers between 1-10
                        this.sleep(Math.abs(rand.nextInt(11)+1)*1000);
                        outWriter.write("Message Received\r\n");		//Write back to client
                        outWriter.flush();
                    }
                    System.out.println("Client Exited");
                    toFile.append("**Client left chat room**\n\n");
                    toFile.flush();
                    inReader.close();
                    outWriter.close();// close w
                    
            } 
        } catch (IOException e) {
            e.printStackTrace();
        }
        //cleanup
 catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    public static void main (String[] args) 
    {
        Server mainServ = new Server(Integer.parseInt(args[0]));
        mainServ.start();
    }
}
