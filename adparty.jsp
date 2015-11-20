<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>ADD PARTY</title>
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
function showim()
{
	
	var pn=document.getElementById("ipartysm").value;
	document.getElementById("partytm").src="party/"+pn+".jpg"	
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


<form action="adparty_bak.jsp" method="post" name="f1">
<table width="1137" height="267" border="0" cellpadding="2" cellspacing="5" style="margin-top:120px; margin-left:50px">
   <tr>
      <td style="background-color:#C0C0C0" align="center">ENTER PARTY NAME :  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <input type="text" name="iparty"  class="cp">    
      </td>
      <td rowspan="2"><img src="" width="258" height="195" id="partytm"></img> </td>
   </tr>
      
        <td class="nv"  align="center">SELECT PARTY SYMBOL :  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select name="partysm" class="sl"  id="ipartysm" onchange="showim()">
          <option value="0">SELECT SYMBOL</option>
          <option value="cng">Hand</option>
		  <option value="bjp">Lotus</option>
		  <option value="ncp">Clock</option>
		  <option value="aap">Broom</option>
		  <option value="op2">Kite</option>
	 	  <option value="mns">Railway Engine</option>
	 	  <option value="siv">Bow-Arrow</option>
	 	  <option value="op1">Coconut</option> 
      	 </select>
    
      </td>
       <td>&nbsp; </td>
    </tr>
    

  <tr>
    <td height="70"style="background-color:#C0C0C0">&nbsp;</td>
    <td align="center" class="nv" width="300px">
        <input style="background-color:#009900" type="submit" value="UPDATE">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input style="background-color:#993333" type="button" name="iclr" onClick="clr()" value="CLEAR" >
    </td>
  </tr>
  
</table>
</form>

</body>
</html>
