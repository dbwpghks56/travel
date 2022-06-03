package travel.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import travel.DTO.AccommodationDto;
import travel.util.DBUtil;

public class AccommodationDAO {
	private static final String SQL_SELECT_ALL = "select * from accommodation";
	private static final String SQL_SELECT_LIKE = "select * from accommodation where address like '%?%'";
	private static final String SQL_SELECT_DATE = "SELECT Accommodation_id \r\n"
			+ "FROM  ACCOMMODATION JOIN ROOM using(accommodation_id)\r\n"
			+ "	JOIN RESERVATION using(room_id)\r\n"
			+ "WHERE (check_in>= ? AND check_in<= ? )\r\n"
			+ " OR (CHECK_out >= ? AND check_out<= ? )\r\n";
	
	Connection conn;
	PreparedStatement pst;
	Statement st;
	ResultSet rs;
	
	public List<AccommodationDto> selectAllaccommo(){
		List<AccommodationDto> accoList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(SQL_SELECT_ALL);
			while(rs.next()) {
				AccommodationDto accommo = makeAccommo(rs);
				accoList.add(accommo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return accoList;
	}
	public List<AccommodationDto> selectByAddress(String address){
		List<AccommodationDto> accoList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_SELECT_LIKE);
			pst.setString(1, address);
			rs = pst.executeQuery();
			while(rs.next()) {
				AccommodationDto accommo = makeAccommo(rs);
				accoList.add(accommo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return accoList;
	}

	public List<AccommodationDto> selectByDate(Date check_in, Date check_out){
		List<AccommodationDto> accoList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_SELECT_DATE);
			pst.setDate(1, check_in);
			pst.setDate(2, check_in);
			pst.setDate(3, check_out);
			pst.setDate(4, check_out);
			rs = pst.executeQuery();
			while(rs.next()) {
				AccommodationDto accommo = makeAccommo(rs);
				accoList.add(accommo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return accoList;
	}

	private AccommodationDto makeAccommo(ResultSet rs2) {
		AccommodationDto accommo = new AccommodationDto();
		try {
			accommo.setAccommodation_id(rs2.getInt("accommodation_id"));
			accommo.setUser_id(rs2.getString("user_id"));
			accommo.setAccommodation_name(rs2.getString("accommodation_name"));
			accommo.setAddress(rs2.getString("address"));
			accommo.setNew_address(rs2.getString("new_address"));
			accommo.setA_option(rs2.getString("a_option"));
			accommo.setCleaning_star(rs2.getInt("cleaning_stars"));
			accommo.setLocation_star(rs2.getInt("location_stars"));
			accommo.setSatisfied_star(rs2.getInt("satisfied_stars"));
			accommo.setA_image_path(rs2.getString("a_image_path"));
			accommo.setMail_num(rs2.getInt("mail_num"));
			accommo.setNew_mail_num(rs2.getInt("new_mail_num"));
			accommo.setX(rs2.getFloat("x"));
			accommo.setY(rs2.getFloat("y"));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return accommo;
	}
}