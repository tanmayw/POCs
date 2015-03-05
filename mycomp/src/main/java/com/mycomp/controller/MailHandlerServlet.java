package com.mycomp.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MailHandlerServlet extends HttpServlet { 
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws IOException {
    	 try {
                Properties props = new Properties(); 
                Session session = Session.getDefaultInstance(props, null); 
               
					MimeMessage message = new MimeMessage(session, req.getInputStream());
				} catch (MessagingException e) {
				  
				}

}
}
