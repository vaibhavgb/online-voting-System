<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>ADD USER</title>
</head>
<%@page import="javax.swing.JOptionPane"%>
<%! public static String varea; %>
<%
 String adm=(String)session.getAttribute("uadmi");

if((session.getAttribute("uadmi")!="" || session.getAttribute("uadmi")!=null) && ("AvaibhavB".equals(adm)) )
{		

	String vnam,vnam1,vnam2,vnam3,uid,vdob,vid,dvnam,dar,dvid,dvdob,vunam,vpar,dpr;
	vid=(JOptionPane.showInputDialog("Enter VOTER id of CANDIDATE "));
	
	
	
	int f1=0,f2=0,f3=0,flg=0,f4=0,f5=0, i,len;

	ResultSet rs,rs1;
	Connection con;
	Statement stm,ins;
	PreparedStatement ps, ps1;
	
	
	if(vid!="")
	{
		f1=1;
		
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:vote");
		ps=con.prepareStatement("SELECT * FROM cndt WHERE cvid=?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		ps.setString(1, vid);
	 	rs=ps.executeQuery();
		
	 	if(!rs.isBeforeFirst())
	 	{
	 		JOptionPane.showMessageDialog(null,"INVALID VOTTER ID ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("admi.jsp");
	 	}
	 	else
	 	{
	 		
	 		while(rs.next())
 			{
	 			if(!("0".equals(rs.getString("cvote"))))
		 		{ 		
 				
 					session.setAttribute("tecvid", vid);
 					session.setAttribute("tecnm",rs.getString("cname"));
 					session.setAttribute("tecprty",rs.getString("cparty"));
 					session.setAttribute("tecdob",rs.getString("cdob"));
 					session.setAttribute("tecabl",rs.getString("casbly"));

 			
 					response.sendRedirect("edcnd.jsp");
 				}
		 		else
		 		{
		 			
		 			JOptionPane.showMessageDialog(null,"CANDIDATE CANNOT BE EDITED ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
		 			response.sendRedirect("admi.jsp");
		 			break;
		 		}

	 		}
	 	}	
	}
	
	else
	{
		JOptionPane.showMessageDialog(null,"PLEASE ENTER VOTTER ID ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
		response.sendRedirect("admi.jsp");
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