<%@page import="com.psl.model.Patient"%>
<%@page import="com.psl.dao.ConnectionManager, com.psl.model.UserBean, java.util.ArrayList, com.psl.model.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
<title>Peitent Data</title>
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
<body class="bgimg">
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
	<% Message message= (Message)request.getAttribute("name");
if(message!=null)
{
	
%>
	<div
		class="alert alert-<%=message.isSuccessful()?"success":"danger" %> role="alert">
		<strong><%=message.getMsg() %></strong>
	</div>
	<%} %>
	<form class="form-horizontal" role="form" method="post">
		<br>
		
		<center>
			<div class="container">
				<h1>List of Patient</h1>
				<table class="table table-hover" style="background-color: lightblue">
					<thead>
						<tr>
							<th>ID</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Facility</th>
							<th>Admit Date</th>
							<th>Discharge Date</th>
							<th>DeleteStatus</th>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<Patient> arr = (ArrayList<Patient>)request.getAttribute("PatientList");
							System.out.println(arr);
							for(Patient u : arr) {
								System.out.println(u);
						%>

						<tr>
							<th scope="row"><%=u.getId()%></th>
							<td><%=u.getFirstName()%></td>
							<td><%=u.getLastName()%></td>
							<td><%=u.getFacility()%></td>
							<td><%=u.getAdmitDate()%></td>
							<td><%=u.getDischargeDate()%></td>
							<td>
								<div class="checkbox">
									<%
										String status, val;
											if (u.getDeleted().equals("Added")) {
												status = "Delete";
												val = "Deleted";
											} else {
												status = "Add";
												val = "Added";
											}
									%>
									
									<label><input type="checkbox" name="status" 
										value="<%=u.getId()%> <%=val%>"><%=status%></label>
								</div>
							</td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>

			</div>
			<nav aria-label="Page navigation">
			<ul class="pagination">


				<%
				int pg=(Integer)(request.getAttribute("pages"));
				for(int i=0;i<pg ; i++)
				{
					%>
				<li><a href="./delete.do?page=<%=i+1%>"><%=i+1 %></a></li>
				<%
				}
				%>

			</ul>
			</nav>
			<input type="submit" value="Save" class="btn btn-success"
				onclick="javascript: form.action='deleted.do';" />
		</center>
	</form>
</body>
</html>