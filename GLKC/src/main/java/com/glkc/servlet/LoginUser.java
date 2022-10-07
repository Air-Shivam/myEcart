package com.glkc.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.glkc.dao.UserDao;
import com.glkc.entities.User;
import com.glkc.helper.FactoryProvider;


public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public LoginUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String userEmail=request.getParameter("user_email");
		String userPassword=request.getParameter("user_password");
		
		UserDao udao=new UserDao(FactoryProvider.getFactory());
		User user=udao.getUserByEmailPassword(userEmail, userPassword);
		HttpSession httpSession=request.getSession();
		
		if(user==null) {
			httpSession.setAttribute("message","New User.. Please Register First");
			response.sendRedirect("register.jsp");
			return;
		}else {
		
			httpSession.setAttribute("current-user",user);
			if(user.getUserType().equals("admin")) {
				response.sendRedirect("admin.jsp");
			}else {
				response.sendRedirect("normal.jsp");
			}
			return;
		}
		
	}

}
