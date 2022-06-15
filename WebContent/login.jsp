<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>I Need A Dollar | Login</title>
        <meta charset ="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
        <LINK rel="stylesheet" href="signup.css">
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <meta name="theme-color" content="#ffffff">   
    </head>
    <body style="background-image: url(shopapp-blur.jpg);background-size: cover; font-family: Raleway;">
		<!-- 
			Form the user has to fill in order to log in to their account
		 -->
        <div class="box" ">
            <div class="">
              <center><img src="logo.png" alt="logo" style="width:100px"></center>
            </div>
            <h1 align="center" style="font-family: Raleway"><b>Log in</b></h1>

            <form method="GET" action="user_login">
                <input type="text" id="username" name="username" placeholder="Enter your username" style="font-family: Raleway"  required>
                <input type="password" id="password" name="password" placeholder="Enter your password" style="font-family: Raleway" required>
                <button>Login</button>
                <p>Want to become a member? <a href="sign_up.jsp" style="color: black">Sign up</a></p>
            </form>
            <%
            	//if an error occured while checking the login information, the servlet sets an error and it is displayed at the bottom of the form
                String error = request.getParameter("error");
                if(error!=null){
                    out.print("<b><center style=\"color:red;\">"+request.getParameter("error")+"</center></b>");
                }
            %>
        </div>
    </body>
</html>