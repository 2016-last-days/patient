<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.psl.model.Message" %>
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
		<meta name="viewport" content="width=device-width, initial-scale=1">
     	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
		<link rel="stylesheet" href="css/form-elements.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<style type="text/css">
	.bgimg {
    background-image: url('http://www.noormedical.com/files/1407075016_46836.jpg');
    min-height: 100%;
    background-position: top;
    background-size: cover;
}

</style>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <title>Clerk Dashboard</title>
</head>
<body>

<header>
<div class="w3-top">
  <ul class="w3-navbar w3-white w3-wide w3-padding-8 w3-card-2">
    <li>
      <a href="#home" class="w3-margin-left">My Patient</a>
    </li>
    <!-- Right-sided navbar links. Hide them on small screens -->
    <li class="w3-right w3-hide-small">
      <a href="LogoutServlet"  class="w3-left">Logout(<%=session.getAttribute("User") %>)</a>
      
    </li>
  </ul>
</div>
<br><br>
</header>
	<% Message message= (Message)request.getAttribute("name");
if(message!=null)
{
	
%>
	<div
		class="alert alert-<%=message.isSuccessful()?"success":"danger" %> role="alert">
		<strong><%=message.getMsg() %></strong>
	</div>
	<%
		message = null;	
} %>
	<div class="bgimg container">
		<form class="form-horizontal" action="showdata.jsp">
			<div class="container">
				<div class="form-group">
				<br><br><br><br><br><br><br><br>
				
					<div class="col-md-3">
						<input class="form-control" type="text" placeholder="First Name" name="firstname" required> 
					</div>
					<div class="col-md-2">
						<input class="form-control" type="text" placeholder="Last Name" name="lastname" required>
					</div>
					<div class="col-md-2">
						<input class="form-control" type="text" placeholder="Facility" name="facility">
					</div>
					<div class="col-md-2">
						<input class="form-control" type="date" placeholder="Date of Admit" value="" name="dateofadmit">
					</div>
					
					
					
					<div class="col-md-2">
						<input class="form-control" type="date" placeholder="Date of Discharge" value="" name="dateofdischarge">
					</div>
					<!-- <p class="col-md-2">Date: <input type="text" id="datepicker"></p> -->
				</div>
<!-- <input class="form-control" type="reset" value="Reset"> -->
			</div>
			<br><br>
			<div class="container">
				<div class="form-group">
					<div class="col-md-2">
					</div>
					<div class="col-md-2">
						
						<input style="width: 80%" class="btn btn-success " type="submit" class="" value="Search" 
						 name="Search">
					</div>
					<div class="col-md-2">
						<input style="width: 80%" class="btn btn-info btn-md" type="button" onclick="redirect()" value="Load" >
					</div>
				
					<div class="col-md-2">
						<input style="width: 80%" class="btn btn-warning btn-md" type="button" onclick="del()" value="Delete">
					</div>
					<div class="col-md-2">
						<input style="width: 80%" class="btn btn-danger btn-md" type="button"  value="Cancel">
					</div>
					<div class="col-md-2">
					</div>
				</div>
			</div>
		</form>
	</div>

<script type="text/javascript">
	function redirect(){
		window.location="Uploader.jsp"
	}
</script>

<script type="text/javascript">
	function del(){
		window.location="delete.do"
	}
</script>

<script src="js/bootstrap.min.js"></script>

</body>
</html>