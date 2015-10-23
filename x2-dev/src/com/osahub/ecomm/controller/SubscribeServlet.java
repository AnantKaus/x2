package com.osahub.ecomm.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.osahub.ecomm.bean.mail.Sandesh;
import static com.osahub.ecomm.utility.UtilityMethods.isValidEmail;

@SuppressWarnings("serial")
public class SubscribeServlet extends HttpServlet {
	HttpSession session ;
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		session = req.getSession();
		session.setAttribute("productCode", null);
		session.setAttribute("subscriptionStatus", null);
		

		String subscriber = req.getParameter("subscriber");
		
		if(isValidEmail(subscriber)){
			String mailBody="Hi,\n\nOne more person with email "+subscriber+" has subscribe to your mail list at "+new Date()+".\n\nThanks and Regards,\nTeam OSAHUB";
			try{
				if(new Sandesh("swaticreators@gmail.com","Admin SwatiDesignerWear","admin@osahub.com","Team OSAHUB", "New subscriber for SwatiDesignerWear mail list.", mailBody).send())
					session.setAttribute("subscriptionStatus", "success");
				else
					session.setAttribute("subscriptionStatus", "fail");
			}catch(Exception m){	
				session.setAttribute("subscriptionStatus", "fail");	
			}finally{
				resp.sendRedirect("/index.jsp");
			}
		}else{
			session.setAttribute("subscriptionStatus", "fail");
			resp.sendRedirect("/index.jsp");	
		}
	}
}