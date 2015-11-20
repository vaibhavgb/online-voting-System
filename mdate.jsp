<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>MANAGE DATE</title>
</head>
<%@page import="java.util.Calendar" %>
<%
	Calendar cal= Calendar.getInstance();
	
	int yr=cal.get(Calendar.YEAR);
	int dt=cal.get(Calendar.DATE);
	int mn= cal.get(Calendar.MONTH);
	
	session.setAttribute("vyear", yr);


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

tr.nv{
	background-color:#EEEEEE;
	
	
}

select.sl{
	border-bottom:medium;
	border-bottom-left-radius:8px;
	border-bottom-right-radius:8px;
	border-top-left-radius:8px;
	border-top-right-radius:8px;
	height:
}

</style> 
<script type="text/javascript">
function clr()
{
	
	document.getElementById("hvdt").selectedIndex="0";
	document.getElementById("hvdt1").selectedIndex="0";
	document.getElementById("hvmn").selectedIndex="0";
	document.getElementById("hvmn1").selectedIndex="0";
	document.getElementById("hrdt").selectedIndex="0";
	document.getElementById("hrmn").selectedIndex="0";
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


<form action="mdate_bak.jsp" method="post" >
<table width="1062" height="267" border="0" cellpadding="2" cellspacing="5" style="margin-top:120px; margin-left:50px">
   <tr class="nv">
      <td width="303" align="center">VOTING DATE   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
      </td>
      <td colspan="1">START DATE&nbsp;&nbsp;&nbsp;
        <select name="hvdt" id="hvdt">

         	<option value="0" selected="selected">SELECT DAY</option>
         	<option value="1">1</option>
         	<option value="2">2</option>
         	<option value="3">3</option>
         	<option value="4">4</option>
         	<option value="5">5</option>
         	<option value="6">6</option>
         	<option value="7">7</option>
         	<option value="8">8</option>
         	<option value="9">9</option>
         	<option value="10">10</option>
         	<option value="11">11</option>
         	<option value="12">12</option>
         	<option value="13">13</option>
         	<option value="14">14</option>
         	<option value="15">15</option>
         	<option value="16">16</option>
         	<option value="17">17</option>
         	<option value="18">18</option>
         	<option value="19">19</option>
         	<option value="20">20</option>
         	<option value="21">21</option>
         	<option value="22">22</option>
         	<option value="23">23</option>
         	<option value="24">24</option>
         	<option value="25">25</option>
         	<option value="26">26</option>
         	<option value="27">27</option>
         	<option value="28">28</option>
         	<option value="29">29</option>
         	<option value="30">30</option>
         	<option value="31">31</option>
     
         </select>
         
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <select  name="hvmn" class="sl" id="hvmn">
         	<option value="0">SELECT MONTH</option>
         	<option value="1">JAN</option>
         	<option value="2">FEB</option>
         	<option value="3">MAR</option>
         	<option value="4">APR</option>
         	<option value="5">MAY</option>
         	<option value="6">JUN</option>
         	<option value="7">JUL</option>
         	<option value="8">AUG</option>
         	<option value="9">SEP</option>
         	<option value="10">OCT</option>
         	<option value="11">NOV</option>
         	<option value="12">DEC</option>
         	
         </select>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="text" name="hvyr"  class="cp" maxlength="4" value="<%if( session.getAttribute("vyear")!=null)%> <%=session.getAttribute("vyear")%>" disabled="true">  
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <br>
         <br>
         &nbsp;LAST DATE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <select name="hvdt1" id="hvdt1" >

         	<option value="0">SELECT DAY</option>
         	<option value="1">1</option>
         	<option value="2">2</option>
         	<option value="3">3</option>
         	<option value="4">4</option>
         	<option value="5">5</option>
         	<option value="6">6</option>
         	<option value="7">7</option>
         	<option value="8">8</option>
         	<option value="9">9</option>
         	<option value="10">10</option>
         	<option value="11">11</option>
         	<option value="12">12</option>
         	<option value="13">13</option>
         	<option value="14">14</option>
         	<option value="15">15</option>
         	<option value="16">16</option>
         	<option value="17">17</option>
         	<option value="18">18</option>
         	<option value="19">19</option>
         	<option value="20">20</option>
         	<option value="21">21</option>
         	<option value="22">22</option>
         	<option value="23">23</option>
         	<option value="24">24</option>
         	<option value="25">25</option>
         	<option value="26">26</option>
         	<option value="27">27</option>
         	<option value="28">28</option>
         	<option value="29">29</option>
         	<option value="30">30</option>
         	<option value="31">31</option>
     
         </select>
         
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <select  name="hvmn1" class="sl" id="hvmn1" >
         	<option value="0">SELECT MONTH</option>
         	<option value="1">JAN</option>
         	<option value="2">FEB</option>
         	<option value="3">MAR</option>
         	<option value="4">APR</option>
         	<option value="5">MAY</option>
         	<option value="6">JUN</option>
         	<option value="7">JUL</option>
         	<option value="8">AUG</option>
         	<option value="9">SEP</option>
         	<option value="10">OCT</option>
         	<option value="11">NOV</option>
         	<option value="12">DEC</option>
         	
         </select>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="text" name="hvyr1"  class="cp" maxlength="4"  value="<%if( session.getAttribute("vyear")!=null)%> <%=session.getAttribute("vyear")%>"  disabled="true">   
        <br>
       
      </td>
   </tr>
   
    <tr style="background-color:#C0C0C0">  
        <td   align="center">RESULT DATE </td>
       <td align="center">
       	  <select name="hrdt" id="hrdt">

         	<option value="0">SELECT DAY</option>
         	<option value="1">1</option>
         	<option value="2">2</option>
         	<option value="3">3</option>
         	<option value="4">4</option>
         	<option value="5">5</option>
         	<option value="6">6</option>
         	<option value="7">7</option>
         	<option value="8">8</option>
         	<option value="9">9</option>
         	<option value="10">10</option>
         	<option value="11">11</option>
         	<option value="12">12</option>
         	<option value="13">13</option>
         	<option value="14">14</option>
         	<option value="15">15</option>
         	<option value="16">16</option>
         	<option value="17">17</option>
         	<option value="18">18</option>
         	<option value="19">19</option>
         	<option value="20">20</option>
         	<option value="21">21</option>
         	<option value="22">22</option>
         	<option value="23">23</option>
         	<option value="24">24</option>
         	<option value="25">25</option>
         	<option value="26">26</option>
         	<option value="27">27</option>
         	<option value="28">28</option>
         	<option value="29">29</option>
         	<option value="30">30</option>
         	<option value="31">31</option>
     
         </select>
         
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <select  name="hrmn" class="sl" id="hrmn">
         	<option value="0">SELECT MONTH</option>
         	<option value="1">JAN</option>
         	<option value="2">FEB</option>
         	<option value="3">MAR</option>
         	<option value="4">APR</option>
         	<option value="5">MAY</option>
         	<option value="6">JUN</option>
         	<option value="7">JUL</option>
         	<option value="8">AUG</option>
         	<option value="9">SEP</option>
         	<option value="10">OCT</option>
         	<option value="11">NOV</option>
         	<option value="12">DEC</option>
         	
         </select>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="text" name="hryr"  class="cp" maxlength="4" value="<%if( session.getAttribute("vyear")!=null)%> <%=session.getAttribute("vyear")%>" disabled="true">  
        
       </td>
    </tr>
    

  <tr class="nv" >
    <td height="70">&nbsp;</td>
    <td align="center" width="736">
        <input style="background-color:#009900" type="submit" value="UPDATE">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input style="background-color:#993333" type="button" name="iclr" onClick="clr()" value="CLEAR" >
    </td>
  </tr>
  
</table>
</form>

</body>
</html>
