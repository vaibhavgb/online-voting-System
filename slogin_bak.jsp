<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.swing.JOptionPane"%>
<%! static int vot; %>
<!DOCTYPE HTML>
<html>

<%

if( (session.getAttribute("unm"))!="" || (session.getAttribute("unm")!=null) )
{		
	int res= JOptionPane.showConfirmDialog(null, "CONFORM VOTE ?", "CONFORM", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);

	if(res==JOptionPane.YES_OPTION)
	{
		ResultSet rs,rs1,rs3;
		Connection con,con1,con2;
		PreparedStatement ps, ps1,ps2;
		String cid=request.getParameter("b1");
	
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:vote");
	ps=con.prepareStatement("SELECT * FROM cndt WHERE cvid=?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	ps.setString(1,cid);
	rs=ps.executeQuery();
	if(rs.isBeforeFirst())
	{	
		while(rs.next())
		{
			 vot=rs.getInt("cvote");
		}
	}
	else
	{
		JOptionPane.showMessageDialog(null, "Your not login ", "Login Detained", JOptionPane.INFORMATION_MESSAGE);
		response.sendRedirect("welcomeECI.jsp");
		
	}
	
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con1=DriverManager.getConnection("jdbc:odbc:vote");
	ps1=con.prepareStatement("UPDATE cndt SET cvote=? WHERE cvid=?");
	vot++;
	ps1.setInt(1, vot);
	ps1.setString(2,cid);
	
	int chk=ps1.executeUpdate();
	
	if(chk>0)
	{
		JOptionPane.showMessageDialog(null, "Your VOTE registreted Succesfully ", "Sucess", JOptionPane.INFORMATION_MESSAGE);
		int b=1;
		String uname=(String)session.getAttribute("unm");
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con2=DriverManager.getConnection("jdbc:odbc:vote");
		ps2=con.prepareStatement("UPDATE user SET chk=? WHERE unm=?");
		ps2.setInt(1,b);
		ps2.setString(2,uname);
		ps2.executeUpdate();
		
		response.sendRedirect("voted.jsp");
		
		
	}
}
else
	{
	
		JOptionPane.showMessageDialog(null, "RECORD UNCHAGED ", "NOT CHANGE",JOptionPane.INFORMATION_MESSAGE);
		response.sendRedirect("slogin.jsp");
		
	}
}
else
{

	JOptionPane.showMessageDialog(null,"YOUR SESSION IS EXPIRED LOGIN AGAIN ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
	response.sendRedirect("welcomeECI.jsp");
}

	
%>

