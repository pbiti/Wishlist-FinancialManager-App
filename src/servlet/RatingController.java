package servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;

import entity.ProfileImage;
import util.Connector;

import javax.servlet.*;
import javax.servlet.http.*;

public class RatingController extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//get username attribute saved in the session to save the review under this username.
		/****Get username*****/
		HttpSession session=request.getSession();
	    String username=(String)session.getAttribute("username");
		/**************************/
	    
	    //get the parameters the user filled in the main.jsp page
	    String rating = request.getParameter("rating");
	    String review = request.getParameter("description");
	    
		
		
		//Prepared Statements to execute the queries and updates
		String USER_EXISTS = "select * from reviews where reviews.username = ?" ;
		String UPDATE_REVIEWS = "update reviews set rating = ?, review = ? where username = ?" ;
		String INSERT_REVIEWS = "insert into reviews (rating, username, review) values(?, ?, ?)";
		
		try {
			Connector connectdb = new Connector();
			Connection myConn = connectdb.getConn();
			Statement myStmt = connectdb.getStmt();
			ResultSet resultSet = null;
			PreparedStatement ps = null;
			
			//execute the first query to check if this user has already left a review
			ps = (PreparedStatement) myConn.prepareStatement(USER_EXISTS);
			ps.setString(1, username);
			
			resultSet = ps.executeQuery();
			
			if(resultSet.next()) {
				//if the user has already made a review update the old review with the new inserted parameters
				//so the user can only make one review and then update it if they want to
				//but they cannot make multiple reviews
				ps = (PreparedStatement) myConn.prepareStatement(UPDATE_REVIEWS);
				ps.setString(1, rating);
				ps.setString(2, review);
				ps.setString(3, username);
				ps.executeUpdate();
			}else {
				//if there is no review under this username insert a new one with the given parameters
				ps = (PreparedStatement) myConn.prepareStatement(INSERT_REVIEWS);
				ps.setString(1, rating);
				ps.setString(2, username);
				ps.setString(3, review);
				ps.executeUpdate();
			}
			//redirect to the main.jsp page where the reviews, including the new(or updated one) will be displayed	
			/*RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/main.jsp");
			dispatcher.forward(request, response);*/
			String referer = request.getHeader("Referer");
			((HttpServletResponse) response).sendRedirect(referer);
			
			myConn.close();
				
		}catch(Exception exc){
			exc.printStackTrace();
		}
	}

}
