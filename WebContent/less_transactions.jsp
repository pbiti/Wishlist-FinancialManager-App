<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page import="project_dao.UserDAO"%>
<%@page import="util.Connector"%>
<%		
		
		//get the username of the current session
		String username=(String)session.getAttribute("username");
		

		ResultSet all_trans = null;
		ResultSet total_budget = null;
		PreparedStatement ps = null;
		PreparedStatement ps_budget = null;
		
		String TOTAL_BUDGET = "select * from budget where username = ?";
		
		Connector connectdb = new Connector();
		Connection connection = connectdb.getConn();
		Statement statement = connectdb.getStmt();
		
		//the result set returned from this query includes just the 10 most recent transactions from the current user starting from most recent
		DatabaseMetaData databaseMetaData = connection.getMetaData();

		
		//check if a user_budget view already exists for a previous user and drop it 
		ResultSet get_tables = databaseMetaData.getTables(null, null, "user_budget", new String[] {"VIEW"});
		if (get_tables.next()){
			statement.executeUpdate("drop view user_budget");
		}
		
		//create a view that holds only the transactions of the current user
		String view_budget = "create view user_budget as select * from budget where username = '" + username + "' order by id_budget DESC limit 10";

		statement.executeUpdate(view_budget);
		
		all_trans = statement.executeQuery("select * from user_budget");
		
		//the result set returned from this query includes all the transactions from the user
		ps_budget = connection.prepareStatement(TOTAL_BUDGET);
		ps_budget.setString(1, username);
		total_budget = ps_budget.executeQuery();
		
		float total = 0;
		//calculate the budget by subtracting the total amount of expenses from the total amount of the incomes
		while(total_budget.next()){
			if(total_budget.getString("in_out").equals("Income")){
				total = total + total_budget.getFloat("amount");
			}else{
				total = total - total_budget.getFloat("amount");
			}
		}
		//display the user's budget
		out.print("<div class=\"total_budget\"><center><h3>Budget : " + total + "$" +"</h3><a href=\"afford.jsp?budget="+total+"\" >Show what I can buy!</a></center></div>");
		
		while(all_trans.next()){
			out.print("<div class=\"transactions\">");
			if(all_trans.getString("in_out").equals("Income")){  
				out.print("<span ><i class=\"fas fa-piggy-bank fa-3x\" style=\" color: green;\"></i></span>");
			}
			else {
				out.print("<span><i class=\"fas fa-hand-holding-usd fa-3x\" style=\" color: red;\"></i></span>");
			} 
			
			out.print("<span style=\"margin-left:50px;\"><strong>" + all_trans.getString("description")+"</strong></span>");
			out.print("<span style=\"margin-left:50px;\">"+all_trans.getFloat("amount") +"$"+"</span><br>");
			out.print("<span style=\"font-size:10px;\">"+all_trans.getString("date")+"</span><br>");
			out.print("</div>");
		}
		//show more button that executes the function showmore() as explained in pocket.jsp
		out.print("<button onclick=\"showmore()\" class=\"dropbtn\">Show More</button>");
%>

