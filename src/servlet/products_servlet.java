package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.EbayProducts;

import javax.servlet.RequestDispatcher;
import project_dao.products_dao;

public class products_servlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        products_dao products_dao = new products_dao();
        
        //split the string parameter and gather the information about the product
        
        String[] info = request.getParameter("info").split("==");
        info[1] = info[1].replaceAll("[^\\p{ASCII}]", " ");
        info[1] = info[1].trim();
        EbayProducts prod = new EbayProducts(info[1], info[0], info[3], info[2], 0);
        //store them in the database
        int result = products_dao.addProduct(prod);
        String[] array = {info[0], info[1], info[2], info[3]};
        
        request.setAttribute("prod_information", array);        
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/products.jsp");
		dispatcher.forward(request, response);
    }
}
