<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>ADD USER</title>
</head>
<%@page import="javax.swing.JOptionPane"%>
<%! public static String varea; %>
<%! public static int cnt; %>

<%
 String adm=(String)session.getAttribute("uadmi");

if((session.getAttribute("uadmi")!="" || session.getAttribute("uadmi")!=null) && ("AvaibhavB".equals(adm)) )
{		

	String vnam,uid,vdob,vid,vunam,vpar,tnvid;
	vid=request.getParameter("ivid").trim();
	vnam=request.getParameter("iltnam").trim();
//	vnam2=request.getParameter("iftnam");
//	vnam3=request.getParameter("imtnam");
//	vnam=vnam1+" "+vnam2+" "+vnam3;
	vdob=request.getParameter("idob").trim();	
	vpar=request.getParameter("ihipr").trim();
	
	tnvid=(String)session.getAttribute("tevid");
	
	
	int f1=0,f2=0,f3=0,flg=0,f4=0,f5=0, i,len;

	ResultSet rs,rs1;
	Connection con;
	Statement stm,ins;
	PreparedStatement ps, ps1,ps2;
	
	if(vid!="")
	{
		f1=1;
		
		if(!(vid.equals(tnvid.trim())))
		{	
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con=DriverManager.getConnection("jdbc:odbc:vote");
			ps=con.prepareStatement("SELECT * FROM newur");
	 		rs=ps.executeQuery();
	 		cnt=0;
 		
	 		JOptionPane.showMessageDialog(null,"VOTTER ID "+tnvid+vid,"REG_ERROR",JOptionPane.ERROR_MESSAGE);
	 		while(rs.next())
 			{
 				String ttvid=rs.getString("vidno");
 		
 		
				if(ttvid.equals(vid))
				{
					flg=0;
					break;
				}	
				else
					flg=1;
 			}	
		}
			else
				flg=1;
 		
 		
 	
 	for(int j=0;j<1;j++)
 	{	
 			if(flg!=1)
 			{	
				JOptionPane.showMessageDialog(null,"VOTTER ID ALREADY REGISTRED !! TRY DIFFERENT ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
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
 			
		
			
	
			if(vnam!=null)
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
			
			ps2=con1.prepareStatement("DELETE FROM newur WHERE vidno=?");
			ps2.setString(1, tnvid);
			int ck=ps2.executeUpdate();
			
			con1.commit();

			if(ck<=1)
			{
				ps1= con1.prepareStatement("INSERT INTO newur( vidno, vname, vdob, vsarea, parea,unm) VALUES (?,?,?,?,?,?)");
			
				ps1.setString(1,vid);
				ps1.setString(2,vnam);
				ps1.setString(3,vdob);
				ps1.setString(4,varea);
				ps1.setString(5,vpar);
				ps1.setString(6,tm);
				
				ps1.execute();
			
				con1.commit();
				con1.close();
				JOptionPane.showMessageDialog(null,"RECORD INSERTED SUCCESSFULLY ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
				response.sendRedirect("admi.jsp");
			}	
			
			else
			{
				JOptionPane.showMessageDialog(null,"PLEASE TRY AGAIN ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
				response.sendRedirect("admi.jsp");
			}

			
/*		}
		catch (Exception e)
		{
			JOptionPane.showMessageDialog(null,"PLEASE TRY AGAIN ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("admi.jsp");
		}*/	
	}
	
	else
	{
		JOptionPane.showMessageDialog(null,"PLEASE TRY AGAIN ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
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