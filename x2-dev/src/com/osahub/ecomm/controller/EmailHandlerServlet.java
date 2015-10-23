package com.osahub.ecomm.controller;

import static com.osahub.ecomm.services.dataccess.OfyService.ofy;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.osahub.ecomm.bean.mail.Sandesh;
import com.osahub.ecomm.dao.shop.ProductDao;
import com.osahub.ecomm.services.dataccess.OfyService;

@SuppressWarnings("serial")
public class EmailHandlerServlet extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		ProductDao product = null;
		String sender =  req.getParameter("sender").trim().toUpperCase(); 
		String recipientEmail = req.getParameter("recipientEmail").trim().toUpperCase();
		String recipientName = req.getParameter("recipientName").trim().toUpperCase();
		String subject = req.getParameter("subject").trim();
		String aboutMe = req.getParameter("aboutMe").trim();
		

		try{
			new Sandesh(recipientEmail, recipientName,"admin@swatidesignerwear.com", "Admin, Swati Designer Wear", subject, aboutMe).send();
			resp.sendRedirect("/admin.jsp?status=006#email");
		}catch(Exception m){
			resp.sendRedirect("/admin.jsp?status=007#email");   	
		}
	}
}