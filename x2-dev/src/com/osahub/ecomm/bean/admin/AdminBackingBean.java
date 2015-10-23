package com.osahub.ecomm.bean.admin;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.osahub.ecomm.bean.mail.Sandesh;

public class AdminBackingBean {
	public static int isAdminLoggedIn(HttpServletRequest request) {
		if( request.getUserPrincipal() == null )
			return 0;
		else if(request.getUserPrincipal().getName().equalsIgnoreCase("admin@x2entertainments.com") || request.getUserPrincipal().getName().equalsIgnoreCase("admin@osahub.com"))
			return 1; 
		else{
			try{
				String tressPasser = request.getUserPrincipal().getName();
				String mailBody="Hi,\n\nAn attempt has been made at "+new Date()+" to login into Admin Panel of FAAGG.com using your email-id.\n\nIf it was by mistake, then please avoid any such attempt in future.\n\nAnd if you think it is an issue, please forward this e-mail to support@FAAGG.com .\n\nRegards,\nSecurity Team FAAGG";
				
				new Sandesh(tressPasser,tressPasser,"admin@faagg.com","Security Team FAAGG", "Unauthorized access to FAAGG Admin Panel.", mailBody).send();
			}catch(Exception m){
				System.out.println("\n\nerror while sending mail for unautorize access of Admin Panel of FAAGG.com \n\n");
				m.printStackTrace();	   	
			}finally{
				return 2;	
			}
		}
	}
}
