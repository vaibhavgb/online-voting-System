<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>forget password</title>
<meta charset="utf-8">
<title>VOTE HERE</title>

<link type="text/css" rel="stylesheet" href="css/menu1.css">
<link type="text/css" rel="stylesheet" href="css/time.css">

</head>

<style type="text/css">
td.glo a:hover{
	color:#FFFFFF;
	font-size:21px;
}

input.cn
{
	height:20px;
	width:50px;
	border:thin;
	color:#0033FF;
	border-bottom-left-radius:10px;
	border-bottom-right-radius:10px;
	border-top-left-radius:10px;
	border-top-right-radius:10px;
	background-color:#0033FF;
}

</style>

<script type="text/jscript">
javascript:window.history.forward(1);
</script>

<body>
<img src="img/head2.jpg" align="top" width="1351" >

<table border="00" cellpadding="00" cellspacing="00" height="41" width="1325" bgcolor="#E6E6FF" style="margin-top:-3px;">
<tr bgcolor="#93A5C4">
<th>
<div class="horz">
<ul> 
	<li><a href="welcomeECI.jsp">HOME</a></li>
	<li><a href="vtresult.jsp">RESULT</a></li>
	<li><a href="welcomeECI.jsp">CONTACT US</a></li>
   	<li> <a href="logout.jsp"><span style="color:#800000">LOG OUT</span> </a></li> 
 </ul>
 </div>
 </th>
 </tr>
</table>

<form action="frgpas_bak.jsp" method="post">
<table width="1137" height="267" border="0.5" cellpadding="2" cellspacing="5" style="margin-top:120px; margin-left:50px">
  <tr>
    <td width="433" height="110" align="center" style bgcolor="#CC33CC">VOTTER ID NO.:&nbsp;&nbsp;
    <input class="wd" type="text" name="ivid"> </td>
    <td width="663" class="nv" align="center">NAME OF VOTTER :  
      <input class="cp" type="text" name="iltnam" id="n1">&nbsp;&nbsp;&nbsp;<input  class="cp" name="iftnam" type="text">&nbsp;&nbsp;&nbsp;<input class="cp" name="imtnam" type="text">&nbsp;<br><br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LAST NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FIRST NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MIDDLE NAME
	</td> 
  </tr>
  <tr>
    <td height="70">&nbsp;</td>
    <td align="center" style="background-color:#C0C0C0">DATE OF BIRTH : 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input class="cp" type="date" name="idob">
    </td>
  </tr>
  
  <tr>
    <td height="70" style="background-color:#C0C0C0"><p>SECURITY QUESTION 1 :  
      <select name="sq1" class="sl" id="ihipr" >
        <option selected="selected" value="0">-- Select Question --</option>
         <option value="1">What is your Mother median Name </option>
          <option value="2">What is your Pet Name</option>
          <option value="3">In which city You Born</option>
      </select>
    </p></td>
    <td align="center" class="nv">
    <p>ANSWER :   
      <input type="text" name="sq1a"> </p></td>
  </tr>
  
   <tr>
    <td height="90" > <p>SECURITY QUESTION 2:  
          &nbsp;&nbsp;&nbsp;&nbsp;
          <select name="sq2" class="sl" id="ihipr" >
            <option selected="selected" value="0">-- Select Question--</option>
             <option value="4">Which is your Favourite Sport  </option>
        	 <option value="5">Who is your Best Friend </option>
        </select>
        </p></td>
      <td style="background-color:#C0C0C0" width="100" align="center">&nbsp;
       
     <p> ANSWER:   
       <input type="text" name="sq2a"></p></td>
  </tr>
  
   <tr>
    <td height="70">&nbsp;</td>
    <td align="center" class="nv">
        <input style="background-color:#009900" type="submit" value="SUBMIT">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input style="background-color:#993333" type="button" name="iclr" onClick="clr()" value="CLEAR" >
    </td>
  </tr>
  </table>

</form>


<body>
</body>
</html>