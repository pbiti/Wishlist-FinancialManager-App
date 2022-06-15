<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page import="util.Connector"%>
<% 
		
		 String username=(String)session.getAttribute("username");
		 String info_name = (String)session.getAttribute("prod_to_rate");
		 
		 String FIND_BY_NAME_SQL = "SELECT * FROM wishlist WHERE ebay_products_name = ? and username = ?";
		 String INSERT = "INSERT INTO wishlist (ebay_products_name, username) VALUES(?, ?)";
		 String DELETE = "DELETE FROM wishlist WHERE ebay_products_name = ? and username = ?";
		 String WISH_CHECK = "select * from wishlist where username = ? and ebay_products_name = ?";
		 
		 ResultSet resultSet = null;
		 ResultSet already_listed = null;
		 PreparedStatement ps = null;
		 
		 
		 try {
				//connection with the database
				Connector connectdb = new Connector();
				Connection myConn = connectdb.getConn();
				Statement myStmt = connectdb.getStmt();
				
				//search for the specific product in user's wishlist
				ps = myConn.prepareStatement(FIND_BY_NAME_SQL);
		        ps.setString(1, info_name);
		        ps.setString(2, username);
				
				resultSet = ps.executeQuery();				
				boolean check = resultSet.next();
				//if this product doesn't exist, then add it to the wishlist
				//if this product exist, then remove it from wishlist
				if(!check) {
					ps = myConn.prepareStatement(INSERT);
			        ps.setString(1, info_name);
			        ps.setString(2, username);
					ps.executeUpdate();
				}else {
					ps = myConn.prepareStatement(DELETE);
			        ps.setString(1, info_name);
			        ps.setString(2, username);
					ps.executeUpdate();
				}
											
				ps = myConn.prepareStatement(WISH_CHECK);
		        ps.setString(1, username);
		        ps.setString(2, info_name);
				
		        
		        already_listed = ps.executeQuery();
				check = already_listed.next();
				
				//if the product exists fill the heart symbol
				//if the product doesn't exist remove the color from the heart symbol
				out.print("<a onclick=\"wishlist_action()\">");
				     	if(check){
				     		out.print("<i class=\"fas fa-heart\" style=\"color:red; font-size: 2em;\"></i>");
				     	  }else{
				     		out.print("<i class=\"far fa-heart\" style=\"color:red; font-size: 2em;\"></i>");
				     	  }
				     	out.print("</a>");
				
				myConn.close();
		 }catch(Exception exc){
				exc.printStackTrace();
		 }
		 
		 
%>