<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>ADD PARTY</title>
</head>
<%@page import="javax.swing.JOptionPane"%>
<%! public static String varea; %>
<%
 String adm=(String)session.getAttribute("uadmi");

if((session.getAttribute("uadmi")!="" || session.getAttribute("uadmi")!=null) && ("AvaibhavB".equals(adm)) )
{		

	String vparty,dparty,img;
	
	vparty=(String)request.getParameter("iparty");
	img=(String)request.getParameter("partysm").trim();
	
	img="party/"+img+".jpg".trim();
	
	int f1=0,f2=0,f3=0,flg=0,f4=0,f5=0, i,len;

	ResultSet rs,rs1;
	Connection con;
	Statement stm,ins;
	PreparedStatement ps, ps1;
	
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:vote");
	ps=con.prepareStatement("SELECT pname FROM party ",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
 	rs=ps.executeQuery();
 	
 	while(rs.next())
 	{
 		if(vparty.equals(rs.getString("pname")) || img.equals("0"))
 		{
 			f1=0;
 			JOptionPane.showMessageDialog(null,"PARTY ALREADY EXISTS or INVALID IMAGE","REG_ERROR",JOptionPane.ERROR_MESSAGE);
			break;	
 		}
 		else
 			f1=1;
 		
 	}
 	
 	ps.close();
 	
 	if(f1==1)
 	{
 		ps1=con.prepareStatement("INSERT INTO party(pname,psymb) VALUES(?,?)");
 		ps1.setString(1, vparty);
 		ps1.setString(2, img);
 		
 		int ck= ps1.executeUpdate();
 		if(ck>=1)
 		{
 			JOptionPane.showMessageDialog(null,"RECORD ADDED SUCCESSFULLY","COMPLETE",JOptionPane.ERROR_MESSAGE);
 			response.sendRedirect("admi.jsp");
 		}
 		
 	}
}
else
{
	JOptionPane.showMessageDialog(null,"YOUR SESSION IS EXPIRED LOGIN AGAIN ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
	response.sendRedirect("welcomeECI.jsp");
}

%>