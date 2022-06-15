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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>I Need A Dollar | Wishlist</title>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="//use.fontawesome.com/releases/v5.7.2/css/all.css">
        <link href="login1.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    </head>
    
    <% String uname = (String)session.getAttribute("username");%>

    <body style="background-color: #5BA3CB;">
        <div class="navbar">
            <a href="edit_profile.jsp" class="dropbtn"><img src="
     		<%
	          if(session.getAttribute("username")!=null){
	               String username = session.getAttribute("username").toString();
	               UserDAO userdao = new UserDAO();
	               byte[] imageData = userdao.getUserImage(username);
	               String profimage = Base64.getEncoder().encodeToString(imageData);               
	               out.print("data:image/jpg;base64,"+profimage);
	               
               
           }%>"id="profilepic" > ${username}</a>

	       <form method="post" action="search_products">
	              <input id="search-text" type="text" placeholder="Search.." name="search"  style="height:30px; width:200px; margin-top:10px; margin-left:20px;" required>
	              <button id="search" type="submit" onclick=""><i class="fa fa-search"></i></button>
	       </form>

            <div class="header-right">
                <a href="main.jsp">HOME</a>
                <a href="pocket.jsp">MY POCKET</a>
        		<a class="active" href="wishlist.jsp">WISHLIST</a>
                <a href="user_logout" class="dropbtn">LOG OUT</a>
            </div>
        </div>               
		<%
		//parameters for the connection with the database
		 
		  
			ResultSet resultSet = null;
			ResultSet resultSet2 = null;
		
		
		
		try{
			Connector connectdb = new Connector();
			Connection connection = connectdb.getConn();
			Statement statement = connectdb.getStmt();
			//String sql ="select * from wishlist where username = '" + uname + "';";
			//resultSet = statement.executeQuery(sql);
			
			////////////////
			
			DatabaseMetaData databaseMetaData = connection.getMetaData();
			
			//check if a user_budget view already exists for a previous user and drop it 
			ResultSet get_tables = databaseMetaData.getTables(null, null, "user_list", new String[] {"VIEW"});
			if (get_tables.next()){
				statement.executeUpdate("drop view user_list");
			}
			
			//create a view that holds only the transactions of the current user
			String view_list = "create view user_list as select * from wishlist where username = '" + uname + "';";

			statement.executeUpdate(view_list);
			
			resultSet = statement.executeQuery("select * from user_list");
			
			
			///////////////
			
			//search the ebay_products relationship table to find the products that user want to buy
			String FIND_LIST = "SELECT * FROM ebay_products WHERE name = ?";
			PreparedStatement ps = null;
			//establish the connection with the database
			
			%>
			<center>
			<% 
			//print the observations one by one from the returned result 
			while(resultSet.next()){
										
					ps = connection.prepareStatement(FIND_LIST);
			        ps.setString(1, resultSet.getString("ebay_products_name"));
					resultSet2 = ps.executeQuery();
					resultSet2.next();
				%>
				
				<span><div class="product_info" style="padding-top: 50px;">
			     	<div class="left-info">
				     	<img src=<%=resultSet2.getString("image") %> style="width: 180px; height: 180px">
			     	</div>
			     	
			     	<div class="right-info">
				     	<h3><%out.print(resultSet.getString("ebay_products_name")); %></h3>
				     	<h3><%out.print(resultSet2.getString("price")); %></h3>
				     	<a href= <%out.print(resultSet2.getString("link"));%> target="_blank"><i class="fab fa-ebay" style="font-size: 2.5em; color:white;"></i></a><br>
				     	<!-- Click to remove the product from wishlist-->
				     	<a href="wishlist?prod=<%out.print(resultSet.getString("ebay_products_name"));%>"><i class="fas fa-heart" style="color:red; font-size: 2em;"></i></a>
				     	<hr>
			     	</div>
			   </div></span>
					<%
			}
		  connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		
    </body>
</html>
