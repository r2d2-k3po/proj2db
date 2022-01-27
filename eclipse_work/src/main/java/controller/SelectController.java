package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ProductDAO;
import model.ProductDTO;

import java.io.IOException;

public class SelectController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int result = -1;
		req.setAttribute("result", result);
		req.getRequestDispatcher("/select.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ProductDTO pdto = new ProductDTO();
		
		pdto.setCode(req.getParameter("code"));
		
		ProductDAO pdao = new ProductDAO();
		pdto = pdao.selectOne(pdto);
		
		pdao.close();			
		
		int result = 2;
		req.setAttribute("result", result);
		req.setAttribute("pdto", pdto);
		req.getRequestDispatcher("/select.jsp").forward(req, resp);
	}

}
