package com.group7.distchat;

import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.io.*;

public class Message
{
    /** 
    * static message types M_XYZ = #
    * These are the only valid message types
    * When implementing a new message type make sure to:
    *      Add a static message type identifier
    *      Add a Pattern that recognizes the message format (remember to use regex flag dotall)
    *      Add a method is*MessageType* that uses the pattern to determine if it is a valid message of that type
    *      Add any methods used to extract data from the string
    */
    public static final String ENCODING = "UTF-8";
    
    public static final int M_INVALID = -1;
    public static final int M_MSG_SEND = 1000;
    public static final int M_REGISTER = 1001;
    public static final int M_OPEN = 1002;
    public static final int M_ECHO = 1003;
    public static final int M_ERROR = 1004;
    public static final int M_QUIT = 1005;
    public static final int M_MSG_ID = 1006;
    public static final int M_USER_ID = 1007;
    public static final int M_CHATROOM_ID = 1008;
    public static final int M_MSG = 1009;
    public static final int M_LOGIN = 1010;
    public static final int M_CONNECT = 1011;
    public static final int M_POLL = 1012;
    public static final int M_PACKAGE = 1013;
    public static final int M_ACCEPT = 1014;
    public static final int M_INFO = 1015;
    public static final int M_REPLICA_CONNECT = 1016;
    public static final int M_WELCOME = 1017;
   
    //static patterns matching the messages
    public static Pattern msgSendPattern;
    public static Pattern registerPattern;
    public static Pattern openPattern;
    public static Pattern echoPattern;
    public static Pattern errorPattern;
    public static Pattern quitPattern;
    public static Pattern msgIDPattern;
    public static Pattern userIDPattern;
    public static Pattern chatRoomIDPattern;
    public static Pattern msgPattern;
    public static Pattern loginPattern;
    public static Pattern connectPattern;
    public static Pattern pollPattern;
    public static Pattern packagePattern;
    public static Pattern acceptPattern;
    public static Pattern infoPattern;
    public static Pattern replicaConnectPattern;
    public static Pattern welcomePattern;

    public int id = M_INVALID;
    //message type
    private int type = M_INVALID;
    private String messageString = "";
    
    //init patterns
    static
    {
        msgSendPattern = Pattern.compile("^message-send\\r?\\n([0-9]+)\\r?\\n([0-9]+)\\r?\\n(.+)\\r?\\n",Pattern.DOTALL);
        registerPattern = Pattern.compile("^register\\r?\\n([\\w-]+)\\r?\\n",Pattern.DOTALL);
        openPattern = Pattern.compile("^open\\r?\\n([\\d]+)\\r?\\n",Pattern.DOTALL);
        echoPattern = Pattern.compile("^echo\\r?\\n(.+)\\r?\\n",Pattern.DOTALL);
        errorPattern = Pattern.compile("^error\\r?\\n(.+)\\r?\\n",Pattern.DOTALL);
        quitPattern = Pattern.compile("^quit\\r?\\n\\r?\\n", Pattern.DOTALL);
        msgIDPattern = Pattern.compile("^msgID\\r?\\n([0-9]+)\\r\\n", Pattern.DOTALL);
        userIDPattern = Pattern.compile("^userID\\r?\\n([0-9]+)\\r\\n", Pattern.DOTALL);
        chatRoomIDPattern = Pattern.compile("^chatRoomID\\r?\\n([0-9]+)\\r\\n", Pattern.DOTALL);
        msgPattern = Pattern.compile("^msg\\r?\\n(.+)\\r\\n", Pattern.DOTALL);
        loginPattern = Pattern.compile("^login\\r?\\n(.+)\\r\\n", Pattern.DOTALL);
        //TODO: create regexes for these patterns
        connectPattern = Pattern.compile("^connect\\r?\\n",Pattern.DOTALL);
        pollPattern = Pattern.compile("^poll\\r?\\n(info|users|room|)",Pattern.DOTALL);
        packagePattern = Pattern.compile("^error\\r?\\n(.+)\\n",Pattern.DOTALL);
        acceptPattern = Pattern.compile("^error\\r?\\n(.+)\\n",Pattern.DOTALL);
        infoPattern = Pattern.compile("^error\\r?\\n(.+)\\n",Pattern.DOTALL);
        replicaConnectPattern = Pattern.compile("^replica connect\\r?\\n",Pattern.DOTALL);
        welcomePattern = Pattern.compile("^Welcome, \\r?\\n(.+)\\r\\n", Pattern.DOTALL);
    }

