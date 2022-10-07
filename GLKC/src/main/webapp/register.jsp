<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>

<!-- including commomon js and css -->
<%@include file="component/common_js_css.jsp" %>

</head>
<body>

<!-- including nav bar -->
<%@include file="component/navbar.jsp" %>

<div class="container-fluid">
<div class="row mt-3">
<div class="col-md-4 offset-md-4">
<%@include file="component/message.jsp" %>
<div class="card">
<div class="card-body px-5">
<div class="container text-center">
<img alt="image/add-friend.png" src="image/add-friend.png"  style="max-width:100px;" >
</div>
<h3 class="text-center my-3">Sign up here!!</h3>

<!-- form starts from here -->
<form action="RegisterUser" method="post">
<div class="form-group">
    <label for="name">User Name</label>
    <input type="text" name="user_name" 
    class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter email">
 
  </div>
  <div class="form-group">
    <label for="email">User Email</label>
    <input type="email" name="user_email" 
    class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
   
  </div>
  
  <div class="form-group">
    <label for="password">User Password</label>
    <input type="password" name="user_password" 
    class="form-control" id="password" placeholder="Password">
  </div>
  <div class="form-group">
    <label for="phone">User Phone</label>
    <input type="number" name="user_phone" 
    class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter PhoneNo.">
    
  </div>
   <div class="form-group">
    <label for="address">User Address</label>
   <textarea class="form-control" name="user_address"
    style="height: 100px"  placeholder="Enter your Address"></textarea>
  </div>
  <div class="form-group">
  <div class="text-center">
   <button type="submit" class="btn btn-outline-success">Register</button>
   <button type="submit" class="btn btn-outline-warning">Reset</button>
   </div>
  </div>
 
</form>
</div>
</div>
</div>
</div>
</div>



</body>
</html>