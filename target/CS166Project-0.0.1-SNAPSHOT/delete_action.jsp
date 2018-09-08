<%@include file="db.jsp" %>
<% 

	String id = request.getParameter("id");
	Statement st = con.createStatement();
	int i = st.executeUpdate("DELETE FROM blog WHERE id="+id);
	response.sendRedirect("blog_list.jsp");

%>