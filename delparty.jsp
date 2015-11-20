<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>REMOVE PARTY</title>
</head>
<%@page import="javax.swing.JOptionPane"%>
<%! public static String varea; %>
<%
 String adm=(String)session.getAttribute("uadmi");

if((session.getAttribute("uadmi")!="" || session.getAttribute("uadmi")!=null) && ("AvaibhavB".equals(adm)) )
{		

String vparty,dparty,img;
	vparty=(JOptionPane.showInputDialog("Enter PARTY NAME ")).trim();
		
	int f1=0;

	ResultSet rs;
	Connection con;
	Statement stm,ins;
	PreparedStatement ps, ps1;
	
	
 	
	if(vparty!="")
	{
		f1=1;
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:vote");
		ps=con.prepareStatement("SELECT * FROM party WHERE pname=?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		ps.setString(1, vparty);
	 	rs=ps.executeQuery();
	 	
	 	if(!rs.isBeforeFirst())
	 	{
	 		JOptionPane.showMessageDialog(null,"INVALID PARTY NAME ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("admi.jsp");
	 	}
	 	else
	 	{
	 		
	 		while(rs.next())
 			{
	 			
 					session.setAttribute("dtpar", vparty);
 					session.setAttribute("dtimg",rs.getString("psymb"));
  			}
		 }
	 }	
	
	
	else
	{
		JOptionPane.showMessageDialog(null,"PLEASE ENTER VOTTER ID ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
		response.sendRedirect("admi.jsp");
	}
}
else
{
	JOptionPane.showMessageDialog(null,"YOUR SESSION IS EXPIRED LOGIN AGAIN ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
	response.sendRedirect("welcomeECI.jsp");
}
	
%>

<style type="text/css">

div {
	width: 1188px;
	alignment-adjust:after-edge;
	position:absolute;
	margin-top:-37px;
	left: 11px;
	top: 186px;
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


input.cp{
	width:140px;
	height:19px;
	text-transform:uppercase;
	border-bottom:medium;
	border-bottom-color:#F00;
	border-bottom-left-radius:5px;
	border-bottom-right-radius:5px;
	border-top-left-radius:5px;
	border-top-right-radius:5px;
}

input.wd{
	left:100px;
	width:200px;
	height:19px;
	border-bottom:medium;
	font-family:"Lucida Console", Monaco, monospace;
	font-size:20px;
	border-bottom-left-radius:10px;
	border-bottom-right-radius:10px;
	border-top-left-radius:10px;
	border-top-right-radius:10px;
}

td.pr{
	background-color:#9966CC;
	color:#FFFFFF;
}

td.nv{
	background-color:#EEEEEE;
	
}

</style> 

<body>
<img src="img/head11.jpg" style="position:relative" align="top">
<div>
		<ul>
        	<li><a href="admi.jsp"> HOME </a>
            </li>
            
        
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
              
                </ul>   
          	</li>
            
          <li> &nbsp;</li>
           <li> &nbsp;</li> 
           
           <li>
           		<li><a href="logout.jsp">LOGOUT</a> </li> 
           </li>
             
  </ul>
	</div>


<form action="delparty_bak.jsp" method="post" name="f1">
<table width="940" height="264" border="2" cellpadding="2" cellspacing="5" style="margin-top:120px; margin-left:50px">
   <tr>
      <td width="292" height="83" align="center" style="background-color:#C0C0C0">PARTY NAME :  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <input class="cp" type="text" name="iltnam" id="n1"   value="<%if( session.getAttribute("dtpar")!=null)%> <%=session.getAttribute("dtpar")%>" disabled="true">
    </td>
      <td width="287"  class="nv"><img height="194" width="259" align="middle" id="partytm" name="partytm" src="<%if( session.getAttribute("dtimg")!=null)%> <%=session.getAttribute("dtimg")%>" ></img></td>
   
   
    <td align="center" width="329"  style="background-color:#C0C0C0">
        <input style="background-color:#009900" type="submit" value="DELETE">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input style="background-color:#993333" type="button" name="iclr" onClick="clr()" value="CANCEL" >
    </td>
  </tr>
  
   
</table>
</form>

</body>
</html>