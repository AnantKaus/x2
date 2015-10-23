package com.osahub.ecomm.controller;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.osahub.ecomm.bean.search.SearchBackingBean;
import com.osahub.ecomm.dao.shop.ProductDao;

@SuppressWarnings("serial")
public class SearchProductByIdServlet extends HttpServlet {
	SearchBackingBean bean;
	ProductDao product;
	HttpSession session ;
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		session = req.getSession();
		String productCode =  req.getParameter("productCodeSearch").trim().toUpperCase();
		bean = new SearchBackingBean();
		product = bean.SearchProductById(productCode);
		if( product == null){
			session.setAttribute("productCode", null);
			resp.sendRedirect("/admin.jsp?status=004#update");
		}
		else{
			//session.setAttribute("ProductDao", product);
			session.setAttribute("productCode", productCode);
			resp.sendRedirect("/admin.jsp#update");
		}
	}
}