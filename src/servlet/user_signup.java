package servlet;

import entity.User;
import entity.ProfileImage;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import project_dao.UserDAO;

@WebServlet(name = "user_signup", urlPatterns = {"/user_signup"})
public class user_signup extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userdao;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        userdao = new UserDAO();
        
        String firstname = request.getParameter("first_name"); // get first name given
        String lastname = request.getParameter("last_name"); // get last name given
        String username = request.getParameter("username"); // get username given
        String password = request.getParameter("password"); // get password given
        String repeat_pass = request.getParameter("repeat_pass"); //get password repeat
        
        //the password must have at least 8 characters to be valid
        if(password.length()<8){
        	//return to sign up page with a error parameter
            response.sendRedirect("sign_up.jsp?error=Password cannot be less than 8 characters!");
            return;
        }
        //check if the password repeat is the same as the password
        if(!password.equals(repeat_pass)){
            response.sendRedirect("sign_up.jsp?error=Password didn't match!");
            return;
        }  
        //create new user to add to the database
        User user = new User(username, password, firstname, lastname);
        
        int result = userdao.addUser(user);
        
        if(result == 0){
        	//if the result there is not a user with the same information
        	//We check to see if there is already a username saved under this session and we return to the login page with an error if that's the case.
            HttpSession session = request.getSession();
            if(session.getAttribute("username") != null){
                response.sendRedirect("login.jsp?error=Already logged in with another account!");
            }
            else{
            	//there is nothing wrong with the sign up information, so the user can log in with their new account
            	//we assign a default image for all the users, which they can change by uploading an image of their own
            	
            	InputStream targetStream = getServletContext().getResourceAsStream("\\default.png");
         	    
         	    byte[] image = targetStream.readAllBytes();
         	    //using the userdao function uploadImage to save it directly to the database
         	    userdao.uploadImage(image, username);
                session.setAttribute("username", username);
                //redirecting to the main page and the user will be logged in
                response.sendRedirect("main.jsp");
            }
        }
        else if(result==1){
        	//if the result is 1 the username is taken by another user
            response.sendRedirect("sign_up.jsp?error=Username already exists!");
        }
        else{
            response.sendRedirect("sign_up.jsp?error=Something went wrong!");
        }
    }
}
