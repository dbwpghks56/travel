package travel.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import travel.DTO.RoomDto;
import travel.DTO.SightDTO;
import travel.util.DBUtil;

public class SightsDAO {
	private static final String SQL_SELECT_ALL = "select * from sights";
	private static final String SQL_SELECT_ADDRES = "select * from sights where address like '%'||?||'%'";
	Connection conn;
	PreparedStatement pst;
	Statement st;
	ResultSet rs;
	public List<Map<String, String>> selectAll(){
		List<Map<String, String>> sMaps = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(SQL_SELECT_ALL);
			while(rs.next()) {
				Map<String, String> sight = makeMap(rs);
				sMaps.add(sight);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return sMaps;
	}
	public List<SightDTO> selectByAddress(String address){
		List<SightDTO> sights = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_SELECT_ADDRES);
			pst.setString(1, address);
			rs = pst.executeQuery();
			while(rs.next()) {
				SightDTO sight = makeSight(rs);
				sights.add(sight);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return sights;
		
	}
	private SightDTO makeSight(ResultSet rs2) {
		SightDTO sight = new SightDTO();
		try {
			sight.setAddress(rs2.getString("address"));
			sight.setPhone(rs2.getString("phone"));
			sight.setSights_id(rs2.getInt("sights_id"));
			sight.setSights_name(rs.getString("sights_name"));
			sight.setSights_type(rs2.getString("SIGHT_TYPE"));
			sight.setX(rs2.getFloat("x"));
			sight.setY(rs2.getFloat("y"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sight;
	}
	private Map<String, String> makeMap(ResultSet rs){
		Map<String, String> sMap = new HashMap<>();
		try {
			sMap.put("address", rs.getString("address"));
			sMap.put("phone", rs.getString("phone"));
			sMap.put("sights_id", rs.getString("sights_id"));
			sMap.put("sights_name", rs.getString("sights_name"));
			sMap.put("SIGHT_TYPE", rs.getString("SIGHT_TYPE"));
			sMap.put("x", rs.getFloat("x")+"");
			sMap.put("y", rs.getFloat("y")+"");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sMap;
	}
}
