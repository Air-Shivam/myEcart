<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User-Login</title>
<%@include file="component/common_js_css.jsp" %>
</head>
<body>
<%@include file="component/navbar.jsp" %>

<div class="container">
<div class="row">
<div class="col-md-6 offset-md-3">
<div class="card mt-3">
  <div class="card-header custom-bg text-white">
    <h3 class="text-center my-3">Login up here!!</h3>
  </div>
  <div class="card-body">
  <%@include file="component/message.jsp" %>
  
   <!--form starts here  -->
<form action="LoginUser" method="post">

  <div class="form-group">
    <label for="email">User Email</label>
    <input type="email" name="user_email" 
    class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
  </div>
  <div class="form-group">
    <label for="name">User Password</label>
    <input type="password" name="user_password" 
    class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Password">
  </div>
     <a href="register.jsp" class="text-center d-block mb-2"> New User|click here </a>
   <div class="container text-center" style="cursor: pointer;"> 
    <button type="submit" class="btn btn-primary border-0 custom-bg ">Submit</button>
      <button type="reset" class="btn btn-primary custom-bg border-0 ">Reset</button>
     </div>
   </form>
  </div>
 
</div>
</div>
</div>
</div>




</body>
</html>