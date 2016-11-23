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
    	state.execute(String.format("INSERT INTO DISTCHAT.MESSAGE(M_ID, CHAT_ID, CONTENT) values(%d, %d, '%s')", 0 ,chatId, messageContent));		//<- I would prefer to do  it like this, or similar to this. Oh, it might work now! 		
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
