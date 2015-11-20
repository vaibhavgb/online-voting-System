<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>EDIT USER</title>
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


<script>
function tahid()
{
	document.getElementById("tahd").style.display="none";
	document.getElementById("tahd1").style.display="none";
	document.getElementById("ihipr").style.display="block";	
}

function togle()
{
	var x=document.getElementById("ihipr").value;
	
	if(x!=0)
	{
		if(x=='Pune')
		{	
			document.getElementById("sarea2").style.display="block";
			document.getElementById("sarea1").style.display="none";	
			document.getElementById("sarea3").style.display="none";
			document.getElementById("sarea4").style.display="none";			
		}
		
		if(x=='Baramati')
		{	
			document.getElementById("sarea3").style.display="block";
			document.getElementById("sarea1").style.display="none";	
			document.getElementById("sarea2").style.display="none";
			document.getElementById("sarea4").style.display="none";			
		}
		
		if(x=='Shirur')
		{	
			document.getElementById("sarea4").style.display="block";
			document.getElementById("sarea1").style.display="none";	
			document.getElementById("sarea3").style.display="none";
			document.getElementById("sarea2").style.display="none";			

		}
		
		if(x=='Maval')
		{	
			document.getElementById("sarea1").style.display="block";
			document.getElementById("sarea2").style.display="none";	
			document.getElementById("sarea3").style.display="none";	
			document.getElementById("sarea4").style.display="none";
		}
	}

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


<form action="eduser_bak1.jsp" method="post">
<table width="1137" height="267" border="0" cellpadding="2" cellspacing="5" style="margin-top:120px; margin-left:50px">
  <tr>
    <td width="433" height="110" align="center" class="pr">VOTTER ID NO.:&nbsp;&nbsp;
    <input class="wd" type="text" name="ivid" value="<%if( session.getAttribute("tevid")!=null)%> <%=session.getAttribute("tevid")%>"> </td>
    <td width="663" class="nv" align="justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;NAME OF VOTTER :  
      <input class="cp" type="text" name="iltnam" style="width: 300px"  value="<%if( session.getAttribute("tenm")!=null)%> <%=session.getAttribute("tenm")%>">	</td> 
  </tr>
  <tr>
    <td height="70">&nbsp;</td>
    <td align="justify" style="background-color:#C0C0C0"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;DATE OF BIRTH : 
          &nbsp;&nbsp;&nbsp;&nbsp;
      <input class="cp" type="text" name="idob" value="<%if( session.getAttribute("tedob")!=null)%> <%=session.getAttribute("tedob")%>">
    </td>
  </tr>
  
  <tr>
    <td height="70">&nbsp;</td>
    <td align="center" class="nv"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PARLIAMENT CONSTITUENCY :  
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input class="cp" type="text" id="tahd" name="tahd" onclick="tahid()"  value="<%if( session.getAttribute("tepar")!=null)%> <%=session.getAttribute("tepar")%>">
     
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <select name="ihipr" class="sl" id="ihipr"  onclick="togle()" style="display: none">
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
      <td style="background-color:#C0C0C0" width="100" align="center">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   SELECT REAGON :  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
               <input class="cp" type="text" id="tahd1" name="tahd1" onclick="tahid()"  value="<%if( session.getAttribute("tearea")!=null)%> <%=session.getAttribute("tearea") %>">
 
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
  
          <select name="ihsarea" class="sl"  id="sarea1" style="display:none;">
          <option value="Panvel">Panvel</option>
		  <option value="Karjat">Karjat</option>
		  <option value="Uran">Uran</option>
		  <option value="Maval">Maval</option>
		  <option value="Chinchwad">Chinchwad</option>
	 	  <option value="Pimpri">Pimpri</option>
      	 </select>
         
         <select name="ihsarea2" class="sl" id="sarea2" style="display:none">
          <option value="Vadgaon Sheri">Vadgaon Sheri</option>
          <option value="Shivajinagar">Shivajinagar</option>
          <option value="Kothrud">Kothrud</option>
          <option value="Parvati">Parvati</option>
          <option value="Pune Cantonment">Pune Cantonment</option>
          <option value="Kasba Peth">Kasba Peth</option>
         </select> 
         
         <select name="ihsarea3" class="sl" id="sarea3" style="display:none;">
          <option value="Daund">Daund</option>
		  <option value="Indapur">Indapur</option>
		  <option value="Baramati">Baramati</option>
		  <option value="Purandar">Purandar</option>
		  <option value="Bhor">Bhor</option>
		  <option value="Khadakwasala">Khadakwasala</option>
         </select>
        
         <select name="ihsarea4" class="sl" id="sarea4" style="display:none;">
		  <option value="Junnar">Junnar</option>
		  <option value="Ambegaon">Ambegaon</option>
		  <option value="Khed Alandi">Khed Alandi</option>
		  <option value="Shirur">Shirur</option>
          <option value="Bhosari">Bhosari</option>
		  <option value="Hadapsar">Hadapsar</option>
          </select>
 
      </td>
    </tr>

  <tr>
    <td height="70">&nbsp;</td>
    <td align="center" class="nv">
        <input style="background-color:#009900" type="submit" value="SAVE">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input style="background-color:#993333" type="button" name="iclr" onClick="clr()" value="CLEAR" >
    </td>
  </tr>
  
</table>
</form>

</body>
</html>
