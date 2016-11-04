package com.group7.distchat;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.util.ArrayList;

public class Client {
	static String host = "";
	static int port = -1;
	public static void main(String[] args) {
		if (args.length != 2)
			System.exit(1);

		host	= args[0];
		port	= Integer.parseInt( args[1] );
		String toSend		= null;
		String incoming = "";
		
		try {
			Socket socket = new Socket(host, port);
			if ( socket == null )		// catch NullPointerExceptions
				return;

			BufferedReader inFromUser = new BufferedReader( new InputStreamReader(System.in));
			BufferedWriter sendToServer	= new BufferedWriter( new OutputStreamWriter( socket.getOutputStream() ) );
			BufferedReader receiveFromServer = new BufferedReader( new InputStreamReader( socket.getInputStream() ) );

			while(true){		
				// Get keyboard input from user, to send to server
				System.out.print("Input Message: ");
				System.out.flush();
				toSend = inFromUser.readLine();
				
				if (toSend.equals("quit"))		//Can change this later, just need a way to break out of loop
					break;
				
				sendToServer.write(toSend + '\n');
				sendToServer.flush();
				
				// Response back from server
				incoming = receiveFromServer.readLine();
				//System.out.println("Incoming message: " + incoming);	//This is where we check to see if the server
																		// responds with a "message received"
				if (incoming.equals("Error")){
					
				}else if (incoming.equals("Failure")){
					
				}else{
					// If the message was good (no issues), then the response should be just a confirmation
					System.out.println("Message was received by server");
				}
				} //While 
			//socket.close();
			} // try

		catch (Exception e) {

			System.err.println( "ERROR: Got exception: " + e.getMessage() );
			e.printStackTrace();
			}
	} // main

}
