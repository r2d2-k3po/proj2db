package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ProductDAO;
import model.ProductDTO;

import java.io.IOException;

public class UpdateController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ProductDTO pdto = new ProductDTO();
		
		pdto.setCode(req.getParameter("code"));
		pdto.setPname(req.getParameter("pname"));
		pdto.setCost(Integer.parseInt(req.getParameter("cost")));
		pdto.setPnum(Integer.parseInt(req.getParameter("pnum")));
		pdto.setJnum(Integer.parseInt(req.getParameter("jnum")));
		pdto.setSale(Integer.parseInt(req.getParameter("sale")));
		pdto.setGcode(req.getParameter("gcode"));
		
		ProductDAO pdao = new ProductDAO();
		int result = pdao.updateOne(pdto);
		
		pdao.close();			
		
		req.setAttribute("result", result);
		req.getRequestDispatcher("/select.jsp").forward(req, resp);
	}

}
