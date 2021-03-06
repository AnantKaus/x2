package com.osahub.ecomm.services.search;

import com.osahub.ecomm.dao.shop.ProductDao;
import com.osahub.ecomm.service.AbstractService;

import static com.osahub.ecomm.services.dataccess.OfyService.ofy;

public class SearchService extends AbstractService{
	
	//constructor
	public SearchService(){
		serviceId = 1001;
	}
	
	public ProductDao inquireProductById(String productCode){
		return ofy().load().type(ProductDao.class).id(productCode).now();
	}
	
	public ProductDao inquireProductByDescription(String description){
		return ofy().load().type(ProductDao.class).filter("description", description).first().now();
	}
}
