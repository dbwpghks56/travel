package travel.model;

import java.sql.Connection;


import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import oracle.security.o3logon.a;
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
			+ "AND(r.MAX_DAY>=(? - ?) AND r.MIN_DAY<=(?-?))";
	private static final String SQL_SELECT_DATE = "SELECT ROOM_ID  \r\n"
			+ "FROM ROOM r JOIN RESERVATION r2 using(room_id)\r\n"
			+ "WHERE (check_in BETWEEN ? and  ? ) or (CHECK_out BETWEEN ? and ? )\r\n";
	private static final String SQL_INSERT_ACCO = "INSERT INTO Accommodation (Accommodation_id , User_id ,Accommodation_name , Address, location_detail, mail_num, x, y , A_image_path , A_option , Phone , Accommodation_type) VALUEs "
			+ "( seq_acc.nextval , ? , ? , ? , ? , ? , ? , ? , ?, ?, ?, ?)";
	private static final String SQL_SELECT_BY_ID = "select * from accommodation where accommodation_id = ?";
	private static final String SQL_UPDATE_STAR = "update accommodation set cleaning_stars = ?, location_stars = ?, satisfied_stars = ? where accommodation_id = ?";
	private static final String SQL_ROOM_TO_ACCO = "select accommodation_id from accommodation join room  using(accommodation_id) where room_id = ?";
	private static final String SQL_SELECT_USER = "select * from accommodation where user_id = ?";
	Connection conn;
	PreparedStatement pst;
	Statement st;
	ResultSet rs;
	

	public List<Map<String, String>> selectAllaccommo() {
		List<Map<String, String>> accoList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(SQL_SELECT_ALL);
			while(rs.next()) {
				Map<String, String> accommo = makeAMap(rs);
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

	public List<Map<String, String>> selectByAddress(String address) {
		List<Map<String, String>> accoList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_SELECT_LIKE);
			pst.setString(1, address);
			rs = pst.executeQuery();
			while(rs.next()) {
				Map<String, String> accommo = makeAMap(rs);
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
	public List<Map<String, String>> selectByOption(String loc, int person, Date check_in, Date check_out){
		List<Map<String, String>> accoList = new ArrayList<>();
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
				Map<String, String> accommo = makeAMap(rs);
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
	public int updateStar(double cStar,double lStar,double sStar,int accoId) {
		conn = DBUtil.getConnection();
		int ret = 0;
		try {
			pst = conn.prepareStatement(SQL_UPDATE_STAR);
			pst.setDouble(1, cStar);
			pst.setDouble(2, lStar);
			pst.setDouble(3, sStar);
			pst.setInt(4, accoId);
			ret = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return ret;
	}
	public int roomToAcco(int rId) {
		conn = DBUtil.getConnection();
		int accoId = 0;
		try {
			pst = conn.prepareStatement(SQL_ROOM_TO_ACCO);
			pst.setInt(1, rId);
			rs = pst.executeQuery();
			rs.next();
			accoId = rs.getInt("accommodation_id");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return accoId;
	}
	public List<Map<String, String>> selectByUser(String user_id) {
		List<Map<String, String>> accoList = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_SELECT_USER);
			pst.setString(1, user_id);
			rs = pst.executeQuery();
			while(rs.next()) {
				Map<String, String> accommo = makeAMap2(rs);
				accoList.add(accommo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return accoList;
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
			accommo.setA_option(rs2.getString("a_option"));
			accommo.setCleaning_star(rs2.getInt("cleaning_stars"));
			accommo.setLocation_star(rs2.getInt("location_stars"));
			accommo.setSatisfied_star(rs2.getInt("satisfied_stars"));
			accommo.setA_image_path(rs2.getString("a_image_path"));
			accommo.setX(rs2.getFloat("x"));
			accommo.setY(rs2.getFloat("y"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return accommo;
	}
	
	
	private Map<String, String> makeAMap(ResultSet rs){
		Map<String, String> aMap = new HashMap<>();
		try {
			aMap.put("accommodation_id", rs.getString("accommodation_id"));
			aMap.put("user_id", rs.getString("user_id"));
			aMap.put("accommodation_name", rs.getString("accommodation_name"));
			aMap.put("address", rs.getString("address"));
			aMap.put("a_option", rs.getString("a_option"));
			aMap.put("cleaning_stars", rs.getString("cleaning_stars"));
			aMap.put("location_stars", rs.getString("location_stars"));
			aMap.put("satisfied_stars", rs.getString("satisfied_stars"));
			aMap.put("a_image_path", rs.getString("a_image_path"));
			aMap.put("x", rs.getString("x"));
			aMap.put("y", rs.getString("y"));
			aMap.put("room_id", rs.getString("room_id"));
			aMap.put("phone", rs.getString("phone"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return aMap;
		
	}
	private Map<String, String> makeAMap2(ResultSet rs){
		Map<String, String> aMap = new HashMap<>();
		try {
			aMap.put("accommodation_id", rs.getString("accommodation_id"));
			aMap.put("user_id", rs.getString("user_id"));
			aMap.put("accommodation_name", rs.getString("accommodation_name"));
			aMap.put("address", rs.getString("address"));
			aMap.put("a_option", rs.getString("a_option"));
			aMap.put("cleaning_stars", rs.getString("cleaning_stars"));
			aMap.put("location_stars", rs.getString("location_stars"));
			aMap.put("satisfied_stars", rs.getString("satisfied_stars"));
			aMap.put("a_image_path", rs.getString("a_image_path"));
			aMap.put("x", rs.getString("x"));
			aMap.put("y", rs.getString("y"));
			aMap.put("phone", rs.getString("phone"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return aMap;
		
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
			pst.setString(4, acco.getLocation_detail());
			pst.setInt(5, acco.getMail_num());
			pst.setFloat(6, acco.getX());
			pst.setFloat(7, acco.getY());
			pst.setString(8, acco.getA_image_path());
			pst.setString(9, acco.getA_option());
			pst.setString(10, acco.getPhone());
			pst.setString(11, acco.getAccommodation_type());

			result = pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}

		return result;
	}


	public int accoDelete(String user_id, int accommodation_id) {
		
		conn = DBUtil.getConnection();
		int result = 0;
		
		try {
			pst = conn.prepareStatement(""
					+ "SELECT  count(r.RSV_NO)\r\n"
					+ "FROM RESERVATION r , ROOM r2 , ACCOMMODATION a, USERS u\r\n"
					+ "WHERE(r.ROOM_ID = r2.ROOM_ID AND r2.ACCOMMODATION_ID = a.ACCOMMODATION_ID AND r.USER_ID = u.USER_ID) AND a.USER_ID = ? AND a.ACCOMMODATION_ID=?");
			pst.setString(1, user_id);
			pst.setInt(2, accommodation_id);
			rs = pst.executeQuery();
			rs.next();
			int rsvNo = rs.getInt(1);
			if(rsvNo==0) {
				pst.close();
				pst = conn.prepareStatement("delete from ACCOMMODATION where user_id = ? and accommodation_id = ?  ");
				pst.setString(1, user_id);
				pst.setInt(2, accommodation_id);
				result = pst.executeUpdate();
			}else { return 0; }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
	
		
		return result;
	}

	public int updateAcco(String pro, String newValue, int id) {
		conn = DBUtil.getConnection();
		String sql = "update accommodation set "+pro+" = '"+newValue+"' where accommodation_id = "+id;
		int ret = 0;
		try {
			st = conn.createStatement();
			ret = st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return ret;
	}
}