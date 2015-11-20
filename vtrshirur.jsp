<%@page import="org.jfree.data.jdbc.JDBCPieDataset"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.Calendar" %>
<%@page import="javax.swing.*"%>
<%
	Calendar cal= Calendar.getInstance();
	
	int yr=cal.get(Calendar.YEAR);
	int dt=cal.get(Calendar.DATE);
	int mn= cal.get(Calendar.MONTH);
	int tmn,tyr,tdt, f1=0,f2=0,f3=0;
	
		Connection tcon;
		PreparedStatement tps,tps1;
		ResultSet trs; 
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		tcon=DriverManager.getConnection("jdbc:odbc:vote");
		int tm=2;
		mn++;
		String str="",lst="",rdt="",cur="";
		cur=yr+"-"+mn+"-"+dt;
		
		tps1=tcon.prepareStatement("SELECT * FROM vdate1 WHERE num=?");
		tps1.setInt(1, 1);
		trs=tps1.executeQuery();
		
		while(trs.next())
		{
			str=trs.getString(2);
			lst=trs.getString(3);
			rdt=trs.getString(4);
		}
		
		if(cur.compareTo(rdt)>0 )
		{
			JOptionPane.showMessageDialog(null,"VOTING DATES ARE Unaviliable","REG_ERROR",JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("welcomeECI.jsp");
		
		}
%>	

<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import ="org.jfree.data.general.*"%>

<%
	
		
		String st="SELECT cname,cvote FROM cndt WHERE casbly=",P="Pune"; 
		final JDBCPieDataset data = new JDBCPieDataset("jdbc:odbc:vote","sun.jdbc.odbc.JdbcOdbcDriver",null,null);
  	
		data.executeQuery("SELECT cname,cvote FROM cndt WHERE casbly='" + "Shirur" + "' ");
	
 		JFreeChart chart = ChartFactory.createPieChart("SHIRUR CONSTITUENCIES",data, true, true,false);

 		try
		{
 			final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
  			final File file1 = new File("D:\\SERVER\\apache-tomcat-8.0.0-RC10\\webapps\\OV\\img\\piechartS.png");
  			ChartUtilities.saveChartAsPNG(file1, chart, 600, 400, info);
  		} 
 		catch (Exception e)
 		{
 	 		out.println(e);
 		}
%>
<html>
<head>
<meta charset="utf-8">
<title>RESULT SHIRUR </title>
<link rel="stylesheet"  type="text/css" href="css/time.css">
<link rel="stylesheet"  type="text/css" href="css/menu.css">
</head>


<script type="text/javascript">

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
<table border="00" cellpadding="03" cellspacing="00" height="41" width="1352" bgcolor="#E6E6FF">
<tr bgcolor="#93A5C4">
<th colspan="3" height="41">
<div class="horz">
<ul> 
	<li><a href="welcomeECI.jsp">HOME</a></li>
	<li><a href="winr.jsp">RESULT</a></li>
	<li><a href="newur.jsp">REGISTER</a></li>
	<li><a href="welcomeECI.jsp">CONTACT US</a></li>
	
 </ul>
 </div>
</th>
</tr>
</table>
 
<table width="900" style="margin-top:30" cellspacing="5">
	<tr>
		<td colspan="3" align="right"><h3><u>VOTTING &nbsp;RESULT&nbsp; FOR&nbsp; SHIRUR &nbsp;CONSTITUENCIES</u></h3></td>
	</tr>
    <tr>
		<td colspan="3" ><h3>&nbsp;</h3></td>
	</tr>
    
    
 <tr>
   <td width="171" class="nv" align="center" bgcolor="#CC99FF"><a href="vtresult.jsp"> PUNE</a></td>
   <td width="113" height="52" align="center">&nbsp;</td>
 <td width="600" rowspan="4"> <img src="img/piechartS.png" width="600" height="400" 
   border="0" usemap="#chart">
</td>
 </tr>
 <tr>
   <td bgcolor="#CCCCFF" align="center" class="nv"><a href="vtrbaramati.jsp">BARAMATI</a></td>
   <td height="43" align="center" >&nbsp;</td>
 </tr>
 <tr>
   <td bgcolor="#CC99FF" align="center" class="nv"><a href="vtrmaval.jsp">MAVAL</a></td>
   <td height="51" align="center" >&nbsp;</td>
 </tr>
 
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
 </tr>
 </table>
 <table style="margin-left:950; margin-top:-250"  width="275" border="1" cellspacing="5" cellpadding="3" bordercolor="#0000FF">
   <tr>
     <th width="189">CANDIDATE NAME</td>
     <td width="70">VOTE</td>
   
   </tr>
     <%
   		ResultSet rs;
		Connection con;
		PreparedStatement ps, ps1;
	
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:vote");
		ps=con.prepareStatement("SELECT cname,cvote FROM cndt WHERE casbly=? order by cvote desc" ,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		ps.setString(1, "Shirur");
		rs=ps.executeQuery();
	
		while(rs.next())
		{%>
   	
  			 <tr>
     			<td><%=rs.getString("cname")%></td>
     			<td><%=rs.getInt("cvote")%></td>
   			</tr>
   		<%} 
   %>
 </table>
</body>
</html>