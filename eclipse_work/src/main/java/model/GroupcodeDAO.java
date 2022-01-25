package model;

import java.util.ArrayList;

import common.DBConnPool;

public class GroupcodeDAO extends DBConnPool {

	public GroupcodeDAO() {
		super();
	}
	
	public ArrayList<GroupcodeDTO> selectAll() {
		
		ArrayList<GroupcodeDTO> groupList = new ArrayList<GroupcodeDTO>();
		
		String sql = "SELECT * FROM groupcode ORDER BY gcode";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {	
				GroupcodeDTO gdto = new GroupcodeDTO();

				gdto.setGcode(rs.getString("gcode"));
				gdto.setGname(rs.getString("gname"));
				
				groupList.add(gdto);
			}
		} catch (Exception e) {
			System.out.println("DB 조회 중 예외 발생");
			e.printStackTrace();
		}		
		
		return groupList;
	}
}
