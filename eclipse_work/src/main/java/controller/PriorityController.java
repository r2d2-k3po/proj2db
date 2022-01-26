package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ProductDAO;
import model.ProductDTO;

import java.io.IOException;
import java.util.ArrayList;

public class PriorityController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ProductDAO pdao = new ProductDAO();
		
		ArrayList<ProductDTO> plist = pdao.selectPriority();
		
		pdao.close();	
		
		req.setAttribute("plist", plist);
		req.getRequestDispatcher("/priority.jsp").forward(req, resp);
		
	}

}
