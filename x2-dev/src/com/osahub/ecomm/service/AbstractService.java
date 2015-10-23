package com.osahub.ecomm.service;

public abstract class AbstractService {
	
	/*
	 * Unique for every service
	 * */
	protected int serviceId;
	
	public void setServiceId(int serviceId){
		this.serviceId = serviceId;
	}
	
	public int getServiceId(){
		return this.serviceId;
	}
}