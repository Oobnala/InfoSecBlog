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

	  <%
	  class Blog {
		  private String id;
		  private String title;
		  private String user;
		  private String content;
		  
		  public Blog(String id, String t, String u, String c) {
			  this.id = id;
			  title = t;
			  user = u;
			  content = c;
		  }
	  }
	  
	  class Role {
		  private String role;
		  
		  public Role(String r) {
			  role = r;
		  }
	  }
	  
	  String user = (String) request.getSession().getAttribute( "user" );
	  String currentRole = "";
	  String userRole = "user";
	  String adminRole = "admin";
	  
	  ArrayList<Blog> blogList = new ArrayList<Blog>();
	  String sqlStr = "SELECT * FROM `blog`" ;
	  PreparedStatement stmt = con.prepareStatement(sqlStr);
	  ResultSet rs = stmt.executeQuery();
	  
	  String sqlStr2 = "SELECT * FROM login" ;
	  PreparedStatement stmt2 = con.prepareStatement(sqlStr2);
	  ResultSet rs2 = stmt2.executeQuery();
	  
	
	  while (rs.next()) {
		  Blog blog = new Blog(rs.getString("id"), rs.getString("title"), rs.getString("user"), rs.getString("content"));
		  blogList.add(blog);
	  }
	  
	  while(rs2.next()) {
		  if (rs2.getString("user").equalsIgnoreCase(user)) {
			Role r = new Role(rs2.getString("role"));  
			currentRole = r.role; 
		  }
	  }
	  Collections.reverse(blogList);
	  pageContext.setAttribute("blogList", blogList);
 	  for (Blog b: blogList) {
		  if(b.user.equalsIgnoreCase(user) && currentRole.equals(userRole)) {
			  out.println("<div class=\"card\">");
			  out.println("<a href=\"delete_action.jsp?id=" + b.id + "\">");
			  out.println("<button type=\"submit\" class=\"btn btn-danger btn-sm pull-right\">" + "Delete" + "</button>");
			  out.println("</a>");
			  out.println("<h1>" + b.title + "</h1>");
			  out.println("<h3>" + "Post by " + b.user + "</h3>");
			  out.println("<p style=\"white-space: pre-wrap;\">" + b.content + "</p>");
			  out.println("</div>");
		  }
		  else if(currentRole.equals(adminRole)) {
			  out.println("<div class=\"card\">");
			  out.println("<a href=\"delete_action.jsp?id=" + b.id + "\">");
			  out.println("<button type=\"submit\" class=\"btn btn-danger btn-sm pull-right\">" + "Delete" + "</button>");
			  out.println("</a>");
			  out.println("<h1>" + b.title + "</h1>");
			  out.println("<h3>" + "Post by " + b.user + "</h3>");
			  out.println("<p style=\"white-space: pre-wrap;\">" + b.content + "</p>");
			  out.println("</div>");
		  }
		  else {
			  out.println("<div class=\"card\">");
			  out.println("<h1>" + b.title + "</h1>");
			  out.println("<h3>" + "Post by " + b.user + "</h3>");
			  out.println("<p style=\"white-space: pre-wrap;\">" + b.content + "</p>");
			  out.println("</div>");
		  }
	  } 

	  %>
    	<br/>
    	<br/>
    	<div class="container-fluid">
			<nav class="navbar navbar-dark" role="navigation" style="background-color: #5d6d7e;">
			    <a href="privacy.jsp" style="color: white">Privacy Statement</a>	 
			</nav>
		</div>
</body>
</html>