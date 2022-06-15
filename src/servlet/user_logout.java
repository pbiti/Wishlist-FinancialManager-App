package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class user_logout extends HttpServlet{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
	//Remove all attributes set for the session and invalidate it. Redirect to the login page.
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.removeAttribute("username");
		session.removeAttribute("prod_information");
		session.removeAttribute("prod_to_rate");
		session.invalidate();
		response.sendRedirect("login.jsp");
	}
	

}
