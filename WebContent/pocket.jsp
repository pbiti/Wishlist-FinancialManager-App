<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page import="project_dao.UserDAO"%>
<%@page import="util.Connector"%>
<!DOCTYPE html>
<html>
    <head>
        <title>I Need A Dollar | My Pocket</title>
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <meta charset ="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Pocket.css">
        <LINK rel="stylesheet" href="signup.css">
        <LINK rel="stylesheet" href="login1.css">
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    </head>
	<body style = "background-color: #5BA3CB;">	
	
<!-- Displaying the navigation bar:
On the left side the profile picture and the username of the user are displayed
On the right side the options the user has are displayed (Main Page, My Pocket, Wishlist and Log Out)-->
	
	<div class="navbar">
	  	<a href="edit_profile.jsp" class="dropbtn"><img src="
	     <%
	     	  String username = null;
	          if(session.getAttribute("username")!=null){
	               username = session.getAttribute("username").toString();
	               UserDAO userdao = new UserDAO();
	               byte[] imageData = userdao.getUserImage(username);
	               String profimage = Base64.getEncoder().encodeToString(imageData);               
	               out.print("data:image/jpg;base64,"+profimage);
	               
	           }%>"id="profilepic" > ${username}</a>
	                             
	       <!--Search bar to search products on ebay redirecting to servlet-->                       
	       <form method="post" action="search_products">
	              <input id="search-text" type="text" placeholder="Search.." name="search"  style="height:30px; width:200px; margin-top:10px; margin-left:20px;" required>
	              <button id="search" type="submit" onclick=""><i class="fa fa-search"></i></button>
	       </form>
      
	  <div class="header-right">
	  	<a href="main.jsp">HOME</a>
	  	<a class="active" href="pocket.jsp">MY POCKET</a>
	  	<a href="wishlist.jsp"> WISHLIST</a>
		<a href="user_logout" class="dropbtn">LOG OUT</a>
	  </div>
	</div>
	
	
	<!-- 
	Form the user has to fill in order to update his transactions and budget.
	For each entry the users have two options for the type of the transaction,
	either an expense or income.
	Then they have to enter the amount exchanged for the transaction, a small description and the date of the transaction.
	 -->
	<div class="pocket_main">
		<div class="box">
			<form method="GET" action="my_pocket">
				 <select class="in_out" name="in_out"  style="width:300px;" required>
				 <option value="Income">Income</option>
				 <option value="Expense">Expense</option>
				 </select>
			     <input type="text" id="amount" name="amount" placeholder="Enter the amount" style="font-family: Raleway"  required>
			     <input type="text" id="description" name="description" placeholder="Enter a description" style="font-family: Raleway" required>
			     <input type="date" id="date" name="date" style="font-family: Raleway" required>
			     <button>Update Pocket</button>
			</form>
		</div>
		<!-- connect to the database to display the user's most recent transactions -->
		<div class="pocket_right" id="action">
			<%     
		      
			  ResultSet latest_trans = null;
			  ResultSet total_budget = null;
			  int count = 0;

			  try{
				//at first we display the 10 most recent transactions for each user
				Connector connectdb = new Connector();
				Connection connection = connectdb.getConn();
				Statement statement = connectdb.getStmt();	
				DatabaseMetaData databaseMetaData = connection.getMetaData();
				
				
				//check if a user_budget view already exists for a previous user and drop it 
				ResultSet get_tables = databaseMetaData.getTables(null, null, "user_budget", new String[] {"VIEW"});
				if (get_tables.next()){
					statement.executeUpdate("drop view user_budget");
				}
				
				//create a view that holds only the transactions of the current user
				String view_budget = "create view user_budget as select * from budget where username = '" + username + "' order by id_budget DESC limit 10 ";
				//String sql ="select * from budget where username = '" + username + "' order by id_budget DESC limit 10 ";
				//latest_trans = statement.executeQuery(sql); 
				statement.executeUpdate(view_budget);
				
				latest_trans = statement.executeQuery("select * from user_budget");
				
				
				
				Connector connectdb2 = new Connector();
				connection = connectdb2.getConn();
				statement = connectdb2.getStmt();
				String sql_budget ="select * from budget where username = '" + username + "'";
				total_budget = statement.executeQuery(sql_budget);
				
				float total = 0;
				//we calculate their total budget by subtracting the total amount of expenses from the total amount of the incomes
				//we do this by looping through all the transactions returned from the query right above for the current user
				//we also keep a counter variable (count) to count the total number of transactions a user has saved.
				while(total_budget.next()){
					if(total_budget.getString("in_out").equals("Income")){
						total = total + total_budget.getFloat("amount");
					}else{
						total = total - total_budget.getFloat("amount");
					}
					count++;
				}
				
				//we display the total budget the user has
				out.print("<div class=\"total_budget\"><center><h3>Budget : " + total + "$" +"</h3><a href=\"afford.jsp?budget="+total+"\" >Show what I can buy!</a></center></div>");
				//display the 10 most recent transactions the user has saved
				while(latest_trans.next()){ 			
				%>
					<div class="transactions">
					
						<%if(latest_trans.getString("in_out").equals("Income")){  
							out.print("<span ><i class=\"fas fa-piggy-bank fa-3x\" style=\" color: green;\"></i></span>");
						}
						else {
							out.print("<span><i class=\"fas fa-hand-holding-usd fa-3x\" style=\" color: red;\"></i></span>");
						} 
						
						out.print("<span style=\"margin-left:50px;\"><strong>" + latest_trans.getString("description")+"</strong></span>");
						out.print("<span style=\"margin-left:50px;\">"+latest_trans.getFloat("amount") +"$"+"</span><br>");
						out.print("<span style=\"font-size:10px;\">"+latest_trans.getString("date")+"</span><br>");
						
						%>
						
					</div>
			    <%
				}
				
		
				connection.close();

			   } catch (Exception e) {
					e.printStackTrace();
			   }
			 //if the user has more than 10 transactions saved in the database then a button appears and if the user presses it 
			 //the function showmore() below is executed.
			 if(count>10){
			 %>
			 <button onclick="showmore()" class="dropbtn">Show More</button><% } %>
		</div>
	</div>
	
<script>
	//this function replaces the content in the div element with id="action" with all the transactions the user has saved.
	function showmore(){		
		$('#action').load('show_transactions.jsp');
	}
	//this function replaces the content in the div element with id="action" with only the 10 most recent transactions.
	function show_less(){		
		$('#action').load('less_transactions.jsp');
	}
</script>
</body>
</html>