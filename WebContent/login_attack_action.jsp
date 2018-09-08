<%@include file="db.jsp" %>
<%

String user = request.getParameter( "user" );
String pass = request.getParameter( "pass" );
//SQL injection attack
//a ' OR '1'='1' -- 

String sqlStr = "SELECT fullname FROM login WHERE user='" + user + "' and pass = sha2('"+ pass + "', 256)";
//vulnerable for injection attack

Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sqlStr);

//establishes user and application
if ( rs.next() ) {
	session.setAttribute( "user", user );
	session.setAttribute( "username", rs.getString(1) );
	session.setMaxInactiveInterval(60*20);
	response.sendRedirect("blog_list.jsp");	
} else {
	response.sendRedirect("login_attack.html");
} 
%>