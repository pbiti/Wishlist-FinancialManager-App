<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page import="project_dao.UserDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>I Need A Dollar | Search Results</title>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="//use.fontawesome.com/releases/v5.0.7/css/all.css">
        <link rel="stylesheet" href="//use.fontawesome.com/releases/v5.7.2/css/all.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <link href="login1.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    </head>
    
    <% String uname = request.getParameter("username");%>
    
    <body onload="searchFunction()" style="background-color: #5BA3CB;">
 
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
                <a href="wishlist.jsp">WISHLIST</a>
                <a href="user_logout" class="dropbtn">LOG OUT</a>
            </div>
        </div>
        <div class="page_body">
        <!-- Products were found after the search-->
          <div id="list-output" class="body_left">
              
          </div>
        </div>
        <center><div id="loader" style="display: block;"><img src="load.gif"/></div></center>         
                        
        <script>
      //Called at the page loading to find products
            function searchFunction(){
                var item, Img, title, link, price, rating, ratings_count, counter = 0;
                var table = [];
                var placeHldr = "http://inf-server.inf.uth.gr/~ikarampinis/bookNotFound.png";
                var outputList = document.getElementById("list-output");
                outputList.innerHTML="";
                var searchData= '<%= request.getParameter("searchFor")%>';
                searchData = searchData.replace(/\s/g, "");
                //preparation of the question for the ebay api
                //we set the api key and the word for search
                const settings = {
                        "async": true,
                        "crossDomain": true,
                        "url": "https://ebay-product-search-scraper.p.rapidapi.com/index.php?query="+searchData,
                        "method": "GET",
                        "headers": {
                                "x-rapidapi-host": "ebay-product-search-scraper.p.rapidapi.com",
                                "x-rapidapi-key": "f8f3f5ca09msh39bf86f4cbe271fp1d2596jsna341a9dd552c"
                        }
                };
                
                $.ajax(settings).done(function (response) {
                    console.log(response);
                    addarray(response);
                });
                
                console.log(table);
              //store all the products in an array
                function addarray(response){
                    console.log(response.products.length);
                    for (var i = 0; i < response.products.length; i++) {
                      item = response.products[i];
                    //If the image is null replace it with a default image
                      var Image = (item.image) ? item.image : placeHldr ;
                    //store all the info from the search into an item
                      var product = {
                        name: (item.name).replaceAll("|", " ").replaceAll(/&amp;/g, " ").trim(),
                        price : item.price,
                        image : Image,
                        link: item.link
                      };
                      product.price = product.price.split(' ')[0];
                      table[counter]= product;
                      counter++;
                    }
                    console.log(table);
                    displayResults(table);
                }
              //print the results into the page
                function displayResults(table) {
                    for (var i = 0; i < table.length; i++) {
                      outputList.innerHTML += formatOutput(table[i]);
                    }
                  //stops the loading gif
                    close_gif();
                }
                
                function close_gif(){
                    var x = document.getElementById("loader");
                      x.style.display = "none";
                }
              //Create the format of the products
                function formatOutput(info) {
                	//Create a string with all the parameters of a product
                    //if the user wants to visit the product's page, this string help us to pass the information
                  var info_path = info.image + "==" + (info.name) + "==" + info.price + "==" + info.link;
       
                  var htmlCard = `<center><div class="product" style = "padding-top:10px;">
                        <div class="product_photo">
                          <img src="\${info.image}" style="width: 180px; height: 180px">
                        </div>
                        <div class="product_info">
                          <h3>\${info.name}</h3>
                          <p style="color: white;">Price: \${info.price}</p><br>
                          <a class="button" href="\${info.link}" target="_blank"><i class="fab fa-ebay" style="font-size: 2.5em; color: white;"></i></a><br>
                          <a class="button" href="products_servlet?info=\${info_path}"><i class="fas fa-comments" style="font-size: 2.5em; color: white;"></i></a>  
                          <hr>
                        </div>
                      </div></center>`;
                  return htmlCard;
                }
                function displayError() {
                  alert("search term can not be empty!")
                }
            }
        </script>
    </body>
</html>
