<%@ page import = "java.sql.*, java.util.*, java.io.*" %>
<%@include file="db.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Blog Attack Demo</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
	<link rel="stylesheet" type="text/css" href="blogstyle.css">
</head>
<body>
 	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="login_form.html">Boo Blog</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li><a href="login_form.html">Home</a></li>
	      <li class="dropdown">
	        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Demonstrations
	        <span class="caret"></span></a>
	        <ul class="dropdown-menu">
	          <li><a href="login_attack.html">SQL Injection</a></li>
	          <li><a href="#">Cross Site Script Injection</a></li>
	          <li><a href="#">Web Site Defacing</a></li>
	        </ul>
	      </li>
	    </ul>
	    	
	    <ul class="nav navbar-nav navbar-right">
	      <li><a href="post.html"><span class="glyphicon glyphicon-pencil">Post</span></a></li>
	      <li><a href="logout_action.jsp"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
	    </ul>
	  </div>
	</nav> 
	  <div>
	<div class="card">
		<h1>Successful SQL Injection Attack!!!</h1>
		<p>You committed a SQL Injection Attack.</p>
		<a href="blog_list.jsp"><button type="submit" >Blog Home</button></a>
	</div>
	  
</body>
</html>