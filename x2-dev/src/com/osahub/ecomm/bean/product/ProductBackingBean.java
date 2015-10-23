package com.osahub.ecomm.bean.product;

import java.util.List;

import com.osahub.ecomm.dao.shop.ProductDao;
import com.osahub.ecomm.services.product.ProductService;

public class ProductBackingBean {
	ProductDao product;
	ProductService service;
	
	public List<ProductDao> SearchProductByCategory(String productCategory){
		return service.inquireProductByCategory(productCategory);
	}
	
	public List<ProductDao> SearchProductBySubCategory(String productSubCategory){
		return service.inquireProductBySubCategory(productSubCategory);
	}
	
	public String getCategoryName(int productCategory){
		String category = "";
		switch (productCategory) {
		case 1:
			category =  "Fashion";
			break;
			
		case 2:
			category =  "Accessories";
			break;
			
		case 3:
			category =  "Art Work";
			break;
			
		case 4:
			category =  "G-Shop";
			break;
			
		case 5:
			category =  "Gallery";
			break;

		default:
			break;
		}
		return category ;
	}
	
	public String getSubCategoryName(int productSubCategory){
		String category = "";
		switch (productSubCategory) {
		case 11:
			category =  "Fashion1";
			break;
		case 12:
			category =  "Fashion2";
			break;
			
		case 21:
			category =  "Accessories1";
			break;
			
		case 22:
			category =  "Accessories2";
			break;
			
		case 31:
			category =  "Art Work1";
			break;
			
		case 32:
			category =  "Art Work2";
			break;
			
		case 41:
			category =  "G-Shop1";
			break;
			
		case 42:
			category =  "G-Shop2";
			break;
			
		case 51:
			category =  "Gallery1";
			break;
			
		case 52:
			category =  "Gallery2";
			break;

		default:
			break;
		}
		return category ;
	}
	
	public ProductBackingBean(){
		this.service = new ProductService();
	}	
}