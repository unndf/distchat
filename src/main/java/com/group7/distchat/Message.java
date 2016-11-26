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
    public static final int M_EXIT = 1018;
    public static final int M_LOGOUT = 1019;
    public static final int M_OK = 1020;
   
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
    public static Pattern okPattern;
    public static Pattern welcomePattern;
    public static Pattern exitPattern;				//Exit is for exiting a chat room, so a user can join a different one. 
    public static Pattern logoutPattern;				//Logout is for leaving the chat room program

    public int id = M_INVALID;
    //message type
    private int type = M_INVALID;
    private String messageString = "";
    
    //init patterns
    static
    {
        msgSendPattern = Pattern.compile("^message-send\\r?\\n([\\w-]+)\\r?\\n([\\w-]+)\\r?\\n(.+)\\r?\\n",Pattern.DOTALL);
        registerPattern = Pattern.compile("^register\\r?\\n([\\w-]+)\\r?\\n",Pattern.DOTALL);
        openPattern = Pattern.compile("^open\\r?\\n([\\w-]+)\\r?\\n",Pattern.DOTALL);
        echoPattern = Pattern.compile("^echo\\r?\\n(.+)\\r?\\n",Pattern.DOTALL);
        errorPattern = Pattern.compile("^error\\r?\\n(.+)\\r?\\n",Pattern.DOTALL);
        quitPattern = Pattern.compile("^quit\\r?\\n\\r?\\n", Pattern.DOTALL);
        msgIDPattern = Pattern.compile("^msgID\\r?\\n([0-9]+)\\r\\n", Pattern.DOTALL);
        userIDPattern = Pattern.compile("^userID\\r?\\n([0-9]+)\\r\\n", Pattern.DOTALL);
        chatRoomIDPattern = Pattern.compile("^chatRoomID\\r?\\n([0-9]+)\\r\\n", Pattern.DOTALL);
        msgPattern = Pattern.compile("^msg\\r?\\n(.+)\\r?\\n", Pattern.DOTALL);
        loginPattern = Pattern.compile("^login\\r?\\n([\\w-]+)\\r?\\n", Pattern.DOTALL);
        connectPattern = Pattern.compile("^connect\\r?\\n",Pattern.DOTALL);
        pollPattern = Pattern.compile("^poll\\r?\\n(info|users|rooms|messages)\\r?\\n(.*)\\r?\\n",Pattern.DOTALL);
        packagePattern = Pattern.compile("^package\\r?\\n(.+)\\r?\\n",Pattern.DOTALL);
        acceptPattern = Pattern.compile("^error\\r?\\n(.+)\\n",Pattern.DOTALL);
        infoPattern = Pattern.compile("^error\\r?\\n(.+)\\n",Pattern.DOTALL);
        replicaConnectPattern = Pattern.compile("^replica connect\\r?\\n",Pattern.DOTALL);
        okPattern = Pattern.compile("^ok\\r?\\n(.+)\\r?\\n",Pattern.DOTALL);
        welcomePattern = Pattern.compile("^Welcome, \\r?\\n(.+)\\r\\n", Pattern.DOTALL);
        exitPattern = Pattern.compile("^exit\\r\\n", Pattern.DOTALL);
        logoutPattern = Pattern.compile("^logout\\r\\n", Pattern.DOTALL);
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
                || isOk(messageString)
                || isWelcome(messageString)
                || isExit(messageString)
                || isLogout(messageString)
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
            else if (isOk(messageString)){
                Matcher m = okPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isConnect(messageString)){
                Matcher m = connectPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isPoll(messageString)){
                Matcher m = pollPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isPackage(messageString)){
                Matcher m = packagePattern.matcher(messageString);
                m.matches();
                retMessageString = m.group(0);
            }
            else if (isAccept(messageString)){
                Matcher m = acceptPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isInfo(messageString)){
                Matcher m = infoPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isConnect(messageString)){
                Matcher m = connectPattern.matcher(messageString);
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
            else if (isExit(messageString)){
                Matcher m = exitPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isLogout(messageString)){
                Matcher m = logoutPattern.matcher(messageString);
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
    public static Message getMessage (String input)
    {
        ByteBuffer buff = ByteBuffer.wrap(input.getBytes());
        return getMessage(buff);
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
        else if (isOk(message))          return M_OK;
        else if (isConnect(message))	 return M_CONNECT;
        else if (isPoll(message))	 	 return M_POLL;
        else if (isPackage(message))	 return M_PACKAGE;
        else if (isAccept(message))	 	 return M_ACCEPT;
        else if (isInfo(message))	 	 return M_INFO;
        else if (isReplicaConnect(message))  	 return M_REPLICA_CONNECT;
        else if (isWelcome(message))  	 return M_WELCOME;
        else if (isExit(message))  	 	 return M_EXIT;
        else if (isLogout(message))  	 return M_LOGOUT;
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
        return m.find();
    }
    public static String messageSendGetRoom (String message)
    {
        Matcher m = msgSendPattern.matcher(message);
        m.find();
        return m.group(1);
    }
    public static String messageSendGetNick (String message)
    {
        Matcher m = msgSendPattern.matcher(message);
        m.find();
        return m.group(2);
    }
    public static String messageSendGetContent (String message)
    {
        Matcher m = msgSendPattern.matcher(message);
        m.find();
        return m.group(3);
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
        return m.find();
    }
    public static String openGetRoomName (String message)
    {
        Matcher m = openPattern.matcher(message);
        m.find();
        return m.group(1);
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
    public static String loginGetUsername (String message) {
        Matcher m = loginPattern.matcher(message);
        m.find();
        return m.group(1);
    }
    public static boolean isOk (String message)
    {
        Matcher m = okPattern.matcher(message);
        return m.find();
    }
    public static String okGetMessage (String message)
    {
        Matcher m  = okPattern.matcher(message);
        m.find();
        return m.group(1);
    }
    public static boolean isConnect(String message)
    {
        Matcher m = connectPattern.matcher(message);
        return m.find();
    }   
    public static boolean isPoll(String message)
    {
        Matcher m = pollPattern.matcher(message);
        return m.find();
    }
    public static String pollGetRoom(String message)
    {
        Matcher m = pollPattern.matcher(message);
        m.find();
        return m.group(2);
    }
    public static boolean isPackage(String message)
    {
        Matcher m = packagePattern.matcher(message);
        return m.matches();
    }
    public static boolean isAccept(String message)
    {
        Matcher m = acceptPattern.matcher(message);
        return m.find();
    }
    public static boolean isInfo(String message)
    {
        Matcher m = infoPattern.matcher(message);
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
    public static boolean isExit(String message)
    {
        Matcher m = exitPattern.matcher(message);
        return m.find();
    }
    public static boolean isLogout(String message)
    {
        Matcher m = logoutPattern.matcher(message);
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
