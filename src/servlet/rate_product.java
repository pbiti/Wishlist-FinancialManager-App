package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;

import entity.ProfileImage;
import util.Connector;

public class rate_product extends HttpServlet{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		/********Get attributes saved in the current session*************/
		HttpSession session=request.getSession(); //session
	    String username=(String)session.getAttribute("username"); //username
	    String prod_name = (String)session.getAttribute("prod_to_rate"); //the product for which the user made a review
	    String[] array = (String[])session.getAttribute("prod_information"); //array that contains all the information for the product(name, link, price, image)
		/**************************/
	        
	    String rating = request.getParameter("rating"); //rating the user gave to the product
	    String review = request.getParameter("description"); //the comment the user left for the product
	
		//all the queries we are going to use as prepared statements to search and update the database
		String USER_EXISTS = "select * from item_ratings where user_has_ebay_products_user_username = ? and user_has_ebay_products_ebay_products_name = ?";
		String UPDATE_ITEM_RATINGS = "update item_ratings set comments = ? where user_has_ebay_products_user_username = ? and user_has_ebay_products_ebay_products_name = ?";
		String UPDATE_USER_PRODUCTS_RATE = "update user_products_rate set rating = ? where username = ? and ebay_products_name = ?";
		String INSERT_ITEM_RATINGS = "insert into item_ratings (user_has_ebay_products_user_username, comments, user_has_ebay_products_ebay_products_name) values(?, ?, ?)";
		String INSERT_USER_PRODUCTS_RATE = "insert into user_products_rate (username, ebay_products_name, rating) values(?, ?, ?)";		
		String UPDATE_MEAN_RATING = "update ebay_products set rating = ? where name = ?";
		String COMPUTE_MEAN_RATING = "select * from user_products_rate where ebay_products_name = ?";
		
		
		
		try {
			Connector connectdb = new Connector();
			Connection myConn = connectdb.getConn();
			Statement myStmt = connectdb.getStmt();
			ResultSet resultSet = null;
			
			PreparedStatement ps = null;
			
			//first search the database to check if the user has already made a review for this product
			ps = (PreparedStatement) myConn.prepareStatement(USER_EXISTS);
	        ps.setString(1, username);
	        ps.setString(2, prod_name);
	        
	        resultSet = ps.executeQuery();
			if(resultSet.next()) {
				//if a review for this product from the same user already exists we update this review and the rating. So the user,
				//can only make one comment for each product and can later update it if the want to.
				ps = (PreparedStatement) myConn.prepareStatement(UPDATE_USER_PRODUCTS_RATE);
		        ps.setString(1, rating);
		        ps.setString(2, username);
		        ps.setString(3, prod_name);
		        ps.executeUpdate();
		        
		        ps = (PreparedStatement) myConn.prepareStatement(UPDATE_ITEM_RATINGS);
		        ps.setString(1, review);
		        ps.setString(2, username);
		        ps.setString(3, prod_name);
		        ps.executeUpdate();
			}else {
				//if there's not a review for this product from the user we insert this review and the rating.
				ps = (PreparedStatement) myConn.prepareStatement(INSERT_USER_PRODUCTS_RATE);
		        ps.setString(1, username);
		        ps.setString(2, prod_name);
		        ps.setString(3, rating);
		        ps.executeUpdate();
		        
		        ps = (PreparedStatement) myConn.prepareStatement(INSERT_ITEM_RATINGS);
		        ps.setString(1, username);
		        ps.setString(2, review);
		        ps.setString(3, prod_name);
		        ps.executeUpdate();
			}
			//compute new mean rating after inserting new review
			ps = (PreparedStatement) myConn.prepareStatement(COMPUTE_MEAN_RATING);
	        ps.setString(1, prod_name);
	        resultSet = ps.executeQuery();
			
	        float total_mean = 0;
	        int count = 0;
	        while(resultSet.next()) {
	        	total_mean += resultSet.getInt("rating");
	        	count++;
	        }
	        total_mean = total_mean / count;
	        
	        ps = (PreparedStatement) myConn.prepareStatement(UPDATE_MEAN_RATING);
	        ps.setFloat(1, total_mean);
	        ps.setString(2, prod_name);
	        ps.executeUpdate();
	            
	        request.setAttribute("prod_information", array);
				
	        //return to the page that made the request
	        String referer = request.getHeader("Referer");
	        ((HttpServletResponse) response).sendRedirect(referer);
			//close the connection to the database
			myConn.close();
		}catch(Exception exc){
			exc.printStackTrace();
		}
	}

}
