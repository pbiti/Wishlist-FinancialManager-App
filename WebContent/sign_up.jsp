<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>I Need A Dollar | Register</title>
        <meta charset ="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <LINK rel="stylesheet" href="style.css">
        <LINK rel="stylesheet" href="signup.css">
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <meta name="theme-color" content="#ffffff">
    </head>
    <body style="background-image: url(shopapp-blur.jpg);background-size: cover; font-family: Raleway;">
		<!-- 
			Form the user has to fill in order to sign up
		 -->
        <form method="GET" id="regForm" action="user_signup"> 
            <center><img src="logo.png" alt="logo" style="width:100px"></center>
            <h1>Become a part of us!</h1>
            <%
          		//if an error occured while checking the signup information, the servlet sets an error and it is displayed at the top of the form
                String error = request.getParameter("error");
                if(error!=null){
                    out.print("<b><center style=\"color:red;\">"+request.getParameter("error")+"</center></b>");
                }
            %>
            Personal Information:
                <p><input type="text" id="first_name" name="first_name" placeholder="First name"></p>
              <p><input type="text" id="last_name" name="last_name" placeholder="Last name"></p>
            
            Username:
                <p><input type="text" id="username" name="username" placeholder="Username"></p>
          
            Password:
              <p><input type="password" id="password" name="password" placeholder="Password"></p>
              <p><input type="password" id="repeat_pass" name="repeat_pass" placeholder="Repeat Password"></p>
            <center>
            <button>Sign Up</button>
            <p style="text-align: center">Already have an account? <a href="login.jsp" style="color: black">Log in</a></p>
          </form>
          
    </body>
</html>
