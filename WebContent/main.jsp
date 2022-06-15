<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page import="project_dao.UserDAO"%>
<%@page import="util.Connector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>I Need A Dollar | Main Page</title>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
<link href="login1.css" rel="stylesheet" type="text/css"/>
<link href="rateus.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
</head>
<body style="background-color:#5BA3CB;">

<!-- Get the username that was used when logging in or signing up -->
<% String uname = session.getAttribute("username").toString(); %>

<!-- Connecting to the database and counting how many reviews each rating has to display it on screen -->

<!-- Displaying the navigation bar:
On the left side the profile picture and the username of the user are displayed
On the right side the options the user has are displayed (Main Page, My Pocket, Wishlist and Log Out)-->
<div class="navbar">
	  	<a href="edit_profile.jsp" class="dropbtn"><img src="
	     <%	
	     //We search the User table from the database to find which profile picture the current username has saved and then we display it on screen
	          if(session.getAttribute("username")!=null){
	               String username = session.getAttribute("username").toString();
	               UserDAO userdao = new UserDAO();
	               byte[] imageData = userdao.getUserImage(username);
	               String profimage = Base64.getEncoder().encodeToString(imageData);               
	               out.print("data:image/jpg;base64,"+profimage);
	               
	           }%>"id="profilepic" > ${username}</a>
	       <!--Search bar to search products on ebay redirecting to servlet-->                      
	       <form method="post" action="search_products">
	              <input id="search-text" type="text" placeholder="Search..." name="search"  style="height:30px; width:200px; margin-top:10px; margin-left:20px;" required>
	              <button id="search" type="submit" onclick=""><i class="fa fa-search"></i></button>
	       </form>
      
	  <div class="header-right">
	  	<a class="active">HOME</a>
	  	<a href="pocket.jsp">MY POCKET</a>
	  	<a href="wishlist.jsp"> WISHLIST</a>
		<a href="user_logout" class="dropbtn">LOG OUT</a>
	  </div>
</div>


<!--
Rating form the user has to fill in order to rate the app, redirecting to servlet to save the rating to the database
The user can rate the app with 1-5 stars and can also write a review that is displayed below along with the rating they gave.
-->
<div class="main">
    <form id="rating-form" action="rate" method="post">
		<span class="rating-star">
			<input type="radio" name="rating" value="5" required><span class="star"></span>
		 
		    <input type="radio" name="rating" value="4"><span class="star"></span>
		 
		    <input type="radio" name="rating" value="3"><span class="star"></span>
		 
		    <input type="radio" name="rating" value="2"><span class="star"></span>
		 
		    <input type="radio" name="rating" value="1"><span class="star"></span>
    
     	</span>
     	<br><br>
    	<div class="textarea">  
    		<textarea cols="30" placeholder="Describe your experience..." name = "description"></textarea>     
    	</div>
	    <br><br>
	    <input class="sub_btn" type="submit" value="Rate Us" style="font-family: Raleway;">
	    
	    <br><br><br>
	</form>
	
</div>

<br><br>
<%
Connector connectdb = new Connector();
Connection connection = connectdb.getConn();
Statement statement = connectdb.getStmt();

String rating1 = "SELECT COUNT(id) FROM reviews WHERE rating=1;";
String rating2 = "SELECT COUNT(id) FROM reviews WHERE rating=2;";
String rating3 = "SELECT COUNT(id) FROM reviews WHERE rating=3;";
String rating4 = "SELECT COUNT(id) FROM reviews WHERE rating=4;";
String rating5 = "SELECT COUNT(id) FROM reviews WHERE rating=5;";

%>
<center>
<div class="ratings" style="font-family:Raleway">
	<%
	ResultSet rate1 = statement.executeQuery(rating1);
	if(rate1.next()){
		out.print(rate1.getInt("COUNT(id)"));
	  }else{
		  out.print("0");
	  }%>
	<i class="fa fa-star checked"></i><i class="fa fa-star-o unchecked"></i><i class="fa fa-star-o unchecked"></i><i class="fa fa-star-o unchecked"></i><i class="fa fa-star-o unchecked"></i>
</div>
<br>
<div class="ratings" style="font-family:Raleway">
	<%
	ResultSet rate2 = statement.executeQuery(rating2);
	if(rate2.next()){
		out.print(rate2.getInt("COUNT(id)"));
	  }else{
		  out.print("0");
	  }%>
	<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star-o unchecked"></i><i class="fa fa-star-o unchecked"></i><i class="fa fa-star-o unchecked"></i>
</div>
<br>
<div class="ratings" style="font-family:Raleway">
	<%
	ResultSet rate3 = statement.executeQuery(rating3);
	if(rate3.next()){
		out.print(rate3.getInt("COUNT(id)"));
	  }else{
		  out.print("0");
	  }%>
	<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star-o unchecked"></i><i class="fa fa-star-o unchecked"></i>
</div>
<br>
<div class="ratings" style="font-family:Raleway">
	<%
	ResultSet rate4 = statement.executeQuery(rating4);
	if(rate4.next()){
		out.print(rate4.getInt("COUNT(id)"));
	  }else{
		  out.print("0");
	  }%>
	<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star-o unchecked"></i>
</div>
<br>
<div class="ratings" style="font-family:Raleway">
	<%
	ResultSet rate5 = statement.executeQuery(rating5);
	if(rate5.next()){
		out.print(rate5.getInt("COUNT(id)"));
	  }else{
		  out.print("0");
	  }%>
	<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i>
</div>
<br><br>
</center>
<hr class="new1">
<!-- 
Connecting to the database to display all the reviews from the users
 -->
<%
try{
ResultSet resultSet = null;
ResultSet resultSet2 = null;
connectdb = new Connector();
connection = connectdb.getConn();
statement = connectdb.getStmt();
//Display the reviews starting from the most recent
String sql ="select * from reviews ORDER BY id DESC";
resultSet = statement.executeQuery(sql);
%>
<center>
<% 
while(resultSet.next()){
	%>
		<div class="reviews">
		<%
		String username=resultSet.getString("username");
		
		//For each review found, get the username that submitted the review and search the "User" table from the database
		//to get the user's profile picture and display it next to their review
		Connector connectdb2 = new Connector();
		connection = connectdb2.getConn();
		Statement st = connectdb2.getStmt();
		String sql2 ="select * from user where username= " + "'" + username + "'";
		resultSet2 = st.executeQuery(sql2);
		
		if (resultSet2.next()) {
            
            UserDAO userdao = new UserDAO();
            byte[] imageData = userdao.getUserImage(username);
            String base64Image = Base64.getEncoder().encodeToString(imageData);
            
            request.setAttribute("profileimage", base64Image);
        }		
		%>
		<!-- 
		Display the review using the result sets from the above queries
		 -->
		<img src="data:image/jpg;base64,${profileimage}" id="photo" style="border-radius: 50%; width: 50px; height: 50px;"/>
		<span style="color: LightYellow;"><strong><%String namef = resultSet2.getString("username"); int rating=resultSet.getInt("rating"); out.print(namef);%></strong></span>
		<span class="date-right" style="color:white; float:right;"><%out.print(rating);%><i class="fa fa-star rate"></i></span>
		<br>
		<p style="color: LightYellow; margin-left:80px"><% String reviews =resultSet.getString("review"); out.print(reviews);%></p>
		<%if(resultSet.getString("username").equals(uname)){ %>
			<a href="delete_review.jsp?id=<%=resultSet.getString("id") %>" style="float:right; color:white;">Delete</a>
		<%} %> </div>
		<%
}
 
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</center>
  
</body>
</html>