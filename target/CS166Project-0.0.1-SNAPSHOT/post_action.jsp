<%@include file="db.jsp" %><%

String user = (String) request.getSession().getAttribute( "user" );
String title = request.getParameter ( "title" );
String content = request.getParameter ( "content" );
String resultContent = content.replaceAll("[&<>/]", "");
Statement st = con.createStatement();

int i = st.executeUpdate("insert into blog(title, content, user) values('"+title+"', '"+resultContent+"', '"+user+"')");
response.sendRedirect("blog_list.jsp");
%>