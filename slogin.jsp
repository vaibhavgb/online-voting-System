<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.swing.JOptionPane"%>
<!DOCTYPE HTML>
<html>

<%
	ResultSet rs;
	Connection con;
	PreparedStatement ps,ps2;
	String uname=(String)session.getAttribute("unm");
	
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:vote");
	ps=con.prepareStatement("SELECT parea FROM newur WHERE unm=?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	ps.setString(1,uname);
	rs=ps.executeQuery();
	if(rs.isBeforeFirst())
	{	
		while(rs.next())
		{
			String st=rs.getString("parea");
			session.setAttribute("par",st);	
		}
	}
	else
	{
		JOptionPane.showMessageDialog(null, "Your not login ", "Login Detained", JOptionPane.INFORMATION_MESSAGE);
		response.sendRedirect("welcomeECI.jsp");
		
	}
	
%>



<head>
<meta charset="utf-8">
<title>VOTE HERE</title>

<link type="text/css" rel="stylesheet" href="css/menu1.css">
<link type="text/css" rel="stylesheet" href="css/time.css">

</head>

<style type="text/css">
td.glo a:hover{
	color:#FFFFFF;
	font-size:21px;
}

input.cn
{
	height:20px;
	width:50px;
	border:thin;
	color:#0033FF;
	border-bottom-left-radius:10px;
	border-bottom-right-radius:10px;
	border-top-left-radius:10px;
	border-top-right-radius:10px;
	background-color:#0033FF;
}

</style>

<script type="text/jscript">
javascript:window.history.forward(1);
</script>

<body>
<img src="img/head2.jpg" align="top" width="1351" >

<table border="00" cellpadding="00" cellspacing="00" height="41" width="1325" bgcolor="#E6E6FF" style="margin-top:-3px;">
<tr bgcolor="#93A5C4">
<th>
<div class="horz">
<ul> 
	<li><a href="welcomeECI.jsp">HOME</a></li>
	<li><a href="vtresult.jsp">RESULT</a></li>
	<li><a href="welcomeECI.jsp">CONTACT US</a></li>
   	<li> <a href="logout.jsp"><span style="color:#800000">LOG OUT</span> </a></li> 
 </ul>
 </div>
 </th>
 </tr>
</table>

<form action="slogin_bak.jsp" method="post">
<table width="409" height="511" background="img/evm.jpg" style="margin-top:50px; margin-left:200px;">

<tr>
<td width="210" height="31" align="center" >&nbsp; 
</td>
<td width="68">&nbsp;
</td>
<td width="115">&nbsp;
</td>
</tr>

<%

	ResultSet rs1;
	Connection con1;
	PreparedStatement ps1;
	
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	String par=(String)session.getAttribute("par");

	con1=DriverManager.getConnection("jdbc:odbc:vote");
	ps1=con1.prepareStatement("SELECT * FROM cndt WHERE casbly=?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	ps1.setString(1, par);
	rs1=ps1.executeQuery();
	
	
	while(rs1.next())
	{
		String cnam=rs1.getString("cname");
		String cvid =rs1.getString(2);
	//	JOptionPane.showMessageDialog(null," "+cnam+" "+cvid, "Login Detained", JOptionPane.INFORMATION_MESSAGE);
%>




	<tr  height="30">
	<td width="210" height="29" align="left" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=cnam%> </td> <td><img src="<%=rs1.getString("psymb") %>" height="23" width="57" align="baseline"></td>
	<td> <div align="center"><input type="submit" name="b1" value="<%=cvid%>" class="cn"></div></td>
	</tr>
<%}%>
	<tr>
<td width="210" height="379" >
</td>
</tr>
</table>
</form>

</body>
</html>
