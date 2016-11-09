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

    /**
     * This is the constructor to init a server object
     * @param int port This is the port number the serversocket will bind to
     * @param LinkedList<Message> inq This will be treated as a queue of message used for incoming messages (to application)
     * @param LinkedList<Message> outq This will be treated as a queue used for outgoing messages (to clients)
     * @return Nothing
     */
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

        //start our worker
        QueueWorker worker = new QueueWorker();
        worker.start();
    }
    /**
     * Run Method for the Server
     * A selector is opened and register for accepting
     * The operation of the Server is as follows
     * while (true)
     *  -Let QueueWorker(s) unload the outq into the outgoig buffers (sendBuffers)
     *  -select()
     *  -forall (sockets with operation)
     *      -if (operation is read)
     *          -read or continue reading
     *          if (hasMessage)
     *              -add message to incoming queue
     *              -set interested operation to write
     *      -if (operation is write)
     *          -write or ccntinue writing
     *          if (done writing)
     *              -delete sendBuffer
     *              -set interested operation to read
     */
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
                        //The sockets will be identified with the attachment
                        //This will ALWAYS be an int
                        clientSocket.register(sockSelector,
                                              SelectionKey.OP_READ,
                                              id
                                             );
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
                        }
                        else
                        {
                            if (Message.isMessage(buff))
                            {
                                Message message = Message.getMessage (buff);
                                message.id = id;

                                synchronized(inQueue){
                                    inQueue.addLast(message); //put recieved message on the queue
                                    inQueue.notify(); //tell application we have a message
                                    serverLog.log(Level.INFO, "Message Queued for application and notify()");
                                }
                                
                                key.interestOps(SelectionKey.OP_WRITE); //we're only interested in writing to the socket now
                                //addSocketBuffer(id); //TODO: Assumes that we throw out the rest of the buffer
                            }
                            else
                            {
                                //continue reading
                                //log that we recv. bytes
                                if(bytesRecv > 0)
                                    serverLog.log(Level.INFO, "Partial Message (" + bytesRecv + ") bytes received");
                            }

                        }
                    }//key.isReadable()

                    else if (key.isWritable())
                    {
                        SocketChannel clientSocket = (SocketChannel) key.channel();

                        int id = (int) key.attachment();

                        //We have already have a buffer to write from
                        //ignore it otherwise
                        if(sendBuffers.containsKey(id)){
                            ByteBuffer buff = sendBuffers.get(id); //get the buffer for the socket we're sending to

                            clientSocket.write(buff);

                            //done writing, continue reading
                            if (!buff.hasRemaining()){
                                key.interestOps(SelectionKey.OP_READ | SelectionKey.OP_WRITE); //interested in both reading and writing
                                sendBuffers.remove(id);
                            }
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
    /**
     * @Deprecated only used for testing
     * @see Distchat
     */
    public static void main (String[] args)
    {
        LinkedList<Message> inq = new LinkedList<>();
        LinkedList<Message> outq = new LinkedList<>();
        Server mainServ = new Server(Integer.parseInt(args[0]),inq,outq);
        mainServ.start();
    }
    public class QueueWorker extends Thread
    {
        public QueueWorker()
        {
            //stub
        }
        public void run()
        {
            while (true)
            {
                try
                {
                    synchronized(outQueue){
                        outQueue.wait(); //wait for messages to send
                    }
                } catch (InterruptedException e){
                    e.printStackTrace();//do nothing
                }
                //handles all the messages in the sendQueue
                //TODO: threadpool implementation
                //would only handle ONE message not the entire queue like the code below
                while (!outQueue.isEmpty())
                {
                    //echo every message back to the client
                    Message response = outQueue.pop();
                    byte[] responseBytes = response.toString().getBytes();
                    int id = response.id;
                    ByteBuffer sendBuffer = null;
                    
                    //we are already writing from the sendBuffer
                    //put the message back on the queue and handle it later
                    
                    if (sendBuffers.containsKey(id)){
                        synchronized(outQueue){
                            outQueue.addLast(response); //put it back .....
                        }
                    }
                    else{
                        sendBuffer = ByteBuffer.wrap(responseBytes);
                        sendBuffers.put(id,sendBuffer);
                    }
                }
            }
        }
    }
}
