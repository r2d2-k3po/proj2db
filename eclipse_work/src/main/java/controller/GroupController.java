package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ProductDAO;
import model.ProductDTO;
import model.GroupcodeDAO;
import model.GroupcodeDTO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;


public class GroupController extends HttpServlet {
      
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ProductDAO pdao = new ProductDAO();
		GroupcodeDAO gdao = new GroupcodeDAO();
		
		HashMap<String, Integer> pmap = pdao.groupCount();
		ArrayList<ProductDTO> plist = pdao.selectAll();
		ArrayList<GroupcodeDTO> glist = gdao.selectAll();
		
		pdao.close();	
		gdao.close();	
		
		
		req.setAttribute("pmap", pmap);
		req.setAttribute("plist", plist);
		req.setAttribute("glist", glist);
		req.getRequestDispatcher("/group.jsp").forward(req, resp);
	}
}
