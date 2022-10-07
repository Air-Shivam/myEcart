package com.glkc.dao;

import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.glkc.entities.Product;

public class ProductDao {

	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	
	public int saveProduct(Product p) {
		Session s=factory.openSession();
		Transaction tx=s.beginTransaction();
		int pId=(Integer)s.save(p);
		tx.commit();
		s.close();
		return pId;
	}
	
	public List<Product> getProducts(){
		List<Product> plist=new ArrayList<Product>();
		
		try {
			Session s=factory.openSession();
			Query q=s.createQuery("from Product");
			plist=q.list();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return plist;
	}
	
	
	
	public List<Product> getProductsById(int cid){
		List<Product> plist=new ArrayList<Product>();
		
		try {
			Session s=factory.openSession();
			Query q=s.createQuery("from Product as p where p.category.categoryId=:x");
			q.setParameter("x", cid);
			plist=q.list();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return plist;
	}
	
}
