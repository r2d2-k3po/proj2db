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
	
	public int insert(ProductDTO pdto) {
		
		int result = 0;		
		
		try {
			String sql = "INSERT INTO product (code, pname, cost, pnum, jnum, sale, gcode)"
					   + " VALUES (?,?,?,?,?,?,?)";
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1,  pdto.getCode());
			psmt.setString(2,  pdto.getPname());
			psmt.setInt(3,  pdto.getCost());
			psmt.setInt(4,  pdto.getPnum());
			psmt.setInt(5,  pdto.getJnum());
			psmt.setInt(6,  pdto.getSale());
			psmt.setString(7,  pdto.getGcode());	
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insert 중 예외 발생");
			e.printStackTrace();
		}		
		
		return result;
	}

	public ProductDTO selectOne(ProductDTO pdto) {
				
		String sql = "SELECT * FROM product WHERE code=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pdto.getCode());
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				pdto.setPname(rs.getString("pname"));
				pdto.setCost(rs.getInt("cost"));
				pdto.setPnum(rs.getInt("pnum"));
				pdto.setJnum(rs.getInt("jnum"));
				pdto.setSale(rs.getInt("sale"));
				pdto.setGcode(rs.getString("gcode").trim());
			}
		} catch (Exception e) {
			System.out.println("selectOne 조회 중 예외 발생");
			e.printStackTrace();
		}		
		
		return pdto;
	}

	public int updateOne(ProductDTO pdto) {
		
		int result = 0;		
		
		try {
			String sql = "UPDATE product SET pname=?, cost=?, pnum=?, jnum=?, sale=?, gcode=? WHERE code=?";
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1,  pdto.getPname());
			psmt.setInt(2,  pdto.getCost());
			psmt.setInt(3,  pdto.getPnum());
			psmt.setInt(4,  pdto.getJnum());
			psmt.setInt(5,  pdto.getSale());
			psmt.setString(6,  pdto.getGcode());	
			psmt.setString(7,  pdto.getCode());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateOne 중 예외 발생");
			e.printStackTrace();
		}		
		
		return result;
	}
	
	public int deleteOne(String code) {
		
		int result = 0;		
		
		try {
			String sql = "DELETE FROM product WHERE code=?";
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1,  code);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteOne 중 예외 발생");
			e.printStackTrace();
		}		
		
		return result;
	}

	public ArrayList<ProductDTO> selectProfit() {
		
		ArrayList<ProductDTO> prodList = new ArrayList<ProductDTO>();
		
		String sql = "SELECT * FROM product ORDER BY jnum*(sale-cost) DESC";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {	
				ProductDTO pdto = new ProductDTO();

				pdto.setCode(rs.getString("code"));
				pdto.setPname(rs.getString("pname"));
				pdto.setCost(rs.getInt("cost"));
				pdto.setJnum(rs.getInt("jnum"));
				pdto.setSale(rs.getInt("sale"));
				
				prodList.add(pdto);
			}
		} catch (Exception e) {
			System.out.println("selectProfit 조회 중 예외 발생");
			e.printStackTrace();
		}		
		
		return prodList;
	}
	
	public ArrayList<ProductDTO> selectPriority() {
		
		ArrayList<ProductDTO> prodList = new ArrayList<ProductDTO>();
		
		String sql = "SELECT code, pname, pnum, jnum FROM product WHERE jnum*5 < pnum ORDER BY pnum-jnum DESC";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {	
				ProductDTO pdto = new ProductDTO();

				pdto.setCode(rs.getString("code"));
				pdto.setPname(rs.getString("pname"));
				pdto.setPnum(rs.getInt("pnum"));
				pdto.setJnum(rs.getInt("jnum"));
				
				prodList.add(pdto);
			}
		} catch (Exception e) {
			System.out.println("selectPriority 조회 중 예외 발생");
			e.printStackTrace();
		}		
		
		return prodList;
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
