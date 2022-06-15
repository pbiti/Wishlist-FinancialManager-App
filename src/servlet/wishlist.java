package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.EbayProducts;
import project_dao.products_dao;
import util.Connector;

public class wishlist extends HttpServlet{
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 HttpSession session=request.getSession();
		 String username=(String)session.getAttribute("username");
		 String info_name = request.getParameter("prod");
		 System.out.println("NAME: " + info_name);
		 
		 String DELETE = "DELETE FROM wishlist WHERE ebay_products_name = ? and username = ?";
		 String exists = "select * from wishlist where username = ?";
		 
		 
		 try {
				Connector connectdb = new Connector();
				Connection myConn = connectdb.getConn();
				Statement myStmt = connectdb.getStmt();
				ResultSet resultSet = null;
				PreparedStatement ps = null;
				
				
				ps = myConn.prepareStatement(exists);
			    ps.setString(1, username);
			    resultSet = ps.executeQuery();		
			    if(resultSet.next()) {System.out.println(resultSet.getString("ebay_products_name"));}
				
				//delete the product from user's wishlist based on its name
				ps = myConn.prepareStatement(DELETE);
			    ps.setString(1, info_name);
			    ps.setString(2, username);
			    ps.executeUpdate();		
				myConn.close();
		 }catch(Exception exc){
				exc.printStackTrace();
		 }	 
	        
	     RequestDispatcher dispatcher = request.getRequestDispatcher("/wishlist.jsp");
	     dispatcher.forward(request, response);	        
	 }

}
