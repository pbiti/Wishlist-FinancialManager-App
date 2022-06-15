<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="util.Connector"%>
<%
//get the id parameter which indicates the id of the review the user asked to delete.
String id=request.getParameter("id");
try
{
    //connection to the database with the information below
	Connector connectdb = new Connector();
	Connection conn = connectdb.getConn();
	Statement st = connectdb.getStmt();
	//delete the review with the specific id that the user asked to delete
	st.executeUpdate("DELETE FROM reviews WHERE id="+id);
}
catch(Exception e)
{
	System.out.print(e);
	e.printStackTrace();
}
//return to the previous url, the page that requested this jsp page.
String referer = request.getHeader("Referer");
((HttpServletResponse) response).sendRedirect(referer);
%>