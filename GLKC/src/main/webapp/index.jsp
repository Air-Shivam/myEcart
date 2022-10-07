<%@page import="com.glkc.dao.ProductDao" %>
<%@page import="com.glkc.dao.CategoryDao" %>
<%@page import="com.glkc.entities.Product" %>
<%@page import="com.glkc.entities.Category" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.glkc.helper.FactoryProvider"%>
<%@page import="com.glkc.helper.Helper" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GLKC-Home</title>
<%@include file= "component/common_js_css.jsp"%>
</head>
<body>
<%@include file="component/navbar.jsp"%>


<%
     
   String cat= request.getParameter("category");

    List<Category> clist=null;
   CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
   clist=cdao.getCategories();

     List<Product> plist=null;
    ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
    
     
     if(cat==null||cat.trim().equals("all")){
    	 plist=pdao.getProducts();
    	 
     }else{
    	int cid= Integer.parseInt(cat.trim());
    	plist=pdao.getProductsById(cid);
     }
%>
 <div class="container-fluid">
 <div class="row mt-3 mx-2">
 
 
 
 
 <!-- Showing categories -->
 
 
 
 <div class="col-md-2 " >
 <div class="list-group mt-4">
  <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
   All Products
  </a>
  <%for(Category c:clist){ %>
  <a href="index.jsp?category=<%=c.getCategoryId() %>" 
  class="list-group-item list-group-item-action"><%=c.getCategoryTitle() %></a>
 <%} %>
 </div>
</div>




<!-- Show products -->



 <div class="col-md-10">
 
 
 <div class="row  mt-4">
  <div class="col-md-12">
  
  <div class="card-columns">
  
  
  
  <!-- traversing products -->
  
  
  
  <%for(Product p :plist) {%>
  <div class="card product-card">
  
 <div class="container text-center">
	<img src="image/products/<%=p.getpPhoto()%>"
  style="max-height: 200px; max-width: 100%; width: auto;"
	class="card-img-top m-2" alt="...">
</div>



  <!-- Card body -->
  
  
  
  <div class="card-body">
  <h5 class="card-title"><%=p.getpName() %></h5>
  <p class="card-text">
  <%=Helper.get10Words(p.getpDesc()) %>  
  </p>
  </div>
  
  
  <!-- Card footer  -->
  
  
  
  <div class="card-footer text-center" >
  <button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getpId()%>,'<%= p.getpName()%>',<%=p.getpPrice()%>)">
  Add to Cart </button>
  <button class="btn btn-outline-success">
  	&#8377;<%=p.getPriceAfterApplyingDiscount()%>/- <span
	class="text-secondary discount-label"> &#8377; <%=p.getpPrice()%>
	, <%=p.getpDiscount()%>% off </span></button>
  
  </div>
  
  
  
  
  
  </div>
  <%}
  if(plist.size()==0){
	  out.print("<h3> No item available in this category</h3>");
  }
  
  %>
  </div>
 
 </div>
 
 </div>



</div>













    </div> 
</div>

</body>
</html>
