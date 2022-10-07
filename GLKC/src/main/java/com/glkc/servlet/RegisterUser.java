package com.glkc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.glkc.entities.User;
import com.glkc.helper.FactoryProvider;


public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public RegisterUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PrintWriter out=response.getWriter();
		try {
		
	String userName=request.getParameter("user_name");	
	String userEmail=request.getParameter("user_email");
	String userPassword=request.getParameter("user_password");
	String userPhone=request.getParameter("user_phone");
	String userAddress=request.getParameter("user_address");
     
	//Basic validations
	if(userName.isEmpty()) {
		 out.println("Name is blank");
		 return;
	}
	//creating user object to store in datebase
	User user=new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, "normal");
	Session session=FactoryProvider.getFactory().openSession();
	Transaction tx=session.beginTransaction(); 
		int userId=(Integer) session.save(user);
		
		//out.print(userId);
		tx.commit();	
	session.close();
	HttpSession httpSession=request.getSession();
	httpSession.setAttribute("message","Registration successful");
	response.sendRedirect("register.jsp");
	return;
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
		
		
	}

}
