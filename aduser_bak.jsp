<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>ADD USER</title>
</head>
<%@page import="javax.swing.JOptionPane"%>
<%! public static String varea; %>
<%! public static int f1=0,f2=0,f3=0,flg=0,f4=0,f5=0, i,len; %>
<%
 String adm=(String)session.getAttribute("uadmi");

if((session.getAttribute("uadmi")!="" || session.getAttribute("uadmi")!=null) && ("AvaibhavB".equals(adm)) )
{		

	String vnam,vnam1,vnam2,vnam3,uid,vdob,vid,dvnam,dar,dvid,dvdob,vunam,vpar,dpr;
	vid=request.getParameter("ivid");
	vnam1=request.getParameter("iltnam");
	vnam2=request.getParameter("iftnam");
	vnam3=request.getParameter("imtnam");
	vnam=vnam1+" "+vnam2+" "+vnam3;
	vdob=request.getParameter("idob");	
	vpar=request.getParameter("ihipr");
	
	
	
	

	ResultSet rs,rs1;
	Connection con;
	Statement stm,ins;
	PreparedStatement ps, ps1;
	
	if(vid!="")
	{
		f1=1;
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:vote");
		ps=con.prepareStatement("SELECT * FROM newur");
 		rs=ps.executeQuery();
		
 		while(rs.next())
 		{
 			String ttvid=rs.getString("vidno"); 
 			
 			
			if(vid.equalsIgnoreCase(ttvid))
			{
				flg=0;
				break;
			}
			else
				flg=1;	
 		}	
 		
 	
 	for(int j=0;j<1;j++)
 	{	
 			if(flg==0)
 			{	
				JOptionPane.showMessageDialog(null,"VOTTER ID ALREADY REGISTRED ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
				break;
 			}
 			
 			try{
			if(vpar!="0")
			{
				f3=1;
				
	
					
				if(vpar.compareTo("Pune")==0 )
				{			
						varea=request.getParameter("ihsarea2");
						f4=1;
						
				}
					
				
				else if(vpar.compareTo("Maval")==0 )
				{
						varea=request.getParameter("ihsarea");
						f4=1;	
				}
				
				
				else if(vpar.compareTo("Shirur")==0 )
				{
						varea=request.getParameter("ihsarea4");
						f4=1;	
				}
				
	
				else if(vpar.compareTo("Baramati")==0)
				{
						varea=request.getParameter("ihsarea3");
						f4=1;
				}
				else
				{
				
					f4=0;
					JOptionPane.showMessageDialog(null,"PLEASE SELECT PARLIAMENTARY CONSTITUENCIES","REG_ERROR",JOptionPane.ERROR_MESSAGE);
					break;
				}
				
			}	
 			
 			}catch (Exception e)
				{
 					f3=0;
					JOptionPane.showMessageDialog(null,"PLEASE SELECT REAGON","REG_ERROR",JOptionPane.ERROR_MESSAGE);
					break;
					
				}
 			
		
			
	
			if(vnam1!="" && vnam2!="" && vnam3!="")
				f2=1;
			else
			{
				f2=0;
				JOptionPane.showMessageDialog(null,"PLEASE ENTER NAMES ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
				break;
			//	response.sendRedirect("aduser.jsp");
				
			}
			
			
			
			if(vdob!=null)
				f5=1;
			else
			{
				f5=0;
				JOptionPane.showMessageDialog(null,"PLEASE ENTER DATE ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
				break;
		//		response.sendRedirect("aduser.jsp");
			}
		
	}
		ps.close();
 		con.close();
 		
		
	}
	else
	{
		f1=0;
		JOptionPane.showMessageDialog(null,"PLEASE ENTER VOTER ID ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
	}
	
	
	
	if(f1==1 && f2==1 && f3==1 && f4==1 && f5==1 && flg==1)
	{
		//try{
			Connection con1;
			String tm="0";
			
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con1=DriverManager.getConnection("jdbc:odbc:vote");

			ps1= con1.prepareStatement("INSERT INTO newur( vidno, vname, vdob, vsarea, parea, unm) VALUES (?,?,?,?,?,?)");
			
			ps1.setString(1,vid);
			ps1.setString(2,vnam);
			ps1.setString(3,vdob);
			ps1.setString(4,varea);
			ps1.setString(5,vpar);
			ps1.setString(6,tm);
			
			ps1.execute();
			
			
			ps1.close();
			
			con1.commit();
			con1.close();
			
			
				JOptionPane.showMessageDialog(null,"RECORD INSERTED SUCCESSFULLY ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
				response.sendRedirect("aduser.html");
				
			
			
/*		}
		catch (Exception e)
		{
			JOptionPane.showMessageDialog(null,"PLEASE TRY AGAIN ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("aduser.html");
		}*/	
	}
	
	else
	{
		JOptionPane.showMessageDialog(null,"PLEASE TRY AGAIN ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
		response.sendRedirect("aduser.html");
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