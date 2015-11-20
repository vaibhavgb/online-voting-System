<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>REMOVE USER</title>
</head>
<%@page import="javax.swing.JOptionPane"%>
<%! public static String vnam,vdob,vid,vpar,vsarea; %>
<%
 String adm=(String)session.getAttribute("uadmi");

if((session.getAttribute("uadmi")!="" || session.getAttribute("uadmi")!=null) && ("AvaibhavB".equals(adm)) )
{		

	
	vid=(JOptionPane.showInputDialog("Enter VOTER id"));
	
	
	int f1=0,f2=0,f3=0,flg=0,f4=0,f5=0, i,len;

	ResultSet rs,rs1;
	Connection con;
	Statement stm,ins;
	PreparedStatement ps, ps1;
	
	if(vid!="")
	{
		f1=1;
		
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:vote");
		ps=con.prepareStatement("SELECT * FROM newur WHERE vidno=?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		ps.setString(1, vid);
	 	rs=ps.executeQuery();
		
	 	if(!rs.isBeforeFirst())
	 	{
	 		JOptionPane.showMessageDialog(null,"INVALID VOTTER ID ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("admi.jsp");
	 	}
	 	
 		while(rs.next())
 		{
 			String tm="0";
 			if(tm.equals(rs.getString("unm")))
 			{
 				session.setAttribute("tdlvid", vid);	
	 		
 				session.setAttribute("tenm",rs.getString("vname"));
 				session.setAttribute("tearea",rs.getString("vsarea"));
 				session.setAttribute("tedob",rs.getString("vdob"));
 				session.setAttribute("tepar",rs.getString("parea"));
 			
 			}
 			else
 			{
 				JOptionPane.showMessageDialog(null,"VOTTER ALREADY VOTED","REG_ERROR",JOptionPane.ERROR_MESSAGE);
 				response.sendRedirect("admi.jsp");
 			}
 		}
 		
 	rs.close();
 	ps.close();
 	con.close();	
	
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


<form action="deluser_bak.jsp" method="post" >
<table width="1137" height="267" border="0" cellpadding="2" cellspacing="5" style="margin-top:120px; margin-left:50px">
  <tr>
    <td width="433" height="110" align="center" class="pr">VOTTER ID NO.:&nbsp;&nbsp;
    <input class="wd" type="text" name="ivid" value="<%=vid%>" disabled="true"> </td>
    <td width="663" class="nv" align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;NAME OF VOTTER :  
      <input class="cp" type="text" name="iltnam" style="width: 300px"  value="<%if( session.getAttribute("tenm")!=null)%> <%=session.getAttribute("tenm")%>" disabled="true">	</td> 
  </tr>
  <tr>
    <td height="70">&nbsp;</td>
    <td align="justify" style="background-color:#C0C0C0"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;DATE OF BIRTH : 
          &nbsp;&nbsp;&nbsp;&nbsp;
      <input class="cp" type="text" name="idob" value="<%if( session.getAttribute("tedob")!=null)%> <%=session.getAttribute("tedob")%>"disabled="true">
    </td>
  </tr>
  
  <tr>
    <td height="70">&nbsp;</td>
    <td align="center" class="nv"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PARLIAMENT CONSTITUENCY :  
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input class="cp" type="text" id="tahd" name="tahd" onblur="tahid()"  value="<%if( session.getAttribute("tepar")!=null)%> <%=session.getAttribute("tepar")%>" disabled="true">
     
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


    </td>
  </tr>
  
   <tr>
    <td height="90">&nbsp;</td>
      <td style="background-color:#C0C0C0" width="100" align="center">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   SELECT REAGON :  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
               <input class="cp" type="text" id="tahd1" name="tahd1"  value="<%if( session.getAttribute("tearea")!=null)%> <%=session.getAttribute("tearea")%>" disabled="true"">

 
      </td>
    </tr>

  <tr>
    <td height="70">&nbsp;</td>
    <td align="center" class="nv">
        <input style="background-color:#009900" type="submit" value="DELETE">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input style="background-color:#993333" type="button" name="iclr" onClick="clr()" value="CLEAR" >
    </td>
  </tr>
  
</table>
</form>

</body>
</html>

