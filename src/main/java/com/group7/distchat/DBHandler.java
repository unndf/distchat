package com.group7.distchat;

import java.sql.*;
import java.util.ArrayList;

public class DBHandler
{
    //TODO: DONT USE THESE, THESE SHOULD BE PARAMETERIZED OR SOMETHING
    public static final String DB_LOCATION = "jdbc:h2:~/distchat";
    public static final String DB_USERNAME = "sa";
    public static final String DB_PASSWORD = "";
    
    public Connection connection = null;
    public DBHandler()
    {
        try
        {
        //load H2 driver
            Class.forName("org.h2.Driver");
            connection = DriverManager.getConnection(DB_LOCATION, DB_USERNAME, DB_PASSWORD);
        }
        catch (ClassNotFoundException e)
        {
            //H2 driver not loaded
            e.printStackTrace();
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
    public boolean addUser(String nick, String salt, String hash)
    {
        return false;
    }
    /**
     * add a message to the message table
     * @param int chatId: The Id of the chatroom we want to add a message to
     * @param String messageContent: The content of the message
     */
    public boolean addMessage(int chatId, String messageContent)
    {
        return false;
    }
    /**
     * add a chatRoom to the list of chatRooms
     * @return boolean: add the room was either a success or failure
     */
    public boolean addChatRoom(String roomName)
    {
        return false;
    }
    /**
     * returns the most recent message in the room cooresponding to chatId
     * @param int chatId: the id of the chat room we want to getMessage from
     * @return ArrayList<Message>
     */
    public ArrayList<Message> getMessage(int chatId)
    {
        return null;
    }
    /**
     * returns the most recent messages in the room cooresponding to roomName
     * @param String roomName: name of the chat room (must coorespond to a chatId)
     * @return ArrayList<Message>
     */
    public ArrayList<Message> getMessage(String roomName)
    {
        int chatId = getChatId(roomName);
        return getMessage(chatId);
    }
    /** returns the chatId of the room in question
     * @param String roomName
     * @return int chatId
     */
    public int getChatId(String roomName)
    {
        return -1;
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
