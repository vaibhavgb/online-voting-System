<%@page import="java.io.IOException"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<%
try
{
		

	String vid,vcot,vadr,vq1a,vq2a,vcpt,vpas1,vpas2,vmail,uid;
	int vq1,vq2,vpin;

	int f1=0,f2=0,f3=0,f4=0;
	
	
	//vid=request.getParameter("hvid");
	vadr=request.getParameter("hadr1")+ " "+request.getParameter("hadr2")+" "+request.getParameter("hadr3");
	vq1a=request.getParameter("hsq1a");
	vq2a=request.getParameter("hsq2a");
	vpas1=request.getParameter("hpas");
	vpas2=request.getParameter("hcpas");
	vmail=request.getParameter("hmail");
	uid=request.getParameter("huid");
	
	vcpt=request.getParameter("hcpt");
	
	vpin=Integer.parseInt(request.getParameter("hpin"));
	vq1=Integer.parseInt(request.getParameter("hsq1"));
	vq2=Integer.parseInt(request.getParameter("hsq2"));
	vcot=request.getParameter("hcot");
		
		
	
	if((session.getAttribute("tvid")!=null || session.getAttribute("tunm")!=null) ) 			
	{
		
		f1=1;								/// validations ///
		
		if("ON1".equals(request.getParameter("acp")) )										
		{
			f2=1;
			////////////////\\\\\\\\\\\\\								
			if((vq1>0 && vq1<=3) && (vq2>3 && vq2<=5)) //security questions
				f3=1;
			else
			{
				f3=0;
				JOptionPane.showMessageDialog(null,"PLEASE SELECT SECURITY QUESTION ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
			}
			
			////////////////////
			if(vcpt.equals((String)session.getAttribute("captcha")) && vcpt!=null)
				f4=1;
			
			else
			{
				f4=0;
				JOptionPane.showMessageDialog(null,"ENTER PROPER CAPTCHA CHARCTER","REG_ERROR",JOptionPane.ERROR_MESSAGE);
			}
			
		}
		else 
		{
			f2=0;
			JOptionPane.showMessageDialog(null,"PLEASE ACCEPT THE TERMS & CONDITION","REG_ERROR",JOptionPane.ERROR_MESSAGE);
		}
	
	
	}
	else
	{
		JOptionPane.showMessageDialog(null,"YOUR SESSION EXPIRE","REG_ERROR",JOptionPane.ERROR_MESSAGE);
		response.sendRedirect("welcomeECI.jsp");
	}
	

	if(f3==1 && f1==1 && f2==1 && f4==1)
	{
		
		
		Connection con;
		Statement st;
		PreparedStatement ps, ps1;
		ResultSet rs;
		
		
		String cvid =((String)session.getAttribute("tvid"));
		String cvunm =((String)session.getAttribute("tunm"));
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:vote");
		int tm=0;
		
		
			ps1= con.prepareStatement("UPDATE newur SET uid=?, vaddr=?, cot=?, vpincod=?, vsq1=?, vsq1a=?, vsq2=?, vsq2a=?, unm=?,mail=? WHERE vidno=?");
			
			ps1.setString(1,uid);
			ps1.setString(2,vadr);
			ps1.setString(3, vcot);
			ps1.setInt(4,vpin);
			ps1.setInt(5,vq1);
			ps1.setString(6, vq1a);
			ps1.setInt(7,vq2);
			ps1.setString(8, vq2a);
			ps1.setString(9, cvunm);
			ps1.setString(11, cvid);
			ps1.setString(10, vmail);
			
			int cn= ps1.executeUpdate();
			
												/////////// User Update\\\\\\\\\\\\\\\\	
												
		String qur ="INSERT INTO user(unm,pas,chk) VALUES ('"+ cvunm +"', '"+ vpas1 +"',0)"; 
		
	
		ps=con.prepareStatement("INSERT INTO user(unm,pas,chk) VALUES (?, ?, ?)" );
		ps.setString(1, cvunm);
		ps.setString(2, vpas1);
		ps.setInt(3, tm);
		
		boolean b1=false;
		b1=ps.execute();
	
			
			if(cn>0)
			{
				JOptionPane.showMessageDialog(null,"YOUR ARE REGISTRED SUCESSFULLY \n PLEASE LOGIN TO VOTE","REG_SUCCESS",JOptionPane.ERROR_MESSAGE);
				session.removeAttribute("tuid");
				session.removeAttribute("tvid");
				session.removeAttribute("tunm");
				session.removeAttribute("tnm1");
				session.removeAttribute("tnm2");
				session.removeAttribute("tnm3");
				session.removeAttribute("tdob");
				
				response.sendRedirect("welcomeECI.jsp");
	 		}	
	}
	else
	{
		response.sendRedirect("newur.jsp");
	}
	
	
	
}
 catch(Exception e)
 {
		JOptionPane.showMessageDialog(null,"ERROR "+e," UNKNOWN_ERROR",JOptionPane.ERROR_MESSAGE);
		
		session.removeAttribute("tuid");
		session.removeAttribute("tvid");
		session.removeAttribute("tunm");
		session.removeAttribute("tnm1");
		session.removeAttribute("tnm2");
		session.removeAttribute("tnm3");
		session.removeAttribute("tdob");
		
		response.sendRedirect("welcomeECI.jsp");
	}
%>


</body>
</html>