package com.osahub.ecomm.controller;

import static com.osahub.ecomm.services.dataccess.OfyService.ofy;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.osahub.ecomm.bean.search.SearchBackingBean;
import com.osahub.ecomm.dao.shop.ProductDao;

@SuppressWarnings("serial")
public class UpdateProductServlet extends HttpServlet {
	SearchBackingBean bean;
	ProductDao product;
	HttpSession session ;

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		bean = new SearchBackingBean();
		session = req.getSession();
		
		String productCode = (String)session.getAttribute("productCode");
		//String productCode =  req.getParameter("productCodeUpdate").trim().toUpperCase(); 
		//String category = req.getParameter("category").trim().toUpperCase();
		String name = req.getParameter("nameUpdate").trim().toUpperCase(); 
		String description = req.getParameter("descriptionUpdate").trim();
		String mrp = req.getParameter("mrpUpdate").trim();
		int stockAvailable = Integer.parseInt(req.getParameter("stockAvailableUpdate").trim());
		String showOnWebsite = req.getParameter("showOnWebsite");
	
		product = bean.SearchProductById(productCode);
		//product.category = category;
		product.name = name;
		product.description = description;
		if( stockAvailable == 0)
			product.outOfStock = true;
		else
			product.outOfStock = false;
		product.showOnWebsite = Boolean.valueOf(showOnWebsite);
		
		product.updatedBy = "admin@swatidesignerwear.com";
		product.updatedOn = new Date();
		//Now save the object  
		ofy().save().entities(product);
		ofy().clear();
		session.setAttribute("productCode", null);
		resp.sendRedirect("/admin.jsp?status=005#update");
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		session = req.getSession();
		session.setAttribute("productCode", null);
		resp.sendRedirect("/admin.jsp#update");
	}
}