package com.osahub.ecomm.bean.shop;

import com.osahub.ecomm.dao.shop.ProductDao;
import com.osahub.ecomm.services.shop.*;

public class ShopBackingBean {
	ProductDao product;
	ShopService service;
	
	public ProductDao SearchProductById(String productCode){
		product = service.inquireProductById(productCode);
		return product;
	}
	
	public ProductDao SearchProductByDescription(String description){
		product = service.inquireProductByDescription(description);
		return product;
	}
	
	public ShopBackingBean(){
		this.service = new ShopService();
	}	
}
