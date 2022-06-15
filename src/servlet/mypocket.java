package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;

import util.Connector;

public class mypocket extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		//get the username saved in the current session
		HttpSession session=request.getSession();
	    String username=(String)session.getAttribute("username");
		
	    //get the parameters the user inserted for the new transaction to be saved in the database
		String amount = request.getParameter("amount");
		String in_out = request.getParameter("in_out");
		String description = request.getParameter("description");
		String date = request.getParameter("date");
			
		//Prepared statement to execute the query
		String UPDATE_BUDGET = "insert into budget (amount, in_out, description, date, username) values(?, ?, ?, ?, ?)";
		
		try {
			Connector connectdb = new Connector();
			Connection myConn = connectdb.getConn();
			Statement myStmt = connectdb.getStmt();
			ResultSet resultSet = null;
			PreparedStatement ps = null;
			
			//execute query to insert the new transaction, under the username we got from the session, to the "budget" table of the database
			ps = (PreparedStatement) myConn.prepareStatement(UPDATE_BUDGET);
			ps.setString(1, amount);
			ps.setString(2, in_out);
			ps.setString(3, description);
			ps.setString(4, date);
			ps.setString(5, username);
			ps.executeUpdate();
		
			myConn.close();
		}catch(Exception exc){
			exc.printStackTrace();
		}
		//redirect to the pocket.jsp page 
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pocket.jsp");
		dispatcher.forward(request, response);
		
	}

}
