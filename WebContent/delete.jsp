<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="util.Connector"%>
<%
//id parameter , which indicates the id of the product review that the user asked to delete.
String id=request.getParameter("id");
//user in the current session
String uname=request.getParameter("uname");
//the product for which the review war written about
String prname=request.getParameter("prname");
try
{
	//connection to the database with the information below
	Connector connectdb = new Connector();
	Connection conn = connectdb.getConn();
	Statement st = connectdb.getStmt();
	ResultSet resultSet = null;
	//delete the review with the specific id that the user asked to delete
	st.executeUpdate("DELETE FROM item_ratings WHERE id="+id);
	PreparedStatement ps = null;
	
	ps = conn.prepareStatement("delete from user_products_rate where username = ? and ebay_products_name = ?");
	ps.setString(1, uname);
	ps.setString(2, prname);
	ps.executeUpdate();
	
	String UPDATE_MEAN_RATING = "update ebay_products set rating = ? where name = ?";
	String COMPUTE_MEAN_RATING = "select * from user_products_rate where ebay_products_name = ?";
	
	ps = (PreparedStatement) conn.prepareStatement(COMPUTE_MEAN_RATING);
    ps.setString(1, prname);
    resultSet = ps.executeQuery();
	
    float total_mean = 0;
    int count = 0;
    boolean res = resultSet.next();
    if(!res){
    	ps = (PreparedStatement) conn.prepareStatement(UPDATE_MEAN_RATING);
        ps.setFloat(1, 0);
        ps.setString(2, prname);
        ps.executeUpdate();   	
    }
    do{
    	total_mean += resultSet.getInt("rating");
    	count++;
    }
    while(resultSet.next());
    
    total_mean = total_mean / count;
    
    ps = (PreparedStatement) conn.prepareStatement(UPDATE_MEAN_RATING);
    ps.setFloat(1, total_mean);
    ps.setString(2, prname);
    ps.executeUpdate();
	
}
catch(Exception e)
{
	System.out.print(e);
	e.printStackTrace();
}
//delete the review with the specific id that the user asked to delete
String referer = request.getHeader("Referer");
((HttpServletResponse) response).sendRedirect(referer);
%>