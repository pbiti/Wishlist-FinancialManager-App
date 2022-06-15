<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project_dao.UserDAO"%>
<!DOCTYPE html>
<html lang="en-US">
    <head>
     <title>Profile</title>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
     <link href="https://fonts.googleapis.com/css2?family=Nothing+You+Could+Do&display=swap" rel="stylesheet">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	 <link href="login1.css" rel="stylesheet" type="text/css"/>
	 <link href="rateus.css" rel="stylesheet" type="text/css"/>
	 <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
     <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
     <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//http 1.1
            response.setHeader("Pragma", "no-cache");//http 1.0
            response.setHeader("Expires", "0");//proxies

            if(session.getAttribute("username")==null){
                response.sendRedirect("login.jsp");
            }
        %>
        <body style="background-color:#516B6C;">

<% String uname = request.getParameter("username");%>
      

<div class="navbar">
	  	<a href="edit_profile.jsp" class="active"><img src="
	     <%
                  String profimage = "";
	          if(session.getAttribute("username")!=null){
	               String username = session.getAttribute("username").toString();
	               UserDAO userdao = new UserDAO();
	               byte[] imageData = userdao.getUserImage(username);
	               profimage = Base64.getEncoder().encodeToString(imageData);               
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
		<center>
		<br><h3>Change your profile image</h3><br>
		
        <div class="page_body">
        		 <!-- User can upload a new profile image from his filesystem-->
                <form method="post" action="upload_image" enctype="multipart/form-data">
                    <img src=<%out.print("data:image/jpg;base64,"+profimage);%> alt="Profile_picture" style="height: 200px" class="prof_pic">
                    <input type="file" name="change_image" id="change_image" size="50">
                    <input type="submit" name="upload" id="upload">
                </form>
        </div>
        </center>
    </body>
</html>
