package travel.model;

import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import travel.DTO.AccommodationDto;
import travel.DTO.RoomDto;
import travel.util.DBUtil;

public class AccommodationDAO {
	private static final String SQL_SELECT_ALL = "select * from accommodation";
	private static final String SQL_SELECT_LIKE = "select * from accommodation where address like '%?%'";
	private static final String SQL_SELECT_DATE = "SELECT Accommodation_id \r\n"
			+ "FROM  ACCOMMODATION JOIN ROOM using(accommodation_id)\r\n" + "	JOIN RESERVATION using(room_id)\r\n"
			+ "WHERE (check_in>= ? AND check_in<= ? )\r\n" + " OR (CHECK_out >= ? AND check_out<= ? )\r\n";
	private static final String SQL_INSERT_ACCO = "INSERT INTO Accommodation (Accommodation_id , User_id ,Accommodation_name , Address , New_address , A_image_path , A_option , Phone , Accommodation_type) VALUEs "
			+ "( seq_acc.nextval , ? , ? , ? , ? , ? , ? , ? , ?)";

	Connection conn;
	PreparedStatement pst;
	Statement st;
	ResultSet rs;

	public List<AccommodationDto> selectAllaccommo() {
		List<AccommodationDto> accoList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(SQL_SELECT_ALL);
			while (rs.next()) {
				AccommodationDto accommo = makeAccommo(rs);
				accoList.add(accommo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return accoList;
	}

	public List<AccommodationDto> selectByAddress(String address) {
		List<AccommodationDto> accoList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_SELECT_LIKE);
			pst.setString(1, address);
			rs = pst.executeQuery();
			while (rs.next()) {
				AccommodationDto accommo = makeAccommo(rs);
				accoList.add(accommo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return accoList;
	}

	public List<AccommodationDto> selectByDate(Date check_in, Date check_out) {
		List<AccommodationDto> accoList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_SELECT_DATE);
			pst.setDate(1, check_in);
			pst.setDate(2, check_in);
			pst.setDate(3, check_out);
			pst.setDate(4, check_out);
			rs = pst.executeQuery();
			while (rs.next()) {
				AccommodationDto accommo = makeAccommo(rs);
				accoList.add(accommo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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

	// 숙소등록
	public int InsertAcco(AccommodationDto acco) {
		int result = 0;
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_INSERT_ACCO);
			/* pst.setInt(1, acco.getAccommodation_id()); */
			pst.setString(1, acco.getUser_id());
			pst.setString(2, acco.getAccommodation_name());
			pst.setString(3, acco.getAddress());
			pst.setString(4, acco.getNew_address());
			pst.setString(5, acco.getA_image_path());
			pst.setString(6, acco.getA_option());
			pst.setString(7, acco.getPhone());
			pst.setString(8, acco.getAccommodation_type());

			result = pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}

		return result;
	}

	@SuppressWarnings("unchecked")
	public JSONArray makeJsonArray(List<AccommodationDto> list) {
		JSONArray jArray = new JSONArray();
		for (int j = 0; j < list.size(); j++) {
			JSONObject sObject = new JSONObject();// �迭 ���� �� json
			sObject.put("accommodation_id", list.get(j).getAccommodation_id());
			sObject.put("user_id", list.get(j).getUser_id());
			sObject.put("accommodation_name", list.get(j).getAccommodation_name());
			sObject.put("new_address", list.get(j).getNew_address());
			sObject.put("address", list.get(j).getAddress());
			sObject.put("a_option", list.get(j).getA_option());
			sObject.put("cleaning_stars", list.get(j).getCleaning_star());
			sObject.put("location_stars", list.get(j).getLocation_star());
			sObject.put("satisfied_stars", list.get(j).getSatisfied_star());
			sObject.put("a_image_path", list.get(j).getA_image_path());
			sObject.put("mail_num", list.get(j).getMail_num());
			sObject.put("new_mail_nume", list.get(j).getNew_mail_num());
			sObject.put("x", list.get(j).getX());
			sObject.put("y", list.get(j).getY());
			jArray.add(sObject);

		}
		return jArray;
	}

}