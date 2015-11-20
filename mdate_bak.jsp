
<%@page import="java.io.IOException"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<!DOCTYPE HTML>
<html>
<meta charset="utf-8">
<head>MANAGE DATE</head>
<%@page import="java.util.Calendar" %>

<%
	Calendar cal= Calendar.getInstance();
	
	int yr=cal.get(Calendar.YEAR);
	int dt=cal.get(Calendar.DATE);
	int mn= cal.get(Calendar.MONTH);
	int tmn,tyr,tdt, f1=0,f2=0,f3=0;
	
	String vdt,vmn,vyr,vdt1,vmn1,vyr1,rdt,rmn,ryr, cdt1,cdt2,cdt,rd,t="0";
	
	vdt=request.getParameter("hvdt");
	vmn=request.getParameter("hvmn");
	
	
	vdt1=request.getParameter("hvdt1");
	vmn1=request.getParameter("hvmn1");
	
	
	rdt=request.getParameter("hrdt");
	rmn=request.getParameter("hrmn");
	
	
	cdt=yr+"-"+mn+"-"+dt;
	cdt1=yr+"-"+vmn+"-"+vdt;
	cdt2=yr+"-"+vmn1+"-"+vdt1;
	rd=yr+"-"+rmn+"-"+rdt;
	
	
	if(cdt1.compareTo(cdt)<0 || vdt==t || vmn==t || vdt1==t || vmn1==t || rdt==t || rmn==t )
	{
		JOptionPane.showMessageDialog(null,"PLEASE INSERT CORRECT DATE","REG_ERROR",JOptionPane.ERROR_MESSAGE);
		
	}
	else
		f1=1;
	
	if(cdt2.compareTo(cdt1)<0)
	{
		JOptionPane.showMessageDialog(null,"LAST DATE MUST BE EQUAL OR HIGHER","REG_ERROR",JOptionPane.ERROR_MESSAGE);
		
	}
	else
		f2=1;
	
	
	if(rd.compareTo(cdt)<0 || rd.compareTo(cdt2)<0 )
	{
		JOptionPane.showMessageDialog(null,"RESULT DATE MUST BE EQUAL OR HIGHER THAN CURRENT DATE","REG_ERROR",JOptionPane.ERROR_MESSAGE);
		
	}
	else
		f3=1;
	
	
	
	if(f1==1 && f2==1 && f3==1)
	{
		Connection con;
		PreparedStatement ps,ps1;
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:vote");
		int tm=2;
		
		ps1=con.prepareStatement("DELETE FROM vdate1 WHERE num=?");
		ps1.setInt(1, 1);
		int ck=ps1.executeUpdate();
			con.commit();
		if(ck<=1)
		{
	
		ps=con.prepareStatement("INSERT INTO vdate1(str,lst,rdt,num) VALUES (?, ?, ?,?)");
		ps.setString(1,cdt1);
		ps.setString(2,cdt2);
		ps.setString(3,rd);
		ps.setInt(4, 1);
		
		//int ck=ps.executeUpdate();
		
		ps.execute();
		
		con.close();
			
			JOptionPane.showMessageDialog(null,"DATE UPDATED SUCCESSFULLY ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("admi.jsp");
		}
	}
	else
	{
	//	JOptionPane.showMessageDialog(null,"PLEASE TRY AGAIN ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
		response.sendRedirect("admi.jsp");
	}


%>