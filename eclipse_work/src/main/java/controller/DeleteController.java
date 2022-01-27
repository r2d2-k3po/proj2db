package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ProductDAO;
import model.ProductDTO;

import java.io.IOException;

public class DeleteController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		String code =req.getParameter("code");
		
		ProductDAO pdao = new ProductDAO();
		int result = pdao.deleteOne(code);
		
		pdao.close();			
		
		req.setAttribute("result", result);
		req.getRequestDispatcher("/select.jsp").forward(req, resp);
	}
}
