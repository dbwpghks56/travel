package travel.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import travel.DTO.RoomDto;
import travel.DTO.SightDTO;
import travel.util.DBUtil;

public class SightService {
	private static final String SQL_SELECT_ALL = "select * from sights";
	Connection conn;
	PreparedStatement pst;
	Statement st;
	ResultSet rs;
	public List<SightDTO> selectAll(){
		List<SightDTO> sList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(SQL_SELECT_ALL);
			while(rs.next()) {
				SightDTO sight = makeSight(rs);
				sList.add(sight);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return sList;
	}
	private SightDTO makeSight(ResultSet rs2) {
		SightDTO sight = new SightDTO();
		try {
			sight.setAddress(rs2.getString("address"));
			sight.setPhone(rs2.getString("phone"));
			sight.setSights_id(rs2.getInt("sights_id"));
			sight.setSights_name(rs.getString("sights_name"));
			sight.setSights_type(rs2.getString("sights_type"));
			sight.setX(rs2.getFloat("x"));
			sight.setY(rs2.getFloat("y"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sight;
	}
}
