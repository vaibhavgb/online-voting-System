<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<%@page import="javax.swing.JOptionPane"%>
<%
	String vnam,vnam1,vnam2,vnam3,uid,vdob,vid,dvnam,dar,dvid,dvdob,vunam,vsq1,vsq2,sq1a,sq2a,mans;
	vid=request.getParameter("ivid");
	vnam1=request.getParameter("iltnam");
	vnam2=request.getParameter("iftnam");
	vnam3=request.getParameter("imtnam");
	vnam=vnam1+" "+vnam2+" "+vnam3;
	vdob=request.getParameter("idob");	
	vsq1=request.getParameter("sq1");
	sq1a=request.getParameter("sq1a");
	sq2a=request.getParameter("sq2a");
	vsq2=request.getParameter("sq2");
	
	

	ResultSet rs,rs1;
	Connection con,con1;
	Statement stm,ins;
	PreparedStatement ps, ps1;
	
	if(vid!="")
	{	
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:vote");
		ps=con.prepareStatement("SELECT * FROM newur WHERE vidno=?");
 		ps.setString(1,vid);
		rs=ps.executeQuery();
		
 		while(rs.next())
		{
			mans=rs.getString("unm");
			if(! ("0".equals(mans)))
			{
					if(vnam.equalsIgnoreCase(rs.getString("vname")) && vdob.equals(rs.getString("vdob")) && sq1a.equals(rs.getString("vsq1a")) && sq2a.equals(rs.getString("vsq2a")))
					{
					
						String ans="";
						int ck=0;
						Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
						con1=DriverManager.getConnection("jdbc:odbc:vote");
						ps1=con.prepareStatement("SELECT pas FROM user WHERE unm=?");
						ps1.setString(1,mans);
						rs1=ps1.executeQuery();
							
						while(rs1.next())
						{
							ans=rs1.getString("pas");
							ck=1;
						}
					
							JOptionPane.showMessageDialog(null,"YOUR Password is: "+ans,"SUCESS",JOptionPane.ERROR_MESSAGE);
							response.sendRedirect("welcomeECI.jsp");
							break;
						
				}		
				else
				{
					JOptionPane.showMessageDialog(null,"Invalid Information ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
					response.sendRedirect("welcomeECI.jsp");
					break;
				}
		}			
 		else
			{
				JOptionPane.showMessageDialog(null," USER NOT REGISTREED","REG_ERROR",JOptionPane.ERROR_MESSAGE);
				response.sendRedirect("welcomeECI.jsp");
				break;
			}
	}
}
	else
	{

		JOptionPane.showMessageDialog(null,"YOUR SESSION IS EXPIRED LOGIN AGAIN ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
		response.sendRedirect("welcomeECI.jsp");
	}


%>
<body>

</body>
</html>