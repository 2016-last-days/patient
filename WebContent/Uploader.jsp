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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Upload Data</title>

meta charset="ISO-8859-1">

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
    background-position: center top;
    background-size: 1024px 768px;
    background-repeat: no-repeat
}

</style>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.3.6/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>



<!-- the main fileinput plugin file -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.3.6/js/fileinput.min.js"></script>
<!-- bootstrap.js below is needed if you wish to zoom and view file content 
     in a larger detailed modal dialog -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
<!-- optionally if you need a theme like font awesome theme you can include 
    it as mentioned below -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.3.6/js/locales/fa.js"></script>

</head>
<body class="bgimg">

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

</header>
<br><br><br><br>
<form action="upload.do" method="post" enctype="multipart/form-data">
<label class="control-label">Upload Patient Data</label>
<input id="input-7" name="input7[]" type="file" multiple class="file-loading" accept=".csv">

<script>
$(document).on('ready', function() {
    $("#input-7").fileinput({
        showUpload: true,
        maxFileCount: 1,
        uploadurl: "",
        allowedFileExtensions: ["csv"],
        maxFilePreviewSize: 1024,
        browseOnZoneClick: true
    });
});
</script> 
</form>
</body>
</html>