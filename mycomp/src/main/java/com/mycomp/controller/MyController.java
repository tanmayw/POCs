package com.mycomp.controller;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
@Controller

public class MyController {
	@Autowired
	private JavaMailSender mailSender;
	
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String display() {
		return "company";
	}

	
	
	@RequestMapping(value="/test" ,method = RequestMethod.POST)
	@ResponseBody
	String home( @RequestParam("email") String email,
			@RequestParam("inputMessage") String inputMessage,
			@RequestParam("phone") String phone)
	{
		/*List<String> resultString = new ArrayList<String>();
		resultString.add(email);
		resultString.add(inputMessage);
		resultString.add(phone);*/
		/*try
		{
		   // creates a simple e-mail object
        SimpleMailMessage emailMessage = new SimpleMailMessage();
        emailMessage.setTo("tanmay.waikar@gmail.com");
        emailMessage.setSubject("Requirement posted :" +phone);
        emailMessage.setText(inputMessage);
         
        // sends the e-mail
       // mailSender.send(emailMessage);		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(email + inputMessage + phone);
	
		return "Thank you, your query is posted is sent.";
		}catch(Exception e)
		{
			return "Error";
		}
		*/
		Properties props = new Properties();
        Session session = Session.getDefaultInstance(props, null);
 
     
 
        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress("tanmay.waikar@gmail.com","Your admin"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email, email));
           // msg.addRecipient(Message.RecipientType.BCC, new InternetAddress("tanmay.waikar@gmail.com", "Revolution Enterprises"));
            msg.setSubject("Quick Contact_"+phone+"_"+email);
            msg.setText(inputMessage);
            Transport.send(msg);
            return "Your request is taken";
        } catch (Exception e) {
           return "Error "+e.getMessage();
        }
 
       
    }

}
