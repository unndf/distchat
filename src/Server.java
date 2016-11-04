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
import java.nio.charset.Charset;

public class Server extends Thread{
    //constants
    public static final int MAX_MESSAGE_SIZE = 2048;
    public static final int MAX_BUFFER_SIZE = MAX_MESSAGE_SIZE * 2;    
    public static final int SELECT_TIMEOUT = 500; //milliseconds    
    public static final String ENCODING = "UTF-8";

    private boolean exit = false;
    private int port = 0;
    private ServerSocketChannel serverSocket = null;
    private HashMap<Integer,ByteBuffer> socketBuffers = null;
    private int currentSocketId = 0;

    Server(int port) 
    {
        this.port = port;
        socketBuffers = new HashMap<Integer,ByteBuffer>();
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

            //select()
            //Iterate through the keyset. Then:
            //accept()
            //read() / cont. read()
            //write / cont. write()
            while (!exit)
            {
                int numKeys = sockSelector.select(SELECT_TIMEOUT);

                //something went horribly wrong
                if (numKeys < 0) {
                    System.exit(1);
                }
                Set<SelectionKey> readyKeys = sockSelector.selectedKeys();
                Iterator<SelectionKey> readyIter = readyKeys.iterator();

                while (readyIter.hasNext())
                {
                    SelectionKey key = readyIter.next();

                    //accept the new connection, make it non-blocking and register it with the selector
                    if (key.isAcceptable())
                    {
                        SocketChannel clientSocket = serverSocket.accept();
                        clientSocket.configureBlocking(false);
                        int id = getSocketId();

                        System.out.println("New Connection " + clientSocket.socket());
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
                        
                        //get the id and byteBuffer associated with this socket
                        int id = (int) key.attachment();
                        ByteBuffer buff = socketBuffers.get(id);

                        //read
                        int bytesRecv = clientSocket.read(buff);
                       
                        //connection closed, cancel the key, remove the <id,ByteBuffer> pair from our byteBuffer dict
                        if (bytesRecv < 0)
                        {
                            System.out.println("Connection Closed " + clientSocket.socket());
                            key.cancel();
                            socketBuffers.remove(id); 
                        }
                        //TODO: move to its own method
                        else 
                        {
                            buff.flip();
                            byte[] byteString = new byte[buff.remaining()];
                            buff.get(byteString);
                            //echo
                            System.out.println(bytesRecv + " bytes recieved from id: " + id + "\nMessage: " +
                                    new String (byteString,Charset.forName(ENCODING)) 
                                              );
                            addSocketBuffer(id); //reallocate buffer for now TODO
                        }
                    }

                    readyIter.remove(); //remove current key 
                }
            }
            /*// Create a file to write the messages to
        	File outputFile = new File("clientOutput.txt");
        	FileOutputStream outputStream = new FileOutputStream(outputFile);
        	BufferedWriter toFile = new BufferedWriter(new OutputStreamWriter(outputStream));
        	int messageNum = 0;	// Keep track of the message number*/
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
        */            
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    //TODO: This should be implemented as a stack and calls pop from the stack. This is to prevent the int wrap-around
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
