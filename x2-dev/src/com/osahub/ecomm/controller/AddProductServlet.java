package com.osahub.ecomm.controller;

import static com.osahub.ecomm.services.dataccess.OfyService.ofy;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.osahub.ecomm.dao.shop.ProductDao;
import com.osahub.ecomm.services.dataccess.OfyService;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

@SuppressWarnings("serial")
public class AddProductServlet extends HttpServlet {
    private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	HttpSession session ;

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		session = req.getSession();
		session.setAttribute("productCode", null);
		
		Map<String, BlobKey> blobs = blobstoreService.getUploadedBlobs(req);
        BlobKey image1 = blobs.get("image1_small");

        /*if (blobKey == null) {
        	resp.sendRedirect("/");
        } else {
        	resp.sendRedirect("/serve?blob-key=" + blobKey.getKeyString());
        }*/
		
		ProductDao product = null;
		
		String productCode =  req.getParameter("productCode").trim().toUpperCase(); 
		String category = req.getParameter("category").trim().toUpperCase();
		/*String subCategory = req.getParameter("subCategory").trim().toUpperCase();*/
		String name = req.getParameter("name").trim().toUpperCase();
		String description = req.getParameter("description").trim();
		String date = req.getParameter("date").trim();
		/*String mrp = req.getParameter("mrp").trim();
		String stockAvailable = req.getParameter("stockAvailable").trim();*/
		
		try{
			product = OfyService.ofy().load().type(ProductDao.class).id(productCode).now();
		} catch ( Exception e){
			resp.sendRedirect("/admin.jsp?status=002#add");
		}
		
		if(product == null){
			ProductDao i = new ProductDao(productCode, image1, category,  name, description, "admin@x2entertainments.com", date);
			//Now save the object  
			ofy().save().entities(i);
			ofy().clear();
			resp.sendRedirect("/admin.jsp?status=001#add");
		}
		else
			resp.sendRedirect("/admin.jsp?status=003#add");
	}
}