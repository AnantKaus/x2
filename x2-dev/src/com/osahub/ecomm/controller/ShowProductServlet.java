package com.osahub.ecomm.controller;

import static com.osahub.ecomm.utility.UtilityMethods.isValidEmail;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.osahub.ecomm.bean.mail.Sandesh;

public class ShowProductServlet extends HttpServlet {
	HttpSession session ;
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		session = req.getSession();
		session.setAttribute("productCode", null);
		session.setAttribute("subscriptionStatus", null);
		session.setAttribute("interestedStatus", null);
		

		String customer = req.getParameter("customer");
		String productCode = req.getParameter("productCode");
		
		if(isValidEmail(customer)){
			String mailBody="Hi,\n\nOne more person with email/contact No. "+customer+" showed his/her interested in your product "+ productCode+" at "+new Date()+".\n\nThanks and Regards,\nTeam OSAHUB";
			try{
				//if(new Sandesh("admin@faagg.com","Admin FAAGG","admin@osahub.com","Team OSAHUB", "New customer interested in your product.", mailBody).send())
				if(new Sandesh("admin@osahub.com","Admin FAAGG","admin@osahub.com","Team OSAHUB", "New customer interested in your product.", mailBody).send())
					session.setAttribute("interestedStatus", "success");
				else
					session.setAttribute("interestedStatus", "fail");
			}catch(Exception m){	
				session.setAttribute("interestedStatus", "fail");	
			}finally{
				resp.sendRedirect("/showProduct.jsp?productCode="+productCode);
			}
		}else{
			session.setAttribute("interestedStatus", "fail");
			resp.sendRedirect("/showProduct.jsp?productCode="+productCode);
		}
	}
}