package com.group7.distchat;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;

public class DBHandler
{
    //TODO: DONT USE THESE, THESE SHOULD BE PARAMETERIZED OR SOMETHING
    public static final String DB_LOCATION = "jdbc:h2:~/distchat";
    public static final String DB_USERNAME = "sa";
    public static final String DB_PASSWORD = "";

    Connection connection = null;
    Statement state = null;
    
    
    public DBHandler() throws ClassNotFoundException
    {
    	try{		//Try to create the state for the database (To alter it's elements)
	    	Class.forName("org.h2.Driver");
	    	connection = DriverManager.getConnection(DB_LOCATION, DB_USERNAME, DB_PASSWORD);
	        state = connection.createStatement();
            	//state.execute("insert into test values(1, 'JOHN')");
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
    /** Add a user to our table of users
     * @param String nick: nickname for our new user
     * @param String salt: The generated salt associated with the user (salts are generated using SHA512 on some seed value)
     * @param String hash: The result of SHA512(pass|salt) aka. SHA512(pass|SHA512(seed))
     * @return boolean: Adding a new user was a success or failure
    */
    public boolean addUser(String nick, String salt, String hash)
    {
        return false;
    }
    /** Checks is the user is a registered user
     * @param String nick: The users nick
     * @return boolean: is a user or not
     */
    public boolean userExists(String nick) throws SQLException 
    {
        ResultSet rs = state.executeQuery(String.format("SELECT * FROM DISTCHAT.USER WHERE NICK = '%s'", nick));
        return rs.next();
    }

    /** Checks if the room exists
     * @param String room: name of the room
     * @return boolean: room exists
     */
    public boolean roomExists(String room) throws SQLException
    {
        ResultSet rs = state.executeQuery(String.format("SELECT * FROM DISTCHAT.ROOM WHERE NAME = '%s'", room));
        return rs.next();
    }

    /**
     * add a message to the message table
     * @param int chatId: The Id of the chatroom we want to add a message to
     * @param String messageContent: The content of the message
     * @throws SQLException 
     */
    public boolean addMessage(int chatId, String messageContent) throws SQLException
    {
    	state.execute(String.format("INSERT INTO DISTCHAT.MESSAGE(CHAT_ID, CONTENT) values(%d, '%s')",chatId, messageContent));		//<- I would prefer to do  it like this, or similar to this. Oh, it might work now! 		
        return false;
    }

    /**
     * add a chatRoom to the list of chatRooms
     * @return boolean: add the room was either a success or failure
     * @throws SQLException 
     */
    public boolean addChatRoom(String roomName) throws SQLException
    {
    	state.execute("INSERT INTO DISTCHAT.ROOM(NAME) VALUES('"+roomName+"')");
        return false;
    }

    /**
     * returns the most recent message in the room cooresponding to chatId
     * @param int chatId: the id of the chat room we want to getMessage from
     * @return ArrayList<Message>
     * @throws SQLException 
     */
    public ArrayList<String> getRecentMessages(int chatId) throws SQLException
    {
    	ArrayList<String> listOfMsgs = new ArrayList<>();
    	int msgNumber = 0;	
    	ResultSet rs = state.executeQuery("SELECT * FROM DISTCHAT.MESSAGE WHERE CHAT_ID ="+ chatId); 
            while (msgNumber < 10) {			//Only get 10 messages for now.
            	if (rs.getString(msgNumber) != null){
            		listOfMsgs.add(rs.getString(msgNumber));
            		msgNumber++;
            	}else{
            		break;
            	}
            }
        return listOfMsgs;
    }

    /**
     * returns the most recent messages in the room cooresponding to roomName
     * @param String roomName: name of the chat room (must coorespond to a chatId)
     * @return ArrayList<Message>
     * @throws SQLException 
     */
    public ArrayList<String> getRecentMessages(String roomName) throws SQLException
    {
        int chatId = getChatId(roomName);
        try {
			return getRecentMessages(chatId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return null;		//Messages could not be retrieved 
    }
    /** returns an arrayList of all the messages after the given message id
     * @param int chatId: The id of the chatroom we'd like to get messages from
     * @param int mId: the id of the last message we're not intrested (we'd like to get all messages after this id)
     * @return ArrayList<String>: The list of messages. Can be empty
     */
    public ArrayList<String> getMessagesAfter(int chatId, int mId) throws SQLException
    {
        ResultSet rs = state.executeQuery(String.format("SELECT CONTENT FROM DISTCHAT.MESSAGE WHERE CHAT_ID = %d AND M_ID > %d",chatId,mId));
        ArrayList<String> ret = new ArrayList<String>();
        while (rs.next())
        {
            ret.add(rs.getString(1)); // we only have a single column anyways
        }
        return ret;
    }
    /** gets the m_id of the latest message in the chatroom
     * @param int chatId: chatId of the room
     * @return int: The M_ID of the last message in the room
     */
    public int getLatestMessageId(int chatId) throws SQLException
    {
        ResultSet rs = state.executeQuery(String.format("SELECT MAX(M_ID) FROM DISTCHAT.MESSAGE WHERE CHAT_ID = %d",chatId));
        rs.next();
        return rs.getInt(1);
    }
    /** returns the chatId of the room in question
     * @param String roomName
     * @return int chatId
     * @throws SQLException 
     */
    public int getChatId(String roomName) throws SQLException
    {
    	ResultSet rs = state.executeQuery(String.format("SELECT CHAT_ID FROM DISTCHAT.ROOM WHERE NAME = '%s'", roomName));
        rs.first();
        return rs.getInt("chat_id");
    }

    /** Close the database connection and cleanup
     * @return Nothing
     */
    public void closeConnection()
    {
        //cleanup
        try
        {
            connection.close();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
    }
}
