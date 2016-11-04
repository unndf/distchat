import java.net.Socket;
import java.util.Random;
import java.net.ServerSocket;
import java.net.*;
import java.io.*;
import java.nio.*;
import java.nio.channels.*;
import java.util.Iterator;
import java.util.Set;
import java.util.HashMap;

public class Server extends Thread{
    public static final int MAX_MESSAGE_SIZE = 2048;
    public static final int MAX_BUFFER_SIZE = MAX_MESSAGE_SIZE * 2;    
    private boolean exit = false;
    private int port = 0;
    private ServerSocketChannel serverSocket = null;
    private HashMap<Integer,ByteBuffer> socketBuffers = null;
    private int currentSocketId = 0;

    Server(int port) 
    {
        this.port = port;
    }
    public void run () 
    {
        
        try
        {
            //open a selector 
            Selector sockSelector = Selector.open();
            
            //open serverSocketChannel and bind to a port
            serverSocket = ServerSocketChannel.open();
            InetSocketAddress serverAddress = new InetSocketAddress("127.0.0.1", port);
            serverSocket.bind(serverAddress);

            //make the socketChannel  non-blocking
            serverSocket.configureBlocking(false);
            
            //register socketChannel with the selector
            serverSocket.register(sockSelector,
                                         serverSocket.validOps(),
                                         null //no attachments
                                        );

        	Set<SelectionKey> readyKeys = sockSelector.selectedKeys();
            Iterator<SelectionKey> readyIter = readyKeys.iterator();

            //Iterate through the keyset. Then:
            //accept()
            //read() / cont. read()
            //write / cont. write()
            while (readyIter.hasNext())
            {
                SelectionKey key = readyIter.next();

                //accept the new connection, make it non-blocking and register it with the selector
                if (key.isAcceptable())
                {
                    SocketChannel clientSocket = serverSocket.accept();
                    clientSocket.configureBlocking(false);
                    int id = getSocketId();

                    //associate this new socket with it's own bytebuffer
                    addSocketBuffer(id); 
                    clientSocket.register(sockSelector, 
                                          SelectionKey.OP_READ,
                                          id
                                         );
                }

                //socket is ready to be read 
                else if (key.isReadable())
                {
                    SocketChannel clientSocket = (SocketChannel) key.channel();
                }
            }
            /*// Create a file to write the messages to
        	File outputFile = new File("clientOutput.txt");
        	FileOutputStream outputStream = new FileOutputStream(outputFile);
        	BufferedWriter toFile = new BufferedWriter(new OutputStreamWriter(outputStream));
        	int messageNum = 0;	// Keep track of the message number*/
        	while (!exit)
            {

                /*
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
                        sleep((rand.nextInt(11)+1)*1000);
                        outWriter.write("Message Received\r\n");		//Write back to client
                        outWriter.flush();
                    }
                    System.out.println("Client Exited");
                    toFile.append("**Client left chat room**\n\n");
                    toFile.flush();
                    inReader.close();
                    outWriter.close();// close w
                    
            */} 
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private int getSocketId () 
    {
        return ++(this.currentSocketId);
    }
    private void addSocketBuffer (int id)
    {
        ByteBuffer buff = ByteBuffer.allocateDirect(MAX_BUFFER_SIZE);
        socketBuffers.put(id,buff); 
    }
    public static void main (String[] args) 
    {
        Server mainServ = new Server(Integer.parseInt(args[0]));
        mainServ.start();
    }
}
