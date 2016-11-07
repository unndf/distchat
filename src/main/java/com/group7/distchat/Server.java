package com.group7.distchat;

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
import java.util.LinkedList;
import java.nio.charset.Charset;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.FileHandler;
import java.util.logging.SimpleFormatter;

public class Server extends Thread{
    //constants
    public static final int MAX_MESSAGE_SIZE = 2048;
    public static final int MAX_BUFFER_SIZE = MAX_MESSAGE_SIZE * 2;    
    public static final int SELECT_TIMEOUT = 500; //milliseconds    
    public static final String ENCODING = "UTF-8";
    public static final String LOGFILE = "server.log";
    
    private boolean exit = false;
    private int port = 0;
    private Logger serverLog = Logger.getLogger("com.group7.distchat.Server");
    private ServerSocketChannel serverSocket = null;
    private HashMap<Integer,ByteBuffer> recieveBuffers = null;
    private HashMap<Integer,ByteBuffer> sendBuffers = null;
    private LinkedList<Message> inQueue = null;
    private LinkedList<Message> outQueue = null;
    private int currentSocketId = 0;

    Server(int port, LinkedList<Message> inq, LinkedList<Message> outq) 
    {
        this.port = port;
        try {
            FileHandler fh = new FileHandler (LOGFILE);
            fh.setFormatter(new SimpleFormatter());
            serverLog.addHandler(fh);
        } catch (IOException e){
            e.printStackTrace();
        }
        //get a reference to the Message queues
        inQueue = inq;
        outQueue = outq;
        recieveBuffers = new HashMap<Integer,ByteBuffer>();
        sendBuffers = new HashMap<Integer,ByteBuffer>();
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

            serverLog.log(Level.INFO, "Server started on port " + this.port);
            //log files from first demo
            File outputFile = new File("clientOutput.txt");
        	FileOutputStream outputStream = new FileOutputStream(outputFile);
        	BufferedWriter toFile = new BufferedWriter(new OutputStreamWriter(outputStream));
        	int messageNum = 0;	// Keep track of the message number*/

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

                        //log
                        toFile.append("**Client " + id +" joined chat room**\n");                   
                    }//key.isacceptable()

                    //socket is ready to be read 
                    else if (key.isReadable())
                    {
                        SocketChannel clientSocket = (SocketChannel) key.channel();
                        
                        //get the id and byteBuffer associated with this socket
                        int id = (int) key.attachment();
                        ByteBuffer buff = recieveBuffers.get(id);

                        //read
                        int bytesRecv = clientSocket.read(buff);
                       
                        //connection closed, cancel the key, remove the <id,ByteBuffer> pair from our byteBuffer dict
                        if (bytesRecv < 0)
                        {
                            System.out.println("Connection Closed " + clientSocket.socket());
                            key.cancel();
                            recieveBuffers.remove(id); 
                            //log
                            toFile.append("**Client " + id +" left chat room**\n");
                        }
                        //TODO: move to its own method
                        else 
                        {
                            //buff.flip();
                            //byte[] byteString = new byte[buff.remaining()];
                            //buff.get(byteString);
                            
                            if (Message.isMessage(buff))
                            {
                                Message message = Message.getMessage (buff);
                                inQueue.push(message);
                                
                                String reply = "Message Received\r\n";
                            
                                //prepare send buff
                                ByteBuffer sendbuff = ByteBuffer.wrap(reply.getBytes());
                        
                                //add sendbuff to the list of sending buffers
                                sendBuffers.put(id,sendbuff);
                                key.interestOps(SelectionKey.OP_WRITE); //we're only interested in writing to the socket now
                            }
                            else
                            {
                            }
                            //echo
                            //System.out.println(bytesRecv + " bytes recieved from id: " + id + "\nMessage: " +
                            //        new String (byteString,Charset.forName(ENCODING)) 
                            //                  );
    
                            //write recieved mesage to file
                            //toFile.append("Message " + messageNum + ": Client id: " + id + " " + new String(byteString,Charset.forName(ENCODING)));
                            //toFile.flush();
                            //messageNum++;
                            
                        }
                    }//key.isReadable()

                    else if (key.isWritable())
                    {
                        SocketChannel clientSocket = (SocketChannel) key.channel();

                        int id = (int) key.attachment();
                        ByteBuffer buff = sendBuffers.get(id); //get the buffer for the socket we're sending to
                        
                        clientSocket.write(buff);
                        
                        //done writing, continue reading
                        if (!buff.hasRemaining()){
                            key.interestOps(SelectionKey.OP_READ); //only interested in reading
                            sendBuffers.remove(id);
                        }
                    } //key.isWritable();

                    readyIter.remove(); //remove current key 
                }
            }
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
        recieveBuffers.put(id,buff); 
    }
    public static void main (String[] args) 
    {
        LinkedList<Message> inq = new LinkedList<>();
        LinkedList<Message> outq = new LinkedList<>();
        Server mainServ = new Server(Integer.parseInt(args[0]),inq,outq);
        mainServ.start();
    }
}
