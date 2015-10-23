package com.osahub.ecomm.services.product;

import static com.osahub.ecomm.services.dataccess.OfyService.ofy;

import java.util.List;

import com.osahub.ecomm.dao.shop.ProductDao;
import com.osahub.ecomm.service.AbstractService;

public class ProductService extends AbstractService{
	
	//constructor
	public ProductService(){
		serviceId = 1002;
	}
	
	public List<ProductDao> inquireProductByCategory(String productCategory){
		return ofy().load().type(ProductDao.class).filter("category", productCategory).filter("showOnWebsite", true).list();
	}
	
	public List<ProductDao> inquireProductBySubCategory(String productSubCategory){
		return ofy().load().type(ProductDao.class).filter("showOnWebsite", true).list();
	}
	
}
