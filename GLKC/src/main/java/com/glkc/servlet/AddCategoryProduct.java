package com.glkc.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


import org.hibernate.Session;
import org.hibernate.Transaction;

import com.glkc.dao.CategoryDao;
import com.glkc.dao.ProductDao;
import com.glkc.entities.Category;
import com.glkc.entities.Product;
import com.glkc.entities.User;
import com.glkc.helper.FactoryProvider;



@MultipartConfig
public class AddCategoryProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public AddCategoryProduct() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 PrintWriter out=response.getWriter();
		try {
			String type=request.getParameter("operation");
			
			if(type.equals("addcategory")) {
				
				String ctitle=request.getParameter("catTitle");
				String cdesc=request.getParameter("catDescription");
				
		
				Category category=new Category(ctitle,cdesc);
				//adding into database
				Session session=FactoryProvider.getFactory().openSession();
				Transaction tx=session.beginTransaction(); 
				int catId = (Integer) session.save(category);
					tx.commit();	
				session.close();
				HttpSession httpSession=request.getSession();
				httpSession.setAttribute("message","Added Successlly"+ catId);
				response.sendRedirect("admin.jsp");
				return;
				
			}else {
				String pName=request.getParameter("pName");
				String pDesc=request.getParameter("pDesc");
				int pPrice=Integer.parseInt(request.getParameter("pPrice"));
				int  pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
				int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));		
				int catId=Integer.parseInt(request.getParameter("catId"));
				
				//for adding multipart data
			    Part part=request.getPart("pPic");
			
			    
			    
			    
			    //getting category by id
				CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
				Category category=cdao.getCategoryById(catId);
		
				
				
				// reating new object of product
				Product p=new Product(pName,pDesc,part.getSubmittedFileName(),pPrice, pDiscount,pQuantity,
						category);
			    ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
				int pId= pdao.saveProduct(p);
			    
			    // finding a path to upload photo
			    String path=request.getRealPath("image")+File.separator+"products"+File.separator+part.getSubmittedFileName();;
		            out.print(path);
		           
			    try {
					
			    	FileOutputStream fos=new FileOutputStream(path);
			    	InputStream is=part.getInputStream();
			    	//reading data
			    	byte [] data=new byte[is.available()];
			    	is.read(data);
			    	fos.write(data);
			    	fos.close();
			    	
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				} 
			    
			    
			    
				HttpSession httpSession=request.getSession();
				httpSession.setAttribute("message","Added Successlly");
				response.sendRedirect("admin.jsp");
			
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
	}

}