    public Message ()
    {
    }
    /**
     * @Deprecated Use the static getMessage instead of the constructor
     * @see getMessage()
     */
    public Message (String messageString)
    {
        this.messageString = messageString;
        this.type = getMessageType(messageString);
    }
    /**
     * Method for determining whether a byteBuffer contains a valid message as defined by the patterns
     * @param ByteBuffer buff just a  ByteBuffer
     * @return boolean if the buffer contains a message*/
    public static boolean isMessage (ByteBuffer buff)
    {
        ByteBuffer buffCopy = buff.duplicate();
        buffCopy.position(0);
        byte[] buffBytes = new byte[buffCopy.limit()];
        buffCopy.get(buffBytes);
        String messageString = new String (buffBytes,Charset.forName(ENCODING));
        return ( isMessageSend(messageString) 
                || isRegister(messageString)
                || isOpen(messageString)
                || isEcho(messageString)
                || isError(messageString)
                || isQuit(messageString)
                || isMsgID(messageString)
                || isUserID(messageString)
                || isChatRoomID(messageString)
                || isMsg(messageString)
                || isLogin(messageString)
                || isConnect(messageString)
                || isPoll(messageString)
                || isPackage(messageString)
                || isAccept(messageString)
                || isInfo(messageString)
                || isReplicaConnect(messageString)
                || isWelcome(messageString)
                );
        //use regex for now
    }
    /**
     * Method for creating retriving a message from a byteBuffer
     * This should always be used in conjunction with isMessage()
     * In the future this should probably thow an exception if it isnt a messgae
     * @param ByteBuffer buff This is the byteBuffer that we will be retruving the message from
     * @return Message This is the Message contained within the buffer
     */
    public static Message getMessage (ByteBuffer buff)
    {
        //duplicate
        ByteBuffer buffCopy = ByteBuffer.allocate(buff.capacity());
        //buffCopy.flip();
     

        //Not the cleaniest way to do things
        //requires at least n calls to isMessage for a message of n length
        //could be fixed if the protocol was changed to include the length of the message in the first few bytes...
        //TODO
        int len = 0;
        buff.position(0);
        while(!isMessage(buffCopy)){
            len++;
            buffCopy.put(buff.get());
        }
        
        byte[] buffBytes = new byte[len];
        buffCopy.flip();
        buffCopy.get(buffBytes);
        String messageString = new String (buffBytes,Charset.forName(ENCODING));

        String retMessageString = ""; //message string for the message obj we're creating
        Message retMessage = null;

        if (isMessage(buffCopy))
        {
            if(isMessageSend(messageString)){
                Matcher m = msgSendPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isRegister(messageString)){
                Matcher m = registerPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isOpen(messageString)){
                Matcher m = openPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isEcho(messageString)){
                Matcher m = echoPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isError(messageString)){
                Matcher m = errorPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isQuit(messageString)){
                Matcher m = quitPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isMsgID(messageString)){
                Matcher m = msgIDPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isUserID(messageString)){
                Matcher m = userIDPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isChatRoomID(messageString)){
                Matcher m = chatRoomIDPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isMsg(messageString)){
                Matcher m = msgPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isLogin(messageString)){
                Matcher m = loginPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isReplicaConnect(messageString)){
                Matcher m = replicaConnectPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isWelcome(messageString)){
                Matcher m = welcomePattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            retMessage = new Message(retMessageString);
            int byteLen = 0;
            try{
                byteLen = retMessageString.getBytes(ENCODING).length; //inefficient...
            } catch(UnsupportedEncodingException e){
                e.printStackTrace();
            }
            
            //Take the string off the buffer
            buff.clear();
        }   
        return retMessage;
    }
    /**
     * Gets the message type as defined by our constants
     * @param String message The message we want the type of
     * @return int type of message
     */
    public static int getMessageType (String message)
    {
        if      (isMessageSend(message)) return M_MSG_SEND;
        else if (isRegister(message))    return M_REGISTER;
        else if (isOpen(message))        return M_OPEN;
        else if (isEcho(message))        return M_ECHO;
        else if (isError(message))       return M_ERROR;
        else if (isQuit(message))      	 return M_QUIT;
        else if (isMsgID(message))       return M_MSG_ID;
        else if (isUserID(message))      return M_USER_ID;
        else if (isChatRoomID(message))  return M_CHATROOM_ID;
        else if (isMsg(message))  		 return M_MSG;
        else if (isLogin(message))  	 return M_LOGIN;
        else if (isReplicaConnect(message))  	 return M_REPLICA_CONNECT;
        else if (isWelcome(message))  	 return M_WELCOME;
        else                             return M_INVALID; //not a valid message
    }
    /**
     * Method to determine if the Message is of type messageSend
     * @param String message
     * @return boolean
     */
    public static boolean isMessageSend (String message)
    {
        Matcher m = msgSendPattern.matcher(message);
        return m.matches();
    }
    /**Method to determine if the message is of type register
     * @param String message
     * @return boolean
     */
    public static boolean isRegister (String message)
    {
        Matcher m = registerPattern.matcher(message);
        return m.matches();
    }
    /**
     * Method to determine if the message is of type open
     * @param String message
     * @return boolean
     */
    public static boolean isOpen (String message)
    {
        Matcher m = openPattern.matcher(message);
        return m.matches();
    }
    /** Method to determine if the message is of type echo
     * @param String message
     * @return boolean
     */
    public static boolean isEcho(String message)
    {
        Matcher m = echoPattern.matcher(message);
        return m.find();
    }
    public static boolean isError(String message)
    {
        Matcher m = errorPattern.matcher(message);
        return m.find();
    }
    public static boolean isQuit(String message)
    {
        Matcher m = quitPattern.matcher(message);
        return m.find();
    }
    public static boolean isMsgID(String message)
    {
        Matcher m = msgIDPattern.matcher(message);
        return m.find();
    }
    public static boolean isUserID(String message)
    {
        Matcher m = userIDPattern.matcher(message);
        return m.find();
    }
    public static boolean isChatRoomID(String message)
    {
        Matcher m = chatRoomIDPattern.matcher(message);
        return m.find();
    }
    public static boolean isMsg(String message)
    {
        Matcher m = msgPattern.matcher(message);
        return m.find();
    }
    public static boolean isLogin(String message)
    {
        Matcher m = loginPattern.matcher(message);
        return m.find();
    }
    public static boolean isConnect(String message)
    {
        Matcher m = errorPattern.matcher(message);
        return m.find();
    }   
    public static boolean isPoll(String message)
    {
        Matcher m = errorPattern.matcher(message);
        return m.find();
    }
    public static boolean isPackage(String message)
    {
        Matcher m = errorPattern.matcher(message);
        return m.find();
    }
    public static boolean isAccept(String message)
    {
        Matcher m = errorPattern.matcher(message);
        return m.find();
    }
    public static boolean isInfo(String message)
    {
        Matcher m = errorPattern.matcher(message);
        return m.find();
    }
    public static boolean isReplicaConnect(String message)
    {
        Matcher m = replicaConnectPattern.matcher(message);
        return m.find();
    }
    public static boolean isWelcome(String message)
    {
        Matcher m = welcomePattern.matcher(message);
        return m.find();
    }
    public int getMessageType ()
    {
        return this.type;
    }
    /**
     * Convert the Message object to it's equivelent String as defined by the constant ENCODING
     * @return String
     */
    public String toString()
    {
        return messageString;
    }
}
