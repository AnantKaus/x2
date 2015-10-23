package com.osahub.ecomm.controller;

import java.io.IOException;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.Email;
import com.googlecode.objectify.Key;



@SuppressWarnings("serial")
public class DatastoreServlet extends HttpServlet {
	
	String name;
	String email;
	String subject;
	String message;
	
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
		
		resp.setContentType("text/plain");

		
		

	name = 	(String) req.getParameter("name");
	email = (String)req.getParameter("email");
	Email e = new Email(email);
	
	subject = "Online Enquiry  ";
	message = (String)req.getParameter("message");
	
	if(name == null || email == null || subject == null || message == null || name == "" || email == ""|| subject == ""|| message == "")
	{
		resp.getWriter().write("false");
	}
		
	else{
		UserEnquriy u = new UserEnquriy(name, e, subject, message);
		OfyService.ofy().save().entity(u);
		
	    Properties props = new Properties();
	    Session session = Session.getDefaultInstance(props, null);
	    
	    
	   
	    try {
	    	
	    	//String address = "admin@x2entertainments.com,admin@osahub.com";
	    	String address = "admin@osahub.com";
	    	InternetAddress[] iAdressArray = InternetAddress.parse(address);
	    	
	    	Message msg = new MimeMessage(session);
	        msg.setFrom(new InternetAddress("admin@osahub.com"));
	        msg.setRecipients(Message.RecipientType.CC, iAdressArray);
	       
	        msg.setSubject("User_Enquiry : "+subject);
	        System.out.println("name: "+name+"\n"+"email id: "+email+"\n"+"Messege:"+message);
	        msg.setText("name: "+name+"\n"+"email id: "+email+"\n"+"Messege:"+message);
	        Transport.send(msg);


	    } catch (Exception exception) {
	    	
	    	resp.getWriter().write("false");
	      
	    } 
	
	    resp.sendRedirect("index.html#home");
	   /*resp.sendRedirect("http://www.x2entertainments.com/index.html#home");*/ 
	    
	}
	}	
}
