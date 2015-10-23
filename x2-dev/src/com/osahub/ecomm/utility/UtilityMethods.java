package com.osahub.ecomm.utility;

public class UtilityMethods {
	
	public static boolean isValidEmail(String subscriber){
		boolean result = true;
		if(subscriber == null || subscriber.length()<6){
			result = false;
		}else{
			int atpos=subscriber.indexOf("@");
			int dotpos=subscriber.lastIndexOf(".");
			if (atpos<1 || dotpos<atpos+2 || dotpos+2>=subscriber.length()){
				result = false;
			}
		}
		return result;
	}
}
