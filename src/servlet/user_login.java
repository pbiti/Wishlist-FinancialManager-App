package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project_dao.UserDAO;
import entity.User;
import javax.servlet.http.HttpSession;

@WebServlet(name = "user_login", urlPatterns = {"/user_login"})
public class user_login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userdao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        userdao = new UserDAO();
        
        String username = request.getParameter("username"); //get the username that was inserted
        String password = request.getParameter("password"); //get the password that was inserted
        
        User user = new User(username, password); //create a new User object to check if the login information is right
        
        //check if a user with the given information exists in the database
        int result = userdao.check_username(user);
        
        if(result == 0){
        	//If the result is 0 it means that there is a user in the database with the given information
        	//Check the username attribute to see if there is already a saved username in the session that needs to be logged out
        	//in order to log in from another account
            HttpSession session = request.getSession();
            if(session.getAttribute("username") != null){
                response.sendRedirect("login.jsp?error=Already logged in with another account!");
            }
            else{
            	//there is no username saved under this session so the user can log in to their account
                session.setAttribute("username", username);
                response.sendRedirect("main.jsp");
            }
        }
        else if(result==1){
        	//if the result is 1 there is no user with the given username in the database
            response.sendRedirect("login.jsp?error=This username doesn't exist!");
        }
        else if(result==2){
        	//if the result is 2 there is a user with the given name but another password
            response.sendRedirect("login.jsp?error=The password is wrong!");
        }
        else{
            response.sendRedirect("login.jsp?error=Something went wrong!");
        }
    }
}
