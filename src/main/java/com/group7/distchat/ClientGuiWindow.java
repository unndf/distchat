package com.group7.distchat;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JTextPane;
import javax.swing.JScrollBar;
import java.awt.Color;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.awt.event.ActionEvent;
import java.awt.Font;

public class ClientGuiWindow {

	private JFrame frame;
	private JTextField textField;
	private Client client = null;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					ClientGuiWindow window = new ClientGuiWindow();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public ClientGuiWindow() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		
		// Make instance of client

		try {
			client = new Client("localHost", 9999);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			//Print message saying client could not be created.
			e1.printStackTrace();
		}
		
		frame = new JFrame();
		frame.setBounds(100, 100, 463, 548);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		textField = new JTextField();
		textField.setBounds(6, 492, 342, 28);
		frame.getContentPane().add(textField);
		textField.setColumns(10);
		
		JButton btnSend = new JButton("Send");
		btnSend.setForeground(Color.BLACK);
		btnSend.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.out.println("Button Pressed");
				// Call send message method
				sendToClient(textField.getText());
				//client.sendMessage(textField.getText());		//Send message will be added in Client
				textField.setText("");
				
			}
		});
		btnSend.setBounds(340, 493, 117, 29);
		frame.getContentPane().add(btnSend);
		
		JLabel lblChatroom = new JLabel("Chatroom:");
		lblChatroom.setBounds(19, 47, 75, 16);
		frame.getContentPane().add(lblChatroom);
		
		JLabel label = new JLabel("<Default Text>");
		label.setBounds(89, 47, 166, 16);
		frame.getContentPane().add(label);
		
		JTextPane textPane = new JTextPane();
		textPane.setBackground(Color.WHITE);
		textPane.setBounds(19, 75, 411, 405);
		frame.getContentPane().add(textPane);
		
		JScrollBar scrollBar = new JScrollBar();
		scrollBar.setBackground(Color.LIGHT_GRAY);
		scrollBar.setForeground(Color.DARK_GRAY);
		scrollBar.setBounds(429, 42, 15, 439);
		frame.getContentPane().add(scrollBar);
		
		JLabel lblNewLabel = new JLabel("Chit-Chat Messaging!");
		lblNewLabel.setForeground(Color.RED);
		lblNewLabel.setFont(new Font("DIN Condensed", Font.BOLD, 24));
		lblNewLabel.setBounds(153, 6, 166, 42);
		frame.getContentPane().add(lblNewLabel);
	}
	private void sendToClient(String textToSend){
		client.sendMessage(textToSend);
	}

}
