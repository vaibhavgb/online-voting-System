<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML>
<html>

<head>
<meta charset="utf-8"> 
<title>Untitled Document</title>
</head>

<script type="text/jscript">
javascript:window.history.forward(1);
</script>

<%@ page import="javax.swing.*" %>
 
<%

session.removeAttribute("unm");
session.invalidate();

response.sendRedirect("welcomeECI.jsp");
JOptionPane.showMessageDialog(null, "YOU ARE SUCESSFULLY LOG OUT ", "Logout", JOptionPane.INFORMATION_MESSAGE);


%>



<body>
</body>
</html>