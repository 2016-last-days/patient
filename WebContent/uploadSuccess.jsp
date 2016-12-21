<%@page import="com.psl.bean.Patient"%>
<%@page import="com.psl.dao.PatientDAO"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/form-elements.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<style type="text/css">
.bgimg {
	background-image:
		url('http://www.noormedical.com/files/1407075016_46836.jpg');
	min-height: 100%;
	background-position: center top;
	background-size: 1024px 768px;
	background-repeat: no-repeat;
}
</style>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body class="bgimg">
	<header>
	<div class="w3-top">
		<ul class="w3-navbar w3-white w3-wide w3-padding-8 w3-card-2">
			<li><a href="clerk.html" class="w3-margin-left">My Patient</a></li>
			<!-- Right-sided navbar links. Hide them on small screens -->
			<li class="w3-right w3-hide-small"><a href="LogoutServlet"
				class="w3-left">Logout(Clerk)</a></li>
		</ul>
	</div>
	<br>
	<br>
	</header>
	<br>
	<br>
	<br>
	<br>


	<div class="container">
		<table class="table table-hover table-bordered" style="background-color: white">
			<caption style="text-align: center; font-size: 30px">
				<strong>Uploaded Details</strong>
			</caption>
			<%



BufferedReader reader = (BufferedReader)request.getAttribute("Reader");
StringBuilder output = new StringBuilder();
String line;
%>

			<thead>
				<tr>

					<th>Firstname</th>
					<th>Lastname</th>
					<th>Facility</th>
					<th>Admit Date</th>
					<th>Discharge Date</th>
				</tr>
			</thead>

			<tbody>

				<%
//out.println(reader.readLine());
while ((line = reader.readLine()) != null)
{
	
String data[] = line.split(",");
%><tr>
					<%
for(int j=0;j<data.length;j++)
 {

out.print("<td> " +data[j]+ "</td> ");
 


} 
%>
				</tr>
				<%
} 

 %>


			</tbody>
		</table>
	</div>

	<script src="js/bootstrap.min.js"></script>



</body>
</html>