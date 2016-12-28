<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility

String userName = (String) session.getAttribute("User");
if (null == userName) {
   request.setAttribute("Error", "Session has ended.  Please login.");
   RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
   rd.forward(request, response);
}
%>
<html>
<head>
<title>Insert title here</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
  <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
  
<style type="text/css">
	.bgimg {
    background-image: url('http://www.noormedical.com/files/1407075016_46836.jpg');
    min-height: 100%;
    background-position: center top;
    background-size: 1024px 768px;   
     background-repeat: no-repeat;
}

</style>
  
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</head>
<body>

<header>
<div class="w3-top">
  <ul class="w3-navbar w3-white w3-wide w3-padding-8 w3-card-2">
    <li>
      <a href="clerk.html" class="w3-margin-left">My Patient</a>
    </li>
    <!-- Right-sided navbar links. Hide them on small screens -->
    <li class="w3-right w3-hide-small">
      <a href="LogoutServlet"  class="w3-left">Logout(<%=session.getAttribute("User") %>)</a>
      
    </li>
  </ul>
</div>
<br><br>
</header>
	<div class="container bgimg">
            <form class="form-horizontal" role="form" action="register.do" method="post">
                <h2>Registration Form</h2>
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">First Name</label>
                    <div class="col-sm-9">
                        <input type="text" name="firstName" placeholder="First name" class="form-control" autofocus required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="lastName" class="col-sm-3 control-label">Last Name</label>
                    <div class="col-sm-9">
                        <input type="text" name="lastName" placeholder="Last name" class="form-control" autofocus required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-9">
                        <input type="email" name="email" placeholder="Email" class="form-control" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Facility Name" class="col-sm-3 control-label">Facility Name</label>
                    <div class="col-sm-9">
                        <input type="text" name="FacilityName" placeholder="Facility name" class="form-control" autofocus required>
                    </div>
                </div>
             
                <div class="form-group">
                    <label for="user role" class="col-sm-3 control-label">User Role</label>
                    <div class="col-sm-9">
                        <select id="role" class="form-control" name="role">
                            <option value="Admin">Admin</option>
                            <option value="Clerk">Clerk</option>
                        </select>
                    </div>
                </div> <!-- /.form-group -->
	            <div class="form-group">
	                    <label class="control-label col-sm-3">Status</label>
	                    <div class="col-sm-9">
	                        
	                                <label class="radio-inline">
	                                    <input type="radio" id="ActiveRadio" value="Active" name="activation">Active
	                                    
	                                </label>
	                                <label class="radio-inline">
	                                    <input type="radio" id="De-activeRadio" value="Deactive" name="activation" checked>De-Active
	                                </label>
	                         
	                     </div>
	            </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <button type="submit" class="btn btn-primary btn-block">Register</button>
                    </div>
                </div>
            </form> <!-- /form -->
        </div> <!-- ./container -->>

</body>
</html>