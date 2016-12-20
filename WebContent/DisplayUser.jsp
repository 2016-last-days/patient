<%@page import="com.psl.bean.Status"%>
<%@page import="com.psl.dao.Connect, com.psl.bean.User, java.util.ArrayList, com.psl.dao.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Admin Data</title>
</head>
<body>
<% Message message= (Message)request.getAttribute("name");
if(message!=null)
{
	
%>
<div class="alert alert-<%=message.isSuccessful()?"success":"danger" %> role="alert"><strong><%=message.getMsg() %></strong></div>
<%} %>
	<form class="form-horizontal" role="form" method="post">
		<br>
		<h3>Welcome Admin,</h3>
		<input type="submit" value="Add New User"
			class="btn btn-primary btn-lg" style="position: absolute; right: 0;"
			onclick="javascript: form.action='Registration.html';" /> <br> <br>
		<center>
			<div class="container">
				<h1>List of Users</h1>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Email</th>
							<th>Facility</th>
							<th>Role</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<User> arr = (ArrayList<User>) request.getAttribute("UserList");

							for (User u : arr) {
						%>

						<tr>
							<th scope="row"><%=u.getId()%></th>
							<td><%=u.getFirstname()%></td>
							<td><%=u.getLastname()%></td>
							<td><%=u.getEmail()%></td>
							<td><%=u.getFacility()%></td>
							<td><%=u.getRole()%></td>
							<td>
								<div class="checkbox">
									<%
										String status, val;
											if (u.getStatus().compareTo(Status.Active) == 0) {
												status = "De-Activate";
												val = "Deactive";
											} else {
												status = "Activate";
												val = "Active";
											}
									%>
									<!--<input type="hidden" name="status" value="<%=u.getStatus()%>"> -->
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
					<li>
					<a href="./UserServlet?page=<%=i+1%>"><%=i+1 %></a></li>
					<%
				}
				%>
				
			</ul>
			</nav>
			<input type="submit" value="Save" class="btn btn-success"
				onclick="javascript: form.action='StatusUpdate';" />
		</center>
	</form>
</body>
</html>