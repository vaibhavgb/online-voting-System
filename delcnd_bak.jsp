
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.swing.JOptionPane"%>


<%
String adm= (String)session.getAttribute("uadmi");
if((session.getAttribute("uadmi")!="" || session.getAttribute("uadmi")!=null) && ("AvaibhavB".equals(adm)) )
{		
	int res= JOptionPane.showConfirmDialog(null, "Are Sure To Delete Record ?", "CONFORM", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);

	if(res==JOptionPane.YES_OPTION)
	{
		Connection con;
		ResultSet rs;
		PreparedStatement ps;
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con=DriverManager.getConnection("jdbc:odbc:vote");
		
		ps=con.prepareStatement("DELETE FROM cndt WHERE cvid=?");
		
		ps.setString(1, (String)session.getAttribute("dtecvid"));

		int ck =ps.executeUpdate();
	
		
		con.commit();
		
		ps.close();
		con.close();
		JOptionPane.showMessageDialog(null, "RECORD DELETED ", "DELETE",JOptionPane.INFORMATION_MESSAGE);
		session.removeAttribute("tdlvid");
		response.sendRedirect("admi.jsp");
	}
	else
	{
		session.removeAttribute("tdlvid");
		JOptionPane.showMessageDialog(null, "RECORD UNCHAGED ", "NOT CHANGE",JOptionPane.INFORMATION_MESSAGE);
		response.sendRedirect("admi.jsp");
		
	}
	
}
else
{
	session.removeAttribute("tdlvid");
	JOptionPane.showMessageDialog(null,"YOUR SESSION IS EXPIRED LOGIN AGAIN ","REG_ERROR",JOptionPane.ERROR_MESSAGE);
	response.sendRedirect("welcomeECI.jsp");
}



%>