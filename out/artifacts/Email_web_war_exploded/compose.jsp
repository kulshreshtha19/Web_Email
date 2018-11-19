<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFSheet" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFRow" %>
<%@ page import="org.apache.poi.ss.usermodel.*" %>

<html>
<head>
<title>send</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://select2.github.io/dist/css/select2.min.css" rel="stylesheet">
<script src="https://select2.github.io/dist/js/select2.full.js"></script>
</head>
<body>
<div class="container" style="margin-top: 50px;margin-left: 17%">
<div class="col-md-9">
<div class="panel panel-default">
<div class="panel-body message">
<p class="text-center">New Message</p>
<form class="form-horizontal" role="form" method="post" action="send.jsp?user=<%= request.getParameter("user")%>">
<div class="form-group">
<label for="to" class="col-sm-1 control-label">To:</label>
<div class="col-sm-11">
<input type="text" class="form-control select2-offscreen" id="to" placeholder="Type email" tabindex="-1" name="to">
</div>
</div>
<div class="form-group">
<label for="cc" class="col-sm-1 control-label">subject:</label>
<div class="col-sm-11">
<input type="text" class="form-control select2-offscreen" id="cc" placeholder="Subject" tabindex="-1" name="subject">
</div>
</div>
<div class="form-group">
<textarea class="form-control" id="message" name="body" rows="12" placeholder="Click here to reply"></textarea>
</div>
<div class="form-group" style="margin-left: 5%">
<button type="submit" class="btn btn-success">Send</button>
</div>
</form>
</div>
</div>
</div>
</div><!--/.col-->
</div>
</div>
</body>
</html>