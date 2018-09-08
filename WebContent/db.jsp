<%@ page import = "java.sql.*, java.util.*, java.io.*, java.security.* " %>
<%		
Connection con=null;
try {
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs166db", "oobnala", "cs166project");
}
catch(Exception e) {
	return;
}
%>