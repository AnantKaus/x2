package com.osahub.ecomm.controller;
import com.google.appengine.api.datastore.Email;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class UserEnquriy {
   
   @Id String name;
    @Index Email mail;
    String sub;
    String Message;
	
    public UserEnquriy() {
	
	}
    
    public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Email getMail() {
		return mail;
	}
	public void setMail(Email mail) {
		this.mail = mail;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public String getMessage() {
		return Message;
	}
	public void setMessage(String message) {
		Message = message;
	}
    
    
	public UserEnquriy(String name, Email mail, String sub, String message) {
		super();
		this.name = name;
		this.mail = mail;
		this.sub = sub;
		Message = message;
	}
    
    
	
}