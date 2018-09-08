<%@include file="db.jsp" %>
<% 

session.invalidate();
response.sendRedirect("login_form.html");
%>
