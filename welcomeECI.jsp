<!DOCTYPE HTML>
<html>

<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.swing.JOptionPane"%>

<%@ page buffer="1kb" autoFlush="true" %>

<head>
<meta charset="utf-8">
<title>WELCOME ECI </title>
<link rel="stylesheet"  type="text/css" href="css/time.css">
<link rel="stylesheet"  type="text/css" href="css/menu.css">
</head>


<script type="text/javascript">

javascript:window.history.forward(1);

function clr()
{
	f1.u1.value="";
	f1.p1.value="";
	
}

</script>

<style type="text/css">
a img { 
	border: none;
}

a:link {
	color:#414958;
	text-decoration:none;
	display:block;
}

tr.nv a:hover, tr.nv a:active, tr.nv a:focus { /* this changes the background and text color for both mouse and keyboard navigators */
	background: #439DC9;
	color: #FFF;
}

td.nv a:hover, td.nv a:active, td.nv a:focus { /* this changes the background and text color for both mouse and keyboard navigators */
	background: #439DC9;
	color: #FFF;
}

</style>

<body bgcolor="#F5F5F5">

<img src="img/head1.jpg" width="1352"  align=top>
<table border="00" cellpadding="00" cellspacing="00" height="41" width="1352" bgcolor="#E6E6FF">
<tr bgcolor="#93A5C4">
<th colspan="3" height="41">
<div class="horz">
<ul> 
	<li><a href="welcomeECI.jsp">HOME</a></li>
	<li><a href="vtresult.jsp">RESULT</a></li>
	<li><a href="newur.jsp">REGISTER</a></li>
	<li><a href="cont.html">CONTACT US</a></li>
	
 </ul>
 </div>
</th>
</tr>
</table>

<table border="00" cellpadding="00" cellspacing="00" height="400" width="1352" bgcolor="#E6E6FF">
<tr>
<td width="1020" rowspan="8" background="" ><p>&nbsp;</p>
<b>&nbsp;&nbsp;&nbsp;INTRODUCTION </b>
<p align="justify">
&nbsp;&nbsp;&nbsp;&nbsp;India is a Socialist, Secular, Democratic Republic and the largest democracy in the World. The modern Indian nation state came into existence on 15th of August 1947. Since then free and fair elections have been held at regular intervals as per the principles enshrined in the Constitution, Electoral Laws and System. The Constitution of India has vested in the Election Commission of India the superintendence, direction and control of the entire process for conduct of elections to Parliament and Legislature of every State and to the offices of President and Vice-President of India. Elections are conducted according to the constitutional provisions, supplemented by laws made by Parliament.

<br>
<span style="font-weight:200; color:#008000"><u><c>If you do not take part in the democratic process,  So you will then have to accept the fact that 20% of some random people decide your fate and the fate of the country for the next five years.</c></u></span>

<br><br><br><br>

<marquee style="color:#F00; font-size:18px;" behavior="slide">
!important&nbsp;&nbsp;&nbsp;"VOTING  &nbsp;FOR  &nbsp;THE  &nbsp;<span  style="color:#800000; text-decoration:underline">"PUNE&quot;  &quot;MAVAL&quot;  &quot;BARAMATI&quot; &amp; &quot;SHIRUR&quot; </span>&nbsp;PARLIAMENTARY  &nbsp;CONSTITUENCIES &nbsp;ONLY."
</marquee>

<%
	ResultSet rs;
	Connection con;
	PreparedStatement ps;
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:vote");
	ps=con.prepareStatement("SELECT * FROM vdate1");
	rs=ps.executeQuery();
	String str="",lst="",rdt="";
	
	while(rs.next())
	{
		str=rs.getString(2);
		lst=rs.getString(3);
		rdt=rs.getString(4);
		
	}%>


Votings Lines Are aviliable FROM <span  style="color:#804040;"><%=str %></span> TO <span  style="color:#804040;"><%=lst %> .</span><br>

Result Will Displayed On <span  style="color:#400000;"> <%=rdt %>. </span>
</p>
</td>
</tr>

<tr>
<td width="71" rowspan="8">&nbsp;&nbsp;</td>
</tr>

<form action="wel_bak.jsp" name="f1" method="post">
<tr class="nv" bgcolor=#C1C1C1>
 <td  width="261" height="40">   <div align="center">User Name&nbsp;&nbsp;
   <input type="text" name="u1">
 </div></td>
</tr> 

<tr bgcolor=#C1C1C1>
<td  height="73"><div align="center">Password&nbsp;&nbsp;   &nbsp;
  <input type="password" name="p1">
</div></td>
</tr>

<tr bgcolor=#C1C1C1>
 <td height="75">   &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name= "lin" type="submit"  value="   LOGIN   "> &nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value=" CLEAR  " onClick="clr();"></td>
</tr> 
 
<tr class="nv" bgcolor=#C1C1C1>
 <td height="45"><a href="newur.jsp"><strong>&nbsp;&nbsp;<c>New User SingUp</c></strong></a></td>
</tr>

<tr class="nv" bgcolor=#C1C1C1>
<td height="42"><a href="frgpas.jsp"><strong>&nbsp;&nbsp;<c>Forget your Password</c></strong></a>
</tr>

<tr bgcolor=#C1C1C1 >
 <td height="117"  align="center"> <div style="color:red; font-style:oblique">
 <%
 
 if((session.getAttribute("logcn")!=null)||(session.getAttribute("logcn")==""))
  	{
		int cnt=(Integer)session.getAttribute("logcn");
		
		if(cnt>0 && cnt<3)
		{ 
			int alef= 2 - cnt; 		%>
    
	    	<%="INVALID USERNAME / PASSWORD Attempt Left ("+ alef +")" %>
       	<% }
			
		else
		{ %>
			
			<%=""%>
  		<% }
		
	}%>
		  	   
 </div>
 </td>
 </tr>

</form>
</table>

<p align="center"><b>"YOU CAN'T COMPLAIN IF YOU DON'T VOTE&quot;</b> </p>

</body>
</html>