package model;

import java.util.ArrayList;
import java.util.HashMap;

import common.DBConnPool;

public class ProductDAO extends DBConnPool {
	
	public ProductDAO() {
		super();
	}
	
	public HashMap<String, Integer> groupCount() {
		
		HashMap<String, Integer> pmap = new HashMap<>();
		
		String sql = "SELECT gcode, COUNT(*) FROM product GROUP BY gcode ORDER BY gcode";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {					
				pmap.put(rs.getString("gcode"), rs.getInt(2));
			}
		} catch (Exception e) {
			System.out.println("groupCount 조회 중 예외 발생");
			e.printStackTrace();
		}		
		
		return pmap;
	}
	
	public ArrayList<ProductDTO> selectAll() {
		
		ArrayList<ProductDTO> prodList = new ArrayList<ProductDTO>();
		
		String sql = "SELECT * FROM product ORDER BY gcode, code";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {	
				ProductDTO pdto = new ProductDTO();

				pdto.setCode(rs.getString("code"));
				pdto.setPname(rs.getString("pname"));
				pdto.setCost(rs.getInt("cost"));
				pdto.setPnum(rs.getInt("pnum"));
				pdto.setJnum(rs.getInt("jnum"));
				pdto.setSale(rs.getInt("sale"));
				pdto.setGcode(rs.getString("gcode"));
				
				prodList.add(pdto);
			}
		} catch (Exception e) {
			System.out.println("selectAll 조회 중 예외 발생");
			e.printStackTrace();
		}		
		
		return prodList;
	}

}
