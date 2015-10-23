package com.osahub.ecomm.bean.search;

import com.osahub.ecomm.dao.shop.ProductDao;
import com.osahub.ecomm.services.search.SearchService;

public class SearchBackingBean {
	ProductDao product;
	SearchService service;
	
	public ProductDao SearchProductById(String productCode){
		product = service.inquireProductById(productCode);
		return product;
	}
	
	public ProductDao SearchProductByDescription(String description){
		product = service.inquireProductByDescription(description);
		return product;
	}
	
	public SearchBackingBean(){
		this.service = new SearchService();
	}	
}
