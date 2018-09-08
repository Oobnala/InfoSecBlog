<%@include file="db.jsp" %><%

String user = (String) request.getSession().getAttribute( "user" );
String title = request.getParameter ( "title" );
String content = request.getParameter ( "content" );
Statement st = con.createStatement();

int i = st.executeUpdate("insert into blog(title, content, user) values('"+title+"', '"+content+"', '"+user+"')");
response.sendRedirect("blog_list.jsp");
%>
