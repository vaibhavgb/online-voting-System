<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>
<!DOCTYPE HTML>
<html>

<head>
<meta charset="utf-8">
<title>Welcome <%=session.getAttribute("unm")%></title>

</head>



<%@ page import="org.jfree.*" %>
<%@page import="javax.swing.JOptionPane"%>

<style type="text/css">

div {
    width: 1352px;
    alignment-adjust:after-edge;
	position:absolute;
	margin-top:-37px;	
}

div ul li a:link, div ul li a:visited {
    display: block;
    background-color: #2f8be8;
    font-family: Arial, Helvetica, sans-serif;
    font-weight: bold;
    font-size: 14px;
    color: #FF0;
    text-align: center;
    text-decoration: none;
    padding: 10px;
    width: 170px;        
}

div ul li a:hover{
    background-color: #030;
}

li ul li a:link, li ul li a:visited {
    display: block;
    background-color: #f09d28;
    font-family: Arial, Helvetica, sans-serif;
    font-weight: normal;
    font-size: 12px;
    color: #CCF;
    text-align: center;
    text-decoration: none;
    padding: 10px;
    border-bottom: 1px solid #fff;
    width: 170px;
}

li ul li a:hover {
    background-color: #050;
}

ul {
    list-style-type: none;
    padding: 0px;   
	margin:0px;
}

div ul li {
    float: left;
	width:1352;
	background-color:#2f8be8;
}
ul li ul li {
    float: none;
    padding-left:7px;
}
li ul {
    display: none;  
}
li:hover ul{
    display: block; 
}
</style> 


<body>
<img src="img/head11.jpg" style="position:relative" align="top">
	<div>
		<ul>
        	<li><a href="#">USER</a>
            	<ul>
            	<li><a href="aduser.html">Add</a></li>
                <li><a href="eduser_bak.jsp">Edit</a></li>
            	<li><a href="deluser.jsp">Remove</a></li>
          		</ul>  
          </li>   
            
            <li><a href="#">CANDIDATE</a>
            	<ul>
            	<li><a href="adcdt.jsp">Add</a></li>
                <li><a href="edcnd_bak.jsp">Edit</a></li>
            	<li><a href="delcnd.jsp">Remove</a></li>
          		</ul>  
          </li>   
             
             
             <li><a href="mdate.jsp">MANAGE DATE</a> 
	            
          	</li>
          	
          	  <li><a href="#">PARTY</a> 
	            <ul>
            	<li><a href="adparty.jsp">Add</a></li>
                <li><a href="delparty.jsp">REMOVE</a></li>
                </ul>   
          	</li>
            
           <li> &nbsp;</li>
           <li> &nbsp;</li> 
           
           <li>
           		<li><a href="logout.jsp">LOGOUT</a> </li> 
           </li>
             
      </ul>
	</div>
<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.axis.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import="org.jfree.chart.labels.*" %>
<%@ page  import="org.jfree.chart.plot.*" %>
<%@ page  import="org.jfree.chart.renderer.category.*" %>
<%@ page  import="org.jfree.chart.urls.*" %>
<%@ page  import="org.jfree.data.category.*" %>
<%@ page  import="org.jfree.data.general.*" %>


<%

String adm=(String)session.getAttribute("uadmi");

if((session.getAttribute("uadmi")!="" || session.getAttribute("uadmi")!=null) && ("AvaibhavB".equals(adm)) )
{
	Connection con,con1;
	
	Statement st1,st2,st3;
	ResultSet rs1,rs2,rs3;
	double tav=0, trv=-1, tsv=0, tac=0;
	
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con= DriverManager.getConnection("jdbc:odbc:vote");
	
	st1=con.createStatement();
	rs1=st1.executeQuery("SELECT * FROM user");
	
	while(rs1.next())
	{
		trv+=1;
		
		if(rs1.getInt("chk")!=0)
			tsv=tsv+1;
	}
	
	st2=con.createStatement();
	rs2=st2.executeQuery("SELECT vidno FROM newur");
	
	while(rs2.next())
		tav+=1;
	
	st3=con.createStatement();
	rs3=st3.executeQuery("SELECT cvid FROM cndt");
	
	while(rs3.next())
		tac+=1;
	
	
	rs2.close();
	st2.close();
	rs1.close();
	st1.close();
	rs3.close();
	st3.close();
	
	DefaultCategoryDataset data1 = new DefaultCategoryDataset();
	
	data1.setValue(tav,"People","Aviliable Votter");
	data1.setValue(trv, "People","Registred votter");
	data1.setValue(tsv, "People","Voted People");
	data1.setValue(tac, "People","Registerd Candidate");
		
	JFreeChart chart1 = ChartFactory.createBarChart("VOTTING STATUS",
			"Candidate & Voter", "People", data1, PlotOrientation.VERTICAL,
			false, true, false);

	ChartUtilities.saveChartAsJPEG(new File("D:\\SERVER\\apache-tomcat-8.0.0-RC10\\webapps\\OV\\img\\chart.jpg"), chart1, 700,250);
}
 else
{
	JOptionPane.showMessageDialog(null,"YOUR SESSION IS EXPIRED LOGIN AGAIN ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
	response.sendRedirect("welcomeECI.jsp");
}


%>



<div style="margin-top:200px; position:relative">
<img src="img\chart.jpg">
</div>


</body>

</html>