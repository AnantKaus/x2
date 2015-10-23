package com.osahub.ecomm.dao.shop;
import java.util.Date;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.datastore.Blob;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

/* 
 * Create() may be called in different services depending upon number of constructor.
 * Read() may be called in different services depending upon number of properties which are indexed.
 * Update() & Delete() will be called only once from one place.
 *
 * Method		Service Id
 * C reate	:	1001
 * U pdate	:
 * R ead	:	By productCode : 1001, By category & showOnWebsite : 1002, By description = 1001
 * D elete	:
 * */

@Entity
public class ProductDao{
	@Id public String productCode ;
	
	/*
	 * Possible value for property type are
	 * 1 : 
	 * */
	@Index public String category;
	public String name;
	@Index public String description;
	public String createdOn;
	public String createdBy;
	
	public Boolean outOfStock = false;
	@Index public Boolean showOnWebsite = true;
	public BlobKey image1 = null;
	public BlobKey image2 = null;
	public BlobKey image3 = null;
	public BlobKey image4 = null;
	public BlobKey image5 = null;
	public Date updatedOn = null;
	public String updatedBy = null;
	

	public int viewCount=0;
		
	//default constructor for objectify
	public ProductDao(){
		
	}
	
	//constructor
	public ProductDao(String productCode, BlobKey image1, String category, String name, String description, String createdBy, String date ) {
		super();
		this.productCode = productCode;
		this.category = category;
		this.name = name;
		this.description = description;
		this.createdBy = createdBy;
		this.createdOn = date;
		this.image1 = image1;
	}
}