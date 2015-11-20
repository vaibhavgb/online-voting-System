<%@page import="java.util.Enumeration"%>
<%@page import="com.sun.org.glassfish.external.statistics.Statistic"%>
<%@page import="org.apache.catalina.connector.Request"%>
<%@page import="org.apache.catalina.ant.ReloadTask"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<html>
<body>
<%@ page import="javax.swing.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%
		int flg=0;
		int cn=0;
		String nam =(String)request.getParameter("u1");
		String pas = (String)request.getParameter("p1");
		
	    
			for(int i=0; i<(nam.length()); i++)
			{
				char c=nam.charAt(i);
	
				if((Character.isLetter(c) || Character.isDigit(c) ) )			
					flg=1;	
			
					
				else
				{
					flg=0;
					break;		
				}	
			}

	
	    
		if(flg==1)
		{
			
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con= DriverManager.getConnection("jdbc:odbc:vote");
			String n,p,qur;
			int ck=0,mrk=0;
			String s[] = new String[2];
			Statement stm = con.createStatement(ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stm.executeQuery("select unm,pas,chk from user");
			while(rs.next())
			{
				n=rs.getString(1);
				p=rs.getString(2);
				ck=rs.getInt(3);
				
				if(n.equals(nam) && (p.equals(pas)))
				{
					session.setAttribute("unm", nam);
					session.removeAttribute("logcn");
					mrk=1;
					break;
				}
				else
					mrk=0;
			}
				
			if(mrk==1)
			{
				if (ck==1)
					response.sendRedirect("voted.jsp");
					
				else
				{
					if(nam.equals("AvaibhavB"))
					{
					  if("78521".equals(JOptionPane.showInputDialog("Enter Admin id")))
					  {
						session.setAttribute("uadmi", nam);  
						response.sendRedirect("admi.jsp");
					  }
					  else
						  response.sendRedirect("loger.jsp"); 
					}
						
					else
						response.sendRedirect("slogin.jsp");
				}
					
			}
			else 
				response.sendRedirect("loger.jsp");
			
			
		}

		else
		{	
				JOptionPane.showMessageDialog(null, "No special Character is allowed ", "Login Detained", JOptionPane.INFORMATION_MESSAGE);
				getServletContext().getRequestDispatcher("/welcomeECI.jsp").include(request, response);
		}
		
%>



</body>
</html>
