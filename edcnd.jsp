<!DOCTYPE HTML>
<html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.swing.JOptionPane"%>

<head>
<meta charset="utf-8">
<title>EDIT CANDIDATE</title>
</head>

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
<script type="text/javascript">
function tahid()
{
	document.getElementById("tahd").style.display="none";
	document.getElementById("ihipr").style.display="block";	
}

function tparhd()
{
	document.getElementById("phd").style.display="none";
	document.getElementById("iparty").style.display="block";	
}

</script>



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


<form action="edcnd_bak1.jsp" method="post">
<table width="1137" height="267" border="0" cellpadding="2" cellspacing="5" style="margin-top:120px; margin-left:50px">
  <tr>
    <td width="433" height="110" align="center" class="pr">VOTTER ID NO.:&nbsp;&nbsp;
    <input class="wd" type="text" name="ivid"  value="<%if( session.getAttribute("tecvid")!=null)%> <%=session.getAttribute("tecvid")%>"> </td>
    <td width="663" class="nv" align="justify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;NAME OF CANDIDATE :  
      <input class="cp" type="text" name="iltnam" id="n1"  style="width: 300px"   value="<%if( session.getAttribute("tecnm")!=null)%> <%=session.getAttribute("tecnm")%>">
	</td> 
  </tr>
  <tr>
    <td height="70">&nbsp;</td>
    <td align="justify" style="background-color:#C0C0C0"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;DATE OF BIRTH :
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input class="cp" type="text" name="idob"  value="<%if( session.getAttribute("tecdob")!=null)%> <%=session.getAttribute("tecdob")%>" >
    </td>
  </tr>
  
  <tr>
    <td height="70">&nbsp;</td>
    <td align="center" class="nv">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PARLIAMENT CONSTITUENCY :  
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
         <input class="cp" type="text" id="tahd"  value="<%if( session.getAttribute("tecabl")!=null)%> <%=session.getAttribute("tecabl")%>" onclick="tahid()" >   
         
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        <select name="ihipr" class="sl" id="ihipr" style="display: none;">
          <option selected="selected" value="0">-- Select Constituency --</option>
          <option value="Pune">PUNE</option>
		  <option value="Baramati">BARAMATI</option>
		  <option value="Shirur">SHIRUR</option>
		  <option value="Maval">MAVAL</option>
      </select>
    </td>
  </tr>
  
   <tr>
    <td height="90">&nbsp;</td>
      <td style="background-color:#C0C0C0" width="100" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ENTER PARTY NAME :  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <input type="text" id="phd" class="cp" value="<%if( session.getAttribute("tecprty")!=null)%> <%=session.getAttribute("tecprty")%>" onclick="tparhd()" >
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       
        <select name="iparty" id="iparty" class="sl" style="display:none">
          <option selected="selected" value="0">-- Select Party --</option>
          <%
      	ResultSet rs;
      	Connection con;
      	PreparedStatement ps, ps1;
      	
      	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
      	con=DriverManager.getConnection("jdbc:odbc:vote");
      	ps=con.prepareStatement("SELECT pname FROM party ",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
       	rs=ps.executeQuery();
       	
       	while(rs.next())
		{%>
   	
  			 	<option value="<%=rs.getString("pname")%>"> <%=rs.getString("pname")%></option>
     	<%} 
   %>
      </select>
           
      </td>
    </tr>

  <tr>
    <td height="70">&nbsp;</td>
    <td align="center" class="nv">
        <input style="background-color:#009900" type="submit" value="UPDATE">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input style="background-color:#993333" type="button" name="iclr" onClick="clr()" value="CLEAR" >
    </td>
  </tr>
  
</table>
</form>

</body>
</html>
