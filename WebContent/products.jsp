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
<title>I Need A Dollar | Products </title>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
<link href="login1.css" rel="stylesheet" type="text/css"/>
<link href="rateus.css" rel="stylesheet" type="text/css"/>
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link rel="stylesheet" href="new_image.css">
<link rel="stylesheet" href="ViewProduct.css">
</head>
<body style="background-color:#5BA3CB;">
<% 
	//Gather information about the product from parameteres
	String[] array = (String[])request.getAttribute("prod_information"); 
	//name of product - save in session
	session.setAttribute("prod_to_rate", array[1]);
	//total information about the product - save in session
	session.setAttribute("prod_information", array);
	
	String uname = session.getAttribute("username").toString();
	
	//search if the program belongs to user's wishlist
	String ALREADY_LISTED = "select * from wishlist where username =? and ebay_products_name = ?";
	//search product's comments
	String SELECT_ITEM_RATINGS = "select * from item_ratings where user_has_ebay_products_ebay_products_name = ? ORDER BY id DESC";
	//search the user rating for the product
	String SELECT_USER_PRODUCTS_RATE = "select * from user_products_rate where username = ? and ebay_products_name = ?";
	//get the mean rating of the product
	String MEAN_RATING = "select * from ebay_products where name = ?";
	
	
	ResultSet already_listed = null;
	ResultSet mean_rating = null;
	PreparedStatement ps = null;
	
	
	
	boolean check = false;
	
	try{
		Connector connectdb = new Connector();
		Connection connection = connectdb.getConn();
		Statement statement = connectdb.getStmt();
		
		//search if the program belongs to user's wishlist
		ps = connection.prepareStatement(ALREADY_LISTED);
        ps.setString(1, uname);
        ps.setString(2, array[1]);
				
		already_listed = ps.executeQuery();
		check = already_listed.next();
		
		ps = connection.prepareStatement(MEAN_RATING);
        ps.setString(1, array[1]);
		mean_rating = ps.executeQuery();
		
		
	} catch (Exception e) {
	e.printStackTrace();
	}
	
%>

        <div class="navbar">
            <a href="edit_profile.jsp" class="dropbtn"><img src="
     		<%
	          if(session.getAttribute("username")!=null){
	               UserDAO userdao = new UserDAO();
	               byte[] imageData = userdao.getUserImage(uname);
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
        		<a href="wishlist.jsp">WISHLIST</a>
                <a href="user_logout" class="dropbtn">LOG OUT</a>
            </div>
        </div>
        
     <div class="product_info">
     	<div class="left-info">
     		<!-- Image of the product-->
	     	<img src=<%out.print(array[0]); %> style="width: 250px; height: 250px">
     	</div>
     	
     	<div class="right-info" style="float:left; padding-left:10px;">
     		<!-- name-->
	     	<h3><%out.print(array[1]); %></h3>
	     	<!-- price -->
	     	<h3><%out.print(array[2]); %></h3>
	     	<!-- link of the product in ebay-->
	     	<a href= <%out.print(array[3]);%> target="_blank"><i class="fab fa-ebay" style="font-size: 2.5em; padding-top:5px; color: white;"></i></a>
	     	<br><br>
	     	<%
	     	if(mean_rating.next()){
	     		if(mean_rating.getFloat("rating") == 0){%>
	     			<span style= "color:white;"><i>This product has no reviews</i></span>
	     		<%}else{ %>
	     			<span class="date-right" style="color: white;"><%out.print(mean_rating.getFloat("rating")+"/5");%><i class="fa fa-star rate"></i></span>
	     		<%} 
	     	}%>
	     	<br><br><br>
	     	<div id="action">
	     		<!-- add or remove the product from wishlist-->
		     	<a onclick="wishlist_action()">
		     	<%if(check){
		     		out.print("<i class=\"fas fa-heart\" style=\"color:red; font-size: 2em;\"></i>");
		     	  }else{
		     		out.print("<i class=\"far fa-heart\" style=\"color:red; font-size: 2em;\"></i>");
		     	  } %>
		     	</a>
	     	</div>
     	</div>
     	
     </div>


	 <div class="main">
	 	<!-- evaluate the product with a rating from 1 to 5-->
	    <form id="rating-form" action="rate_product" method="post">
			<span class="rating-star">
				<input type="radio" name="rating" value="5" required><span class="star"></span>
			 
			    <input type="radio" name="rating" value="4"><span class="star"></span>
			 
			    <input type="radio" name="rating" value="3"><span class="star"></span>
			 
			    <input type="radio" name="rating" value="2"><span class="star"></span>
			 
			    <input type="radio" name="rating" value="1"><span class="star"></span>
	    
	     	</span>
	     	<br><br>
	     	<!-- evaluate the product with a comment-->
	    	<div class="textarea" >  
	    		<textarea cols="30" placeholder="Describe your experience..." name = "description"></textarea>     
	    	</div>
		    <br><br>
		    <input class="sub_btn" type="submit" value="Rate Product" style="font-family: Raleway;">
		    
		    <br><br><br>
		</form>
	 </div>
	 
	 <%      
	 	Connector connectdb = new Connector();
		Connection connection = connectdb.getConn();
		Statement statement = connectdb.getStmt();
		ResultSet resultSet = null;
		ResultSet resultSet2 = null;
		ResultSet resultSet3 = null;
		
%>
<%
try{
//search product's comments
ps = connection.prepareStatement(SELECT_ITEM_RATINGS);
ps.setString(1, array[1]);
resultSet = ps.executeQuery();

%>
<center>
<% 
while(resultSet.next()){
	%>
		<div class="reviews">
		<%
			//print reviews for the product
			String username=resultSet.getString("user_has_ebay_products_user_username");
			
			
			String sql2 ="select * from user where username = '" + username + "'";
			resultSet2 = statement.executeQuery(sql2);				
		
			if (resultSet2.next()) {
				//profile image of the user taht wrote the comment
	            UserDAO userdao = new UserDAO();
	            byte[] imageData = userdao.getUserImage(username);
	            String base64Image = Base64.getEncoder().encodeToString(imageData);
	            
	            request.setAttribute("profileimage", base64Image);
	        }
			
			//search the user rating for the product
			ps = connection.prepareStatement(SELECT_USER_PRODUCTS_RATE);
			ps.setString(1, username);
			ps.setString(2, array[1]);

			resultSet3 = ps.executeQuery();
			resultSet3.next();
		%>
		<img src="data:image/jpg;base64,${profileimage}" id="photo" style="border-radius: 50%; width: 50px; height: 50px;"/>
		<span style="color: LightYellow;"><strong><%out.print(username);%></strong></span>
		<span class="date-right" style="color: white; float: right;"><%int rating=resultSet3.getInt("rating"); out.print(rating);%><i class="fa fa-star rate"></i></span>
		<br><br>
		<p style="color: LightYellow; margin-left:10px"><% String reviews = resultSet.getString("comments"); out.print(reviews);%></p>
		<%if(resultSet.getString("user_has_ebay_products_user_username").equals(uname)){ %>
			<a href="delete.jsp?id=<%=resultSet.getString("id") %>&uname=<%=uname %>&prname=<%=resultSet.getString("user_has_ebay_products_ebay_products_name") %>" style="float:right; color:white;">Delete</a>
		<%} %> 
		</div>
		<%
}
 
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</center>

<script>
	//add and remove the product from wishlist
	function wishlist_action(){
		var prod_name = "<%= array[1]%>";
		document.cookie = 'new_name = /${prod_name}';
		$('#action').load('wishlist_new.jsp');
	}

</script>

</body>
</html>