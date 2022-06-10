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

import travel.DTO.InteAccoDTO;
import travel.DTO.AccommodationDto;
import travel.DTO.RoomDto;
import travel.util.DBUtil;

public class AccommodationDAO {
	private static final String SQL_SELECT_ALL = "select * from accommodation";
	private static final String SQL_SELECT_LIKE = "select * from accommodation where address like '%?%'";
	private static final String SQL_SELECT_OPTION = "SELECT *\r\n"
			+ "FROM ACCOMMODATION a FULL OUTER JOIN ROOM r ON a.ACCOMMODATION_ID = r.ACCOMMODATION_ID \r\n"
			+ "WHERE (a.ADDRESS LIKE '%'||?||'%')\r\n"
			+ "AND (r.MAX_PERSONNEL>=? AND r.MIN_PERSONNEL<=?)"
			+ "AND(r.MAX_DAY>=(? - ?) AND r.MIN_DAY<=(?-?))"
			+ "OR (r.MAX_PERSONNEL IS null)";
	private static final String SQL_SELECT_DATE = "SELECT ROOM_ID  \r\n"
			+ "FROM ROOM r JOIN RESERVATION r2 using(room_id)\r\n"
			+ "WHERE (check_in BETWEEN ? and  ? ) or (CHECK_out BETWEEN ? and ? )\r\n";

	private static final String SQL_INSERT_ACCO = "INSERT INTO Accommodation (Accommodation_id , User_id ,Accommodation_name , Address , New_address , A_image_path , A_option , Phone , Accommodation_type) VALUEs "
			+ "( seq_acc.nextval , ? , ? , ? , ? , ? , ? , ? , ?)";
	private static final String SQL_SELECT_BY_ID = "select * from accommodation where accommodation_id = ?";
	private static final String SQL_INSERT_ROOM = "INSERT INTO Accommodation (Accommodation_id , User_id ,Accommodation_name , Address , New_address , A_image_path , A_option , Phone , Accommodation_type) VALUEs "
			+ "( seq_acc.nextval , ? , ? , ? , ? , ? , ? , ? , ?)";

	Connection conn;
	PreparedStatement pst;
	Statement st;
	ResultSet rs;
	

	public List<InteAccoDTO> selectAllaccommo() {
		List<InteAccoDTO> accoList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(SQL_SELECT_ALL);
			while(rs.next()) {
				InteAccoDTO accommo = makeinteAcco(rs);
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

	public List<InteAccoDTO> selectByAddress(String address) {
		List<InteAccoDTO> accoList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_SELECT_LIKE);
			pst.setString(1, address);
			rs = pst.executeQuery();
			while(rs.next()) {
				InteAccoDTO accommo = makeinteAcco(rs);
				accoList.add(accommo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return accoList;
	}

	public List<Integer> selectByDate(Date check_in, Date check_out) {
		List<Integer> accoList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_SELECT_DATE);
			pst.setDate(1, check_in);
			pst.setDate(2, check_out);
			pst.setDate(3, check_in);
			pst.setDate(4, check_out);
			rs = pst.executeQuery();
			while(rs.next()) {
				accoList.add(rs.getInt("room_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return accoList;
	}
	public List<InteAccoDTO> selectByOption(String loc, int person, Date check_in, Date check_out){
		List<InteAccoDTO> accoList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_SELECT_OPTION);
			pst.setString(1, loc);
			pst.setInt(2, person);
			pst.setInt(3, person);
			pst.setDate(4, check_out);
			pst.setDate(5, check_in);
			pst.setDate(6, check_out);
			pst.setDate(7, check_in);
			rs = pst.executeQuery();
			while(rs.next()) {
				InteAccoDTO accommo = makeinteAcco(rs);
				accoList.add(accommo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return accoList;
	}
	public AccommodationDto selectById(int id) {
		AccommodationDto accommo = null;
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_SELECT_BY_ID);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			rs.next();
			accommo = makeAcco(rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return accommo;
	}

	private AccommodationDto makeAcco(ResultSet rs2) {
		AccommodationDto accommo = new AccommodationDto();
		try {
			accommo.setAccommodation_id(rs2.getInt("accommodation_id"));
			accommo.setAccommodation_type(rs2.getString("accommodation_type"));
			accommo.setPhone(rs2.getString("phone"));
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

	private InteAccoDTO makeinteAcco(ResultSet rs2) {
		InteAccoDTO accommo = new InteAccoDTO();
		try {
			accommo.setAccommodation_id(rs2.getInt("accommodation_id"));
			accommo.setUser_id(rs2.getString("user_id"));
			accommo.setAccommodation_name(rs2.getString("accommodation_name"));
			accommo.setAddress(rs2.getString("address"));
			accommo.setNew_address(rs2.getString("new_address"));
			String[] options = rs2.getString("a_option").split(",");
			accommo.setA_option(options);
			accommo.setCleaning_star(rs2.getInt("cleaning_stars"));
			accommo.setLocation_star(rs2.getInt("location_stars"));
			accommo.setSatisfied_star(rs2.getInt("satisfied_stars"));
			String[] images = rs2.getString("a_image_path").split(",");
			accommo.setA_image_path(images);
			accommo.setMail_num(rs2.getInt("mail_num"));
			accommo.setNew_mail_num(rs2.getInt("new_mail_num"));
			accommo.setX(rs2.getFloat("x"));
			accommo.setY(rs2.getFloat("y"));
			accommo.setRoom_id(rs2.getInt("room_id"));
		
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return accommo;
	}

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
	public int InsertRoom(RoomDto room) {
		int result = 0;
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_INSERT_ROOM);
			/* pst.setInt(1, acco.getAccommodation_id()); */
			pst.setInt(1, room.getRoom_id());
			pst.setInt(2, room.getMin_personnel());
			pst.setInt(3, room.getMax_personnel());
			pst.setInt(4, room.getMin_day());
			pst.setInt(5, room.getMax_day());
			pst.setInt(6, room.getPrice_by_day());
			/*
			 * pst.setString(7, room.getPhone()); pst.setString(8,
			 * room.getAccommodation_type());
			 */

			result = pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}

		return result;
	}

}