package com.osahub.ecomm.controller;
import com.googlecode.objectify.ObjectifyFactory;
import com.googlecode.objectify.*;


public class OfyService {
    static {
        //factory().register(Car.class);
        factory().register(UserEnquriy.class);
               
    }

    public static Objectify ofy() {
        return ObjectifyService.ofy();
    }

    public static ObjectifyFactory factory() {
        return ObjectifyService.factory();
    }
}