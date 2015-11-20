<!DOCTYPE HTML>
<html>

<%@page import="javax.swing.*"%>
<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>

<%@page import="java.util.Calendar" %>

<%
	Calendar cal= Calendar.getInstance();
	
	int yr=cal.get(Calendar.YEAR);
	int dt=cal.get(Calendar.DATE);
	int mn= cal.get(Calendar.MONTH);
	int tmn,tyr,tdt, f1=0,f2=0,f3=0;
	
		Connection con;
		PreparedStatement ps,ps1;
		ResultSet rs; 
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:vote");
		int tm=2;
		mn++;
		String str="",lst="",rdt="",cur="";
		cur=yr+"-"+mn+"-"+dt;
		
		ps1=con.prepareStatement("SELECT * FROM vdate1 WHERE num=?");
		ps1.setInt(1, 1);
		rs=ps1.executeQuery();
		
		while(rs.next())
		{
			str=rs.getString(2);
			lst=rs.getString(3);
			rdt=rs.getString(4);
		}
		
		if(cur.compareTo(str)<0 || cur.compareTo(lst)>0 )
		{
			JOptionPane.showMessageDialog(null,"VOTING DATES ARE Unaviliable" +str +cur+ lst,"REG_ERROR",JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("welcomeECI.jsp");
		
		}
%>	


<head>
<meta charset="utf-8">
<title>ECI_Reg</title>
<img src="img/head2.jpg" align="top" class="fx" style="position: fixed;">
<link type="text/css" rel="stylesheet" href="css/menu1.css">
<link type="text/css" rel="stylesheet" href="css/time.css">
</head>


<style type="text/css">

tr.nv{
	background-color:#EEEEEE;
	
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
	/*text-transform:uppercase;*/
	font-family:"Lucida Console", Monaco, monospace;
	font-size:17px;
	border-bottom-left-radius:8px;
	border-bottom-right-radius:8px;
	border-top-left-radius:8px;
	border-top-right-radius:8px;
	
}

select.sl{
	border-bottom:medium;
	border-bottom-left-radius:8px;
	border-bottom-right-radius:8px;
	border-top-left-radius:8px;
	border-top-right-radius:8px;
	height:
}

input.bt{
	border:groove;
	border-bottom-left-radius:5px;
	border-bottom-right-radius:5px;
	border-top-left-radius:5px;
	border-top-right-radius:5px;
	color:#FFFFFF;
	background:#C03;
}
input.cp :hover
{
	outline-color:#FF3399;
}

#ovrflo{
	 margin-top:170px;
     margin-left: 120px;
     overflow: auto;  
}

img.fx{
	position:fixed;
	top:1px;
}



</style>

<script>
/*
function ref()
{
	document.getElementById("cpt").src='captcha.jsp?'+(new Date().getTime());
}
*/



/*function myFunction()
{
	var x=chk2.fname.value;
	
	var nwc ="<%=session.getAttribute("captcha")%>";
	var n = nwc.localeCompare(x);
	
	if(n!=0)
	{
		alert("ENTER PROPER CAPTCHA  "+ nwc);
	}
}
*/

