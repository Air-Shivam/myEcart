package com.glkc.dao;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.glkc.entities.User;

public class UserDao {
	private  SessionFactory factory;
	
	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public User getUserByEmailPassword(String email,String password) {
		
		User user=null;
		
		try {
		Session s=this.factory.openSession();
		String query="from User where userEmail=:e and userPassword=:p";
		Query q=s.createQuery(query);
			q.setParameter("e",email);
			q.setParameter("p",password);
			 user=(User)q.uniqueResult();
			 s.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return user;
		
	}
	

}
