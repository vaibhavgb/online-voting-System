<%@page import="javax.swing.JOptionPane"%>
<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<%! public static String varea; %>
<%


	String vnam,vnam1,vnam2,vnam3,uid,vdob,vid,dvnam,dar,dvid,dvdob,vunam,vpar,dpr;
	vid=request.getParameter("hvid");
	vnam1=request.getParameter("hltnam");
	vnam2=request.getParameter("hftnam");
	vnam3=request.getParameter("hmtnam");
	vnam=vnam1+" "+vnam2+" "+vnam3;
	vdob=request.getParameter("hvdob");	
	vunam=request.getParameter("hunam");
	vpar=request.getParameter("hpar");
	
	int f1=0,f2=0,f3=0,flg=0,f4=0, i,len;

	ResultSet rs,rs1,rs3;
	Connection con;
	Statement stm,upd,ins;
	PreparedStatement ps, ps1;
	
	
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	con=DriverManager.getConnection("jdbc:odbc:vote");
	ps=con.prepareStatement("SELECT * FROM newur WHERE vidno=?");
	ps.setString(1, vid);
 	rs=ps.executeQuery();
 		
 	
	while(rs.next())
	{
		dvnam=rs.getString(2);
	 	dar=rs.getString(6);
		dvdob=rs.getString(4);
		dpr=rs.getString(13);
		String unam=rs.getString("unm"); 
		
		if(unam.equals("0"))
		{
			if((vnam.compareToIgnoreCase(dvnam))==0 && vnam1!=null && vnam2!=null && vnam3!=null) 
				f1=1;
			else	
			{
				f1=0;
			
				JOptionPane.showMessageDialog(null,"INVALID NAME: "+vnam ,"REG_ERROR",JOptionPane.ERROR_MESSAGE);
				response.sendRedirect("newur.jsp");
				break;
			}
	
		
			if((vdob.compareTo(dvdob))==0 && vdob!=null)
			{
				f2=1;	
			}
			else
			{
				f2=0;
				JOptionPane.showMessageDialog(null,"INVALID DATE OF BIRTH: "+vdob,"REG_ERROR",JOptionPane.ERROR_MESSAGE);
				response.sendRedirect("newur.jsp");
				break;
			}
		
			if((dpr.compareTo(vpar)==0) && vpar!=null)
			{
				f3=1;
				if(vpar.compareTo("Pune")==0)
				{
					varea=request.getParameter("hsarea2");
					if((dar.compareTo(varea)==0)&& varea!=null)
					{
						f3=1;	
					}
					else
					{
						f3=0;
						JOptionPane.showMessageDialog(null,"INVALID REAGON SELECTION: "+varea,"REG_ERROR",JOptionPane.ERROR_MESSAGE);
						response.sendRedirect("newur.jsp");
						break;
					}
				}
				
				if(vpar.compareTo("Maval")==0)
				{
						varea=request.getParameter("hsarea");
						if((dar.compareTo(varea)==0)&& varea!=null)
						{
							f3=1;	
						}
						else
						{
							f3=0;
							JOptionPane.showMessageDialog(null,"INVALID REAGON SELECTION: "+varea,"REG_ERROR",JOptionPane.ERROR_MESSAGE);
							response.sendRedirect("newur.jsp");
							break;
						}
				}
				
				if(vpar.compareTo("Shirur")==0)
				{
						varea=request.getParameter("hsarea4");
						if((dar.compareTo(varea)==0)&& varea!=null)
						{
							f3=1;	
						}
						else
						{
							f3=0;
							JOptionPane.showMessageDialog(null,"INVALID REAGON SELECTION: "+varea,"REG_ERROR",JOptionPane.ERROR_MESSAGE);
							response.sendRedirect("newur.jsp");
							break;
						}
				}
				
				if(vpar.compareTo("Baramati")==0)
				{
						varea=request.getParameter("hsarea3");
						if((dar.compareTo(varea)==0)&& varea!=null)
						{
							f3=1;	
						}
						else
						{
							f3=0;
							JOptionPane.showMessageDialog(null,"INVALID REAGON SELECTION: "+varea,"REG_ERROR",JOptionPane.ERROR_MESSAGE);
							response.sendRedirect("newur.jsp");
							break;
						}
				}	
			}
			else
			{
				f3=0;
				JOptionPane.showMessageDialog(null,"INVALID PARLIAMENTARY CONSTITUENCIES: "+vpar,"REG_ERROR",JOptionPane.ERROR_MESSAGE);
				response.sendRedirect("newur.jsp");
				break;
			}
			
			
		
		
			flg=1;		
		}
		else
		{
			flg=0;		
			JOptionPane.showMessageDialog(null,"VOTTER ALREADY REGISTRED WITH :  "+unam,"REG_ERROR",JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("newur.jsp");
			break;
		}
	}

	stm=con.createStatement();							
 	rs1=stm.executeQuery("SELECT unm FROM newur");
	int ln=vunam.length();
	while(rs1.next())
	 {	
	 	if(vunam.equals(rs1.getString("unm")) || ln<3)
 		{
 			f4=0;
 			break;
 		}
 		
 		else
 			f4=1;
	 }
	


 	//ps1=con.prepareStatement("SELECT unm FROM user");		// check for user name aviliable
 	//rs3=ps1.executeQuery();
 		
 	
	
		
	if(f1==1 && f2==1 && f3==1 && flg==1 && f4==1) //check for all r true
	{
		/*
		////////////////////////
		upd=con.createStatement();
		int cn=upd.executeUpdate("UPDATE newur SET uid='"+ vuid +"' WHERE vidno='"+ vid +"'"); //insert into uid
		upd.close();
		
		ins=con.createStatement();
		ins.executeUpdate("UPDATE user SET unm='" + vunam + "' "); //insert into urname
		ins.close();
	//////////////////////////////////	
	*/
	
		
		if(varea.equals("Panvel") || varea.equals("Karjat") || varea.equals("Uran") )
			session.setAttribute("tdist", "RAIGAD");
			
		else
			session.setAttribute("tdist", "PUNE");
		
	
	
		%>
		<script type="text/javascript">
			if(document.getElementById("hide1").style.display=="none")
				document.getElementById("hide1").style.display="table";	
			
				document.getElementById("hide2").style.display="none";	
				
		</script>
	<%
	
		session.setAttribute("tvid", vid);
		session.setAttribute("tunm", vunam);
		session.setAttribute("tnm1", vnam1);
		session.setAttribute("tnm2", vnam2);
		session.setAttribute("tnm3", vnam3);
		session.setAttribute("tarea", varea);
		session.setAttribute("tdob", vdob);
		session.setAttribute("tpar",vpar);

		
		getServletContext().getRequestDispatcher("/newur.jsp").include(request, response);
	}
	
	
	else
	{
		if (f4!=1)
		{
			if(vunam.length()<3)
				JOptionPane.showMessageDialog(null,"USER NAME MUST CONTAINS 3 CHARCTERS : "+vunam ,"REG_ERROR",JOptionPane.ERROR_MESSAGE);
			else
				JOptionPane.showMessageDialog(null,"USER NAME NOT AVILIABLE : "+vunam ,"REG_ERROR",JOptionPane.ERROR_MESSAGE);
		}
		else
			JOptionPane.showMessageDialog(null,"PLEASE CHECK YOUR VOTTER ID NO. : "+vid,"REG_ERROR",JOptionPane.ERROR_MESSAGE);
	
		if(!response.isCommitted())		
			response.sendRedirect("newur.jsp");
	}
	
%>

</body>
</html>
