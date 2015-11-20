<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MAX Attempt</title>
</head>
<body>
<img src="img/head2.jpg" align="top">


<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
if((session.getAttribute("logcn")==null)||(session.getAttribute("logcn")==""))
{
	session.setAttribute("logcn",1);
	response.sendRedirect("welcomeECI.jsp");
}
else
{
	long lat=session.getLastAccessedTime();

	int cnt=(Integer)session.getAttribute("logcn");
	
	if(cnt < 2 )
	{
		cnt=cnt+1;
		session.setAttribute("logcn",cnt);
		response.sendRedirect("welcomeECI.jsp");	
	 } 
	
	else
	{
		long d= new Date().getTime();
		
		if((d-lat)>1800)
		{
			session.removeAttribute("logcn");
			session.invalidate();	
		}
			
	%>
      <div align="center" style="color:#FF0033">Maxium attempt reach:<br>
      	wait for an 30 min%> 
      </div>
      
      <div align="right">
	   <a href="welcomeECI.jsp" style="color:#003399"> Go To Login Page </a>
	  </div>
	<%
	
	}	
}
	
%>



</body>
</html>