function togle()
{
	var x=document.getElementById("hipr").value;
	
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

<script language="javascript">
function valcon()
{	
	var p =chk2.hcot.value;

		if (/^\d{10}$/.test(p)) 
		{
		    // value is ok, use it
		} 
		else 
		{
		    alert("INVALID NUMBER & MUST BE TEN(10) DIGITS");
		    p.focus();
		}
}

function valpas()
{
	var p=chk2.hcpas.value;
	var p1=chk2.hpas.value;
	
	if(p1!=p)
	{
	  	alert("PASSWORD DOSE NOT MATCH");
	  	p.focus();
	}
	
}

function valuid()
{
	 
	var a=chk2.huid.value;
	if(/^\d{12}$/.test(a))
	{
		
	}
	else
	{
		 alert("INVALID NUMBER & MUST BE TWELVE(12) DIGITS");
		 a.focus();
	}
}

function valemail()
{
	var em= chk2.hmail.value;
	
	var at= em.indexOf("@");
	var dt= em.indexOf(".");
	
	if(at<1 || dt<at+2 || dt+2>=x.length)
	{
		alert("INVALID EMAIL ADDRESS");
		em.focus();
	}
}

function valpin()
{
	var pn=chk2.hpin.value;
	
	if(/^\d{6}$/.test(pn))
	{
		
	}
	else
	{
		alert("INVALID PINCODE");
		pn.focus();
	}
}

</script>


<body>
<table border="0" cellpadding="00" cellspacing="00" height="41" width="1325" bgcolor="#E6E6FF" style="margin-top:103px; position:fixed" >
<tr bgcolor="#93A5C4">
<th>
<div class="horz">
<ul> 
	<li><a href="welcomeECI.jsp">HOME</a></li>
	<li><a href="winr.html">RESULT</a></li>
	<li><a href="newur.jsp">REGISTER</a></li>
	<li><a href="welcomeECI.jsp">CONTACT US</a></li>
 </ul>
 </div>
 </th>
 </tr>
</table>

<p>&nbsp;</p>
<div id="ovrflo">
<form name="chk1" action="reg1.jsp" method="post" onSubmit="return val1();">
  <div>
  <table align="left" width="879" height="300" border="0" cellspacing="0" bgcolor="#CECECE" style="display:table" id="hide2">
   
    <tr> 
      <td width="277"><div align="center">NAME OF VOTTER</div></td>
      <td width="598"><input class="cp" type="text" name="hltnam" id="n1">&nbsp;&nbsp;&nbsp;<input  class="cp" name="hftnam" type="text">&nbsp;&nbsp;&nbsp;<input class="cp" name="hmtnam" type="text">&nbsp;</td>
    </tr>
    <tr>
      <td height="21"></td>
      <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Middle Name</td>
    </tr>
	
    <tr class="nv">
      <td height="63"><div align="center">VOTTER ID NO.</div></td>
      <td><div align="left">
        <input class="wd" type="text" name="hvid" onClick="bak()">
      </div></td>
    </tr>
   
   <tr>
      <td height="63"><div align="center">PARLIAMENT CONSTITUENCIES</div></td>
      <td><div align="left">
         <select name="hpar" class="sl" id="hipr"  onchange="togle()">
          <option selected="selected" value="0">-- Select Parliamentary Constituency --</option>
          <option value="Pune">PUNE</option>
		  <option value="Baramati">BARAMATI</option>
		  <option value="Shirur">SHIRUR</option>
		  <option value="Maval">MAVAL</option>
          </select>
      </div></td>
    </tr>
   
    
    <tr class="nv">
      <td height="63"><div align="center">SELECT REAGON</div></td>
      <td><div align="justify">
      
         
         <select name="hsarea" class="sl"  id="sarea1" style="display:none;">
          <option value="Panvel">Panvel</option>
		  <option value="Karjat">Karjat</option>
		  <option value="Uran">Uran</option>
		  <option value="Maval">Maval</option>
		  <option value="Chinchwad">Chinchwad</option>
	 	  <option value="Pimpri">Pimpri</option>
      	 </select>
         
         <select name="hsarea2" class="sl" id="sarea2" style="display:none">
          <option value="Vadgaon Sheri">Vadgaon Sheri</option>
          <option value="Shivajinagar">Shivajinagar</option>
          <option value="Kothrud">Kothrud</option>
          <option value="Parvati">Parvati</option>
          <option value="Pune Cantonment">Pune Cantonment</option>
          <option value="Kasba Peth">Kasba Peth</option>
         </select> 
         
         <select name="hsarea3" class="sl" id="sarea3" style="display:none;">
          <option value="Daund">Daund</option>
		  <option value="Indapur">Indapur</option>
		  <option value="Baramati">Baramati</option>
		  <option value="Purandar">Purandar</option>
		  <option value="Bhor">Bhor</option>
		  <option value="Khadakwasala">Khadakwasala</option>
         </select>
        
         <select name="hsarea4" class="sl" id="sarea4" style="display:none;">
		  <option value="Junnar">Junnar</option>
		  <option value="Ambegaon">Ambegaon</option>
		  <option value="Khed Alandi">Khed Alandi</option>
		  <option value="Shirur">Shirur</option>
          <option value="Bhosari">Bhosari</option>
		  <option value="Hadapsar">Hadapsar</option>
          </select>
             
      </div></td>
    </tr>
	
	  <tr>
      <td height="63"><div align="center">DATE OF BIRTH
        </div></td>
      <td><div align="left">
        <input class="wd" type="date" name="hvdob">
      </div>
      
      </td>
    </tr>
    
    <tr class="nv">
      <td height="63"><div align="center">USER NAME </div></td>
      <td><div align="left">
        <input class="wd" type="text" name="hunam">
        &nbsp;&nbsp;&nbsp;&nbsp;<input align="baseline" type="submit" value="Check Avilibility">
      </div></td>
    </tr>
    </table>
    </form>
    
    										<!-- HIDE 1 -->
    
    <form name="chk2" action="reg2.jsp" method="post">
    <table align="left" width="879" height="694" border="0" cellspacing="0" bgcolor="#CECECE" id="hide1" style="display:none">
	
    <tr bgcolor="#CC9933">
      <td height="63"><div align="center">PARLIAMENTARY CONSTITUENCIE</div></td>
      <td><div align="left">
        <input class="wd" type="text" disabled="true" value="<%if( session.getAttribute("tpar")!=null)%> <%= session.getAttribute("tpar")%>"> 
      	&nbsp;&nbsp;&nbsp; <img src="img/r2.jpg" height="20" >
      </div>
      </td>
    </tr>
	
	 <tr>
      <td width="277"><div align="center">NAME OF VOTTER</div></td>
      <td width="598"><input class="cp" type="text" name="hltnam" id="n1" disabled="true" value="<%if( session.getAttribute("tnm1")!=null)%> <%= session.getAttribute("tnm1")%> ">&nbsp;&nbsp;&nbsp;<input  class="cp" name="hftnam" type="text" disabled="true" value="<%if( session.getAttribute("tnm2")!=null) {%> <%=session.getAttribute("tnm2")%> <%}%>" > &nbsp;&nbsp;&nbsp;<input class="cp" name="hmtnam" type="text" disabled="true" value="<%if( session.getAttribute("tnm3")!=null) {%> <%=session.getAttribute("tnm3")%> <%}%>">&nbsp; &nbsp;&nbsp;&nbsp; <img src="img/r2.jpg" height="20" ></td>
    </tr>
    <tr>
      <td height="21"></td>
      <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Middle Name</td>
    </tr>
	
    <tr class="nv">
      <td height="63"><div align="center">VOTTER ID NO.</div></td>
      <td><div align="left">
        <input class="wd" type="text" name="hvid" disabled="true" value="<%if( session.getAttribute("tvid")!=null)%> <%= session.getAttribute("tvid")%>"> 
      	&nbsp;&nbsp;&nbsp; <img src="img/r2.jpg" height="20" >
      </div>
      </td>
    </tr>
    
    <tr>
      <td height="63"><div align="center">SELECTED REAGON</div></td>
      <td><div align="left">
        <input class="wd" type="text" name="hrej"disabled="true" value="<%if( session.getAttribute("tarea")!=null)%> <%= session.getAttribute("tarea")%>">
        &nbsp;&nbsp;&nbsp; <img src="img/r2.jpg" height="20" >
      </div></td>
    </tr>
	
	  <tr class="nv">
      <td height="63"><div align="center">DATE OF BIRTH
        </div></td>
      <td><div align="left">
        <input class="wd" type="text" name="hvdob" disabled="true" value="<%if( session.getAttribute("tdob")!=null)%> <%= session.getAttribute("tdob")%>">
        &nbsp;&nbsp;&nbsp; <img src="img/r2.jpg" height="20" >
      </div>     
      </td>
    </tr>
    
    <tr>
      <td height="63"><div align="center">USER NAME </div></td>
      <td><div align="left">
        <input class="wd" type="text" name="hunam" disabled="true" value ="<%if( session.getAttribute("tunm")!=null)%> <%= session.getAttribute("tunm")%>">
        &nbsp;&nbsp;&nbsp;&nbsp; <img src="img/r2.jpg" height="20" >
      </div></td>
    </tr>
	
	
	
    <tr class="nv">
      <td width="277" height="63"><div align="center">PASSWORD </div></td>
      <td width="598"><div align="left">
        <input class="wd" type="password" name="hpas">
      </div></td>
    </tr>
    
    <tr>
      <td height="63"><div align="center">CONFORM PASSWORD </div></td>
      <td><div align="left">
        <input class="wd" type="password" name="hcpas" onchange="valpas()">
      </div></td>
    </tr>
    
    <tr class="nv">
      <td width="277" height="63"><div align="center">CONTACT NO.</div></td>
      <td width="598"><div align="left">
        <input class="wd" type="text" name="hcot" onchange="valcon()" >
      </div></td>
    </tr>
    
     <tr>
      <td height="63"><div align="center">EID or UID NO.<br>
        (Adhar Card No.)</div></td>
      <td><div align="left">
        <input class="wd" type="text" name="huid" onchange="valuid()">
      </div></td>
    </tr>

    <tr class="nv">
      <td width="277" height="63"><div align="center">E-MAIL ID</div></td>
      <td width="598"><div align="left">
        <input class="wd" type="text" name="hmail" onchange="valemail()">
      </div></td>
    </tr>
	
    
    <tr>
      <td height="64"><div align="center">RECEIDENTIAL ADDRESS</div></td>
      <td> <input class="cp" type="text" name="hadr1">&nbsp;&nbsp;&nbsp;<input class="cp" type="text" name="hadr2">&nbsp;&nbsp;&nbsp;<input class="cp" type="text" name="hadr3"><br>
      <div align="justify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Addr Line 1 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp; &nbsp;&nbsp;Addr Line 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Addr Line 3</div></td>
    </tr>
    
    <tr class="nv">
      <td height="63"><div align="center">DISTRICT / STATE</div></td>
      <td><div align="left"> <input type="text"  class="wd"  disabled="true" value="<%if( session.getAttribute("tdist")!=null)%> <%= session.getAttribute("tdist")%>">

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="text"  class="wd"  disabled="true" value="   MAHARASHTRA">
      </div></td>
    </tr>
    
    <tr>
      <td height="63"><div align="center">PINCODE</div></td>
      <td><div align="left">
        <input type="text" class="wd" name="hpin" onchange="valpin()">
      </div></td>
    </tr>
      
     <tr class="nv">
      <td height="92"><div align="center">SECURITY QUESTION 1</div></td>
      <td><div align="left">
        <select name="hsq1" class="sl">
          <option value="1">What is your Mother median Name   </option>
          <option value="2">What is your Pet Name</option>
          <option value="3">In which city You Born</option>
        </select>     
        <br>
        <br>
        Answer: 
        <input name="hsq1a" type="text" class="wd">
      </div></td>
    </tr>
    
    <tr>
     <td height="92"><div align="center">SECURITY QUESTION 2</div></td>
     <td><div align="left">
       <select name="hsq2" class="sl">
         <option value="4">Which is your Favourite Sport  </option>
         <option value="5">Who is your Best Friend </option>
       </select>
       <br>
       <br>
       Answer: 
       <input name="hsq2a" type="text" class="wd">
       
     </div></td>
    </tr>
 
    
    <tr  class="nv">
      <td height="108"><div align="center">CAPTHIA</div></td>
      <td><p align="left">&nbsp;</p>
      	<div align="left"><img src="captcha.jsp" id="cpt">
    	  </div>
      	<p align="left">&nbsp;</p>        <p align="left">Enter Characters
          <input class="wd" type="text" name="hcpt"  id="fname" onChange="myFunction()"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          <input type="button" value="Refresh" onClick="ref();" style="display:none"></p>      </td>
    </tr>
    
    <tr>
      <td height="75" colspan="2"><div align="center" ><input name="acp" type="checkbox" value="ON1">I hearby accept all termes and condition regarding to ECI voting Scheme 
        
      </div></td>
    </tr>
    
    <tr class="nv">
      <td height="64" colspan="2"><div align="center">
        <p>
          <input class="bt" type="submit" value="SUBMIT">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input class="bt" type="button" value="CLEAR">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input class="bt" type="button" value="CANCEL" onClick="">
        </p>
      </div></td>
    </tr>
    
</table>
</form>

<div>
    <table width="270" height="971" border="0" cellspacing="0" id="hide1">
      <tr class="hid" id="ernam">
        <td width="268" height="42"><div id="pernam"> </div></td>
        </tr>
      <tr>
        <td height="55"><span id="ervot"></span>&nbsp;</td>
        </tr>
      <tr class="hid">
        <td height="57"><span id="ereid"></span>&nbsp;</td>
        </tr>
      <tr class="hid" id="erunam">
        <td height="58">&nbsp;</td>
        </tr>
      <tr class="hid" id="erpas">
        <td height="54">&nbsp;</td>
        </tr>
      <tr class="hid" id="erpas2">
        <td height="60">&nbsp;</td>
        </tr>
      <tr class="hid" >
        <td height="60">&nbsp;</td>
        </tr>
      <tr class="hid" id="erdis">
        <td height="58">&nbsp;</td>
        </tr>
      <tr  class="hid" id="erpin">
        <td height="51">&nbsp;</td>
        </tr>
      <tr class="hid" id="ersqr">
        <td height="87">&nbsp;</td>
        </tr>
      <tr class="hid" id="ersqr2">
        <td height="94">&nbsp;</td>
      </tr>
      <tr  class="hid" id="ercpt">
        <td height="155">&nbsp;</td>
        </tr>
      <tr  class="hid" id="eracp">
        <td height="70">&nbsp;</td>
        </tr>
    </table>
    
  </div>
  
</div>
</body>
</html>
