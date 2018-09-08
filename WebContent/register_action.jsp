<%@include file="db.jsp" %>
<%

// Retrieve parameters for user, pass, fullname. Role will be set to user
// since no user can register as adminstration.
String user = request.getParameter( "user" );
String pass = request.getParameter( "pass" );
String fullname = request.getParameter ( "fullname" );
String role = "user";

Statement st = con.createStatement();

/* Take pass and add "salt" to it. Convert the password to bytes and use SHA 256 to 
   hash it.StringBuilder is used to format the hashedpassword correctly into the database       */
MessageDigest sha2 = MessageDigest.getInstance("SHA-256");
String password = pass + "salt";
byte[] pBytes = password.getBytes();
byte[] pHash = sha2.digest(pBytes);
StringBuilder sb = new StringBuilder();
for(int i=0; i< pHash.length ;i++) {
    sb.append(Integer.toString((pHash[i] & 0xff) + 0x100, 16).substring(1));         
}
String generatedPassword = sb.toString();
/* ------------------------------------------------------------------------------------------- */

/* Input all parameters into the cs166db using the login table. id will be auto-incremented for each registered user.*/
int i = st.executeUpdate("insert into login(user, pass, fullname, role) values('"+user+"', '"+generatedPassword+"', '"+fullname+"', '"+role+"')");
response.sendRedirect("login_form.html");
%>