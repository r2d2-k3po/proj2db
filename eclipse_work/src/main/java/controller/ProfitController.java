package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ProductDAO;
import model.ProductDTO;

import java.io.IOException;
import java.util.ArrayList;

public class ProfitController extends HttpServlet {
       
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ProductDAO pdao = new ProductDAO();
		
		ArrayList<ProductDTO> plist = pdao.selectProfit();
		
		pdao.close();	
		
		req.setAttribute("plist", plist);
		req.getRequestDispatcher("/profit.jsp").forward(req, resp);
	}
}
