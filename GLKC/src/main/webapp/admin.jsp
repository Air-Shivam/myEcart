<%@page import="com.glkc.helper.FactoryProvider"%>
<%@page import="com.glkc.dao.CategoryDao" %>
<%@page import="com.glkc.entities.Category" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.glkc.entities.User" %>
<%
User user= (User)session.getAttribute("current-user");
if(user==null ){
	session.setAttribute("message", "You are Not loogged in .... Login first");
	response.sendRedirect("login.jsp");
	return;
}else{
	if(user.getUserType().equals("normal")){
		session.setAttribute("message", "You are Not admin: Restricted Access");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin-Page</title>
<%@include file="component/common_js_css.jsp" %>
</head>
<body>
<%@include file="component/navbar.jsp" %>

<div class="container admin" >
 <div class="container-fluid mt-5">
  <%@include file="component/message.jsp" %>
 </div>
  <div class="row mt-3">
               <!--first col-->
 <div class="col-md-4">
                   <!--first box-->
  <div class="card">
  <div class="card-body text-center">
  <div class="container">
 <img style="max-width: 125px;" class="img-fluid rounded-circle" 
 src="image/seo-and-web.png" alt="user_icon">
        </div> 
   <h1>2342</h1>
       <h1 class="text-uppercase text-muted">Users</h1>
        </div>
    </div>
  </div>

                <!--second col-->

       <div class="col-md-4">
    <div class="card text-center">
  <div class="card-body">
    <div class="container">
     <img style="max-width: 125px;" class="img-fluid rounded-circle" 
     src="image/list.png" alt="user_icon">
           </div> 
           <h1>23432</h1>
               <h1 class="text-uppercase text-muted">Categories</h1>
                </div>
         </div>
     </div>


                <!--third col-->
<div class="col-md-4">
   <div class="card">
      <div class="card-body text-center">
         <div class="container">
            <img style="max-width: 125px;" class="img-fluid rounded-circle" 
              src="image/product.png" alt="user_icon">
          </div> 
       <h1>234</h1>
     <h1 class="text-uppercase text-muted">Products</h1>
     </div>
   </div>
  </div>
 </div>

            <!--second row-->

            <div class="row mt-3">
                <!--second :row first col-->
 <div class="col-md-6">
    <div class="card" data-toggle="modal" data-target="#add-category-modal">
      <div class="card-body text-center">
          <div class="container">
			<img style="max-width: 125px;" class="img-fluid rounded-circle" 
				src="image/keys.png" alt="user_icon">
       			</div> 
				<p class="mt-2">Click here to add new category</p>
			<h1 class="text-uppercase text-muted">Add Category</h1>
		</div>
	</div>
</div>

                <!--second row : second col-->

<div class="col-md-6">
  <div class="card" data-toggle="modal" data-target="#add-product-modal">
	<div class="card-body text-center">
		<div class="container">
			<img style="max-width: 125px;" class="img-fluid rounded-circle" 
			src="image/plus.png" alt="user_icon">
		</div> 
		<p class="mt-2">Click here to add new Product</p>
	<h1 class="text-uppercase text-muted">Add Product</h1>
	</div>
	</div>
</div>
        </div>

        </div>


        <!--add category modal-->

        <!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog modal-lg" role="document">
<div class="modal-content">
<div class="modal-header custom-bg text-white">
       <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
                 </button>
                    </div>
                    <div class="modal-body">
                    
                    <!--Modal form Starts -->
                    
       <form action="AddCategoryProduct" method="post">
           <input type="hidden" name="operation" value="addcategory">
                <div class="form-group">
                     <input type="text" class="form-control" 
                     name="catTitle" placeholder="Enter category title" required />
                </div>

             <div class="form-group">
              <textarea style="height: 300px;" class="form-control"  
              name="catDescription"
              placeholder="Enter category description" required></textarea>
               </div>

               <div class="cotnainer text-center">
                <button class="btn btn-outline-success">Add Category</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  </div>
                  
        </form>
       </div>
    </div>
  </div>
 </div>




        <!--End add category modal-->

        <!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

        <!--product modal-->

        <!-- Modal -->
        
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog modal-lg" role="document">
<div class="modal-content">
<div class="modal-header">
         <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
          </button>
  </div>
        <div class="modal-body">
        
        
           <!--form-->
           
           
           
    <form action="AddCategoryProduct" method="post" enctype="multipart/form-data">
           <input type="hidden" name="operation" value="addproduct"/>
<!--product title-->

            <div class="form-group">
               <input type="text" class="form-control"
                placeholder="Enter title of product" name="pName" required />
            </div>

                            <!--product description-->

<div class="form-group">
<textarea style="height: 150px;" class="form-control" 
placeholder="Enter product description" name="pDesc"></textarea>
</div>

                            <!--product price-->

<div class="form-group">
<input type="number" class="form-control" 
placeholder="Enter price of product" name="pPrice" required />
</div>

                            <!--product discount-->

<div class="form-group">
<input type="number" class="form-control" 
placeholder="Enter product discount" name="pDiscount" required />
</div>


                            <!--product quantity-->

<div class="form-group">
<input type="number" class="form-control" 
placeholder="Enter product Quantity" name="pQuantity" required />
</div>


                            <!--product category-->

<%  
   CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cdao.getCategories();
               %> 

<div class="form-group">
<select name="catId" class="form-control" id="">
<%   for (Category c : list) {
                 %>
         <option value="<%= c.getCategoryId()%>"> <%= c.getCategoryTitle()%> </option>
                        <%}%>
         </select>
            </div> 

                            <!--product file-->

       <div class="form-group">
             <label for="pPic">Select Picture of product</label>  
                       <br>
            <input type="file" id="pPic" name="pPic" required />
        </div>


                            <!--submit button-->
                     <div class="container text-center">
           <button  type="submit" class="btn btn-outline-success">Add product</button>
           <button type="reset" class="btn btn-outline-warning">Reset</button>
                    </div>
                  </form>
                 <!--end form-->
                </div>
              <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
           </div>
        </div>
     </div>
 </div>

        <!--End product modal-->
            
       <%-- <%@include  file="component/common_modals.jsp" %> --%>


</body>
</html>