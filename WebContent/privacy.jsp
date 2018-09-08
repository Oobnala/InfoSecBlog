<%@ page import = "java.sql.*, java.util.*, java.io.*" %>
<%@include file="db.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Blog</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
	<link rel="stylesheet" type="text/css" href="blogstyle.css">
</head>
<body>
 	<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="blog_list.jsp">Boo Blog</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li><a href="blog_list.jsp">Home</a></li>
	      <li class="dropdown">
	        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Demonstrations
	        <span class="caret"></span></a>
	        <ul class="dropdown-menu">
	          <li><a href="login_attack.html">SQL Injection</a></li>
	          <li><a href="post_attack.html">Cross Site Script Injection</a></li>
	          <li><a href="deface_attack.html">Web Site Defacing</a></li>
	        </ul>
	      </li>
	    </ul>
	    
	    <!-- Used to print and welcome user on right hand side of navbar -->
		<% String wUser = (String) request.getSession().getAttribute( "user" ); %>
		
	    <ul class="nav navbar-nav navbar-right">
	      <li><a href="">Welcome, <% out.print(wUser);%>!</a></li>
	      <li><a href="post.html"><span class="glyphicon glyphicon-pencil">Post</span></a></li>
	      <li><a href="logout_action.jsp"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
	    </ul>
	  </div>
	</nav> 
	<br/>
	<br/>
	<br/>
	<div class="card2">
		<h1>Privacy Statement</h1>
		<h4>Information Collection</h4>
		<p>
			The information collected on our site can only be accessed by administrators. The information
			will not be given to anyone and we can only access the information you provide.
		</p>		
		<p>
			These are the following information that you can provide: username, password, full name, blog titles,
			and blog content. This information will be sent to our database. All information regarding blog posting will
			be displayed. 
		</p>	
		<p>
			You have access and control to your information at any time. If you want to make changes to the information 
			you provide or have concerns, please contact us by email.
		</p>
		<h4>Security</h4>
		<p>
			All your information is secured on our database. Administrators consistently ensure that your data is protected.
			Sensitive information, such as passwords, are encrypted into our database. We will never ask for sensitive information
			from you.
		</p>
		<p>
			If you find any security compromises within using our site, please contact us immediately so we can remedy the situation.
		</p>
		<b>Email: myblog@myblog.com</b>
	</div>
	
</body>
</html>