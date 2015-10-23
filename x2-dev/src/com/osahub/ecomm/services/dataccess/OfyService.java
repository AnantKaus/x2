package com.osahub.ecomm.services.dataccess;

import com.osahub.ecomm.dao.shop.ProductDao;
import com.googlecode.objectify.*;


public class OfyService {
    static {
        factory().register(ProductDao.class);
    }

    public static Objectify ofy() {
        return ObjectifyService.ofy();
    }

    public static ObjectifyFactory factory() {
        return ObjectifyService.factory();
    }
}