package com.osahub.ecomm.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

@SuppressWarnings("serial")
public class AddProductToCartServlet extends HttpServlet {
    private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	HttpSession session ;

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		session = req.getSession();

		String userEmail = (String)session.getAttribute("loggedInUserEmail");
		String userName = (String)session.getAttribute("loggedInUserName");
		String productCode = (String)req.getParameter("productCode");
		ArrayList<String> cart= (ArrayList<String>)session.getAttribute("shoppingCart");
		
		if(userEmail != null && userName != null){
			//set data to cart
			if(cart == null){
				cart = new ArrayList<String>();
			}
			cart.add(productCode);
			session.setAttribute("shoppingCart", cart);
			resp.sendRedirect("/showProduct.jsp?productCode="+productCode);
		}else{
			session.setAttribute("loggedInUserEmail", null);
			session.setAttribute("loggedInUserName", null);
			resp.sendRedirect("/login.html");
		}

		
	}
}