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

	String vnam,uid,vdob,vid,vunam,vpar,tnvid,vpart;
	vid=request.getParameter("ivid").trim();
	vnam=request.getParameter("iltnam").trim();
//	vnam2=request.getParameter("iftnam");
//	vnam3=request.getParameter("imtnam");
//	vnam=vnam1+" "+vnam2+" "+vnam3;
	vdob=request.getParameter("idob").trim();	
	vpar=request.getParameter("ihipr").trim();
	vpart=request.getParameter("iparty").trim();
	
	
	tnvid=(String)session.getAttribute("tecvid");
	
	
	int f1=0,f2=0,f3=0,flg=0,f4=0,f5=0,f7=0, i,len;

	ResultSet rs,rs1;
	Connection con;
	Statement stm,ins;
	PreparedStatement ps, ps1,ps2;
	
	if(vid!="")
	{
		f1=1;

		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:vote");
		ps=con.prepareStatement("SELECT * FROM cndt", ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
 		rs=ps.executeQuery();
		
		if(!(vid.equals(tnvid.trim())))
		{	
	 		cnt=0;
 		
	 		
	 		while(rs.next())
 			{
 				String ttvid=rs.getString("cvid");
 		
 		
				if(ttvid.equals(vid))
				{
					flg=0;
					break;
				}	
				else
					flg=1;	
				
				if(vpart.equalsIgnoreCase(rs.getString("cparty"))  &&  vpar.equals(rs.getString("casbly")) )
				{
					f7=0;
					JOptionPane.showMessageDialog(null,"CANDIDATE WITH PARTY ALREADY EXISTS IN ASSIMBLY","REG_ERROR",JOptionPane.ERROR_MESSAGE);
					break;		
				}
				else
					f7=1;
				
				
					
 			}	
		}
		else
		{
				
			while(rs.next())
			{	
				if(vpart.equalsIgnoreCase(rs.getString("cparty"))  &&  vpar.equals(rs.getString("casbly")) )
				{
					f7=0;
					
					JOptionPane.showMessageDialog(null,"CANDIDATE WITH PARTY ALREADY EXISTS IN ASSIMBLY","REG_ERROR",JOptionPane.ERROR_MESSAGE);
					break;		
				}
				else	
					f7=1;
			}
			flg=1;
		}
 		
 	
 	for(int j=0;j<1;j++)
 	{	
 			if(flg!=1)
 			{	
				JOptionPane.showMessageDialog(null," CANDIDATE ALREADY REGISTRED !! TRY DIFFERENT VID ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
				break;
 			}
 			
 			
			if(vpar!="0")
				f3=1;
			else
			{
				f3=0;
				JOptionPane.showMessageDialog(null,"PLEASE SELECT PARLIAMENTARY CONSTITUENCIES","REG_ERROR",JOptionPane.ERROR_MESSAGE);
				break;
			}
				
		
			if(vpart!="0")
				f4=1;
			else
			{
				f4=0;
				JOptionPane.showMessageDialog(null,"PLEASE SELECT PARTY","REG_ERROR",JOptionPane.ERROR_MESSAGE);
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
	
	
	
	if(f1==1 && f2==1 && f3==1 && f4==1 && f5==1 && flg==1 && f7==1)
	{
		//try{
			Connection con1;
			String tm="0";
			
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con1=DriverManager.getConnection("jdbc:odbc:vote");
			
			ps2=con1.prepareStatement("DELETE FROM cndt WHERE cvid=?");
			ps2.setString(1, tnvid);
			int ck=ps2.executeUpdate();
			
			con1.commit();

			if(ck<=1)
			{
				ps1= con1.prepareStatement("INSERT INTO cndt( cvid, cname, cdob, casbly, cparty,cvote) VALUES (?,?,?,?,?,?)");
			
				ps1.setString(1,vid);
				ps1.setString(2,vnam);
				ps1.setString(3,vdob);
				ps1.setString(4,vpar);
				ps1.setString(5,vpart);
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