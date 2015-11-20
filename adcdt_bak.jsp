<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>ADD USER</title>
</head>
<%@page import="javax.swing.JOptionPane"%>
<%
	

String adm=(String)session.getAttribute("uadmi");

if((session.getAttribute("uadmi")!="" || session.getAttribute("uadmi")!=null) && ("AvaibhavB".equals(adm)) )
{			

	String vnam,vnam1,vnam2,vnam3,uid,vdob,vid,dvnam,vunam,vpar,vparty;
	vid=request.getParameter("ivid");
	vnam1=request.getParameter("iltnam");
	vnam2=request.getParameter("iftnam");
	vnam3=request.getParameter("imtnam");
	vnam=vnam1+" "+vnam2+" "+vnam3;
	vdob=request.getParameter("idob");	
	vpar=request.getParameter("ihipr");
	vparty=request.getParameter("iparty");
	
	
	
	int f1=0,f2=0,f3=0,flg=0,f4=0,f5=0,f7=0, i,len;

	ResultSet rs,rs1;
	Connection con;
	Statement stm,ins;
	PreparedStatement ps, ps1;
	
	if(vid!="")
	{
		f1=1;
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:vote");
		ps=con.prepareStatement("SELECT * FROM cndt");
 		rs=ps.executeQuery();
		
 		if( vparty!="0")
 		{
 			f4=1;
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
 			
 					if(vparty.equalsIgnoreCase(rs.getString("cparty"))  &&  vpar.equals(rs.getString("casbly")) )
 					{
 						f7=0;
 				 		JOptionPane.showMessageDialog(null,"CANDIDATE WITH PARTY ALREADY EXISTS","REG_ERROR",JOptionPane.ERROR_MESSAGE);
 						break;
 					}
 					else
 					{
 						f7=1;
 					}
 				}	
 		}	
 	 	else
 	 		f4=0;
	 
 	
 	for(int j=0;j<1;j++)
 	{	
 			if(flg!=1)
 			{	
				JOptionPane.showMessageDialog(null,"CANDIDATE ID ALREADY REGISTRED ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
				break;
 			}
 			
 			if(f4!=1)
 			{
 				JOptionPane.showMessageDialog(null,"PLEASE ENTER PARTY NAME ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
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
	
 			
 			if(vnam1!="" && vnam2!="" && vnam3!="")
				f2=1;
			else
			{
				f2=0;
				JOptionPane.showMessageDialog(null,"PLEASE ENTER NAMES ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
				break;	
			}
			
			
			
			if(vdob!=null)
				f5=1;
			else
			{
				f5=0;
				JOptionPane.showMessageDialog(null,"PLEASE ENTER DATE ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
				break;
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
		try{
			
				String psy=null;
				ResultSet rs2;
				PreparedStatement ps2;
				Connection con2;
				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				con2=DriverManager.getConnection("jdbc:odbc:vote");
			 	ps2=con2.prepareStatement("SELECT * FROM party WHERE pname=?");
				ps2.setString(1,vparty);
       			rs2=ps2.executeQuery();
				
				while(rs2.next())
					psy=rs2.getString("psymb");
						
			
			Connection con1;
			String tm="0";
			
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con1=DriverManager.getConnection("jdbc:odbc:vote");

			ps1= con1.prepareStatement("INSERT INTO cndt( cvid, cname, cdob,cparty,casbly,cvote,psymb) VALUES (?,?,?,?,?,?,?)");
			
			ps1.setString(1,vid);
			ps1.setString(2,vnam);
			ps1.setString(3,vdob);
			ps1.setString(4,vparty);
			ps1.setString(5,vpar);
			ps1.setString(6,tm);
			ps1.setString(7,psy);
			
			ps1.executeUpdate();
			
			con1.commit();
			con1.close();
		
				JOptionPane.showMessageDialog(null,"RECORD INSERTED SUCCESSFULLY ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
				response.sendRedirect("adcdt.jsp");
				
			
			
		}
		catch (Exception e)
		{	
			JOptionPane.showMessageDialog(null,"PLEASE TRY AGAIN ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("aduser.html");
		}	
	}
	
	else
	{
		JOptionPane.showMessageDialog(null,"PLEASE TRY AGAIN ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
		response.sendRedirect("adcdt.jsp");
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