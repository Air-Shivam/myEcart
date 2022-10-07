package com.glkc.dao;

import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.glkc.entities.Category;

public class CategoryDao {

	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		this.factory = factory;
	}



	public List<Category> getCategories(){
		
		List<Category>list=new ArrayList<Category>();
		try {
			Session s=factory.openSession();
			String query="from Category";
			Query q=s.createQuery(query);
			list=q.list();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
		
		
	}
	public Category getCategoryById(int cId) {
		Category c=null;
		try {
			Session s=factory.openSession();
			c=s.get(Category.class, cId);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return c;
		
	}
	
	
}
