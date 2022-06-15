package servlet;

import com.mchange.io.FileUtils;
import com.mysql.jdbc.PreparedStatement;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import project_dao.UserDAO;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;

@WebServlet(name = "upload_image", urlPatterns = {"/upload_image"})
public class upload_image extends HttpServlet {

    private static final String PreparedStatement = null;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		HttpSession session=request.getSession();
	    String username=(String)session.getAttribute("username");
		
        //check if the chosen file exists
    	Part file = request.getPart("change_image");
    	if(file!=null) {
    		UserDAO userDAO = new UserDAO();
            InputStream inputStream = null;
                   
            if(file!=null){
                inputStream = file.getInputStream();
                byte[] image = inputStream.readAllBytes();
                boolean result = userDAO.uploadImage(image, username);
                if(result){
                    //image uploaded
                    response.sendRedirect("main.jsp");
                }
                else{
                    //failed to upload
                    response.sendRedirect("edit_profile.jsp");
                }
            }
    	}
    }
}
