package travel.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import travel.DTO.ReservationDTO;
import travel.util.DBUtil;



public class ReservationDAO {
	private static final String SQL_DELETE_ALL = "delete reservation where user_id = ?";
	private static final String SQL_DD_ALL = "delete delete_reservation where user_id = ?";
	Connection conn;
	Statement st;
	PreparedStatement pst;
	ResultSet rs;
	int result;

	//reservation insert
	public int resevation(ReservationDTO rsv) {
		result = 0;
		conn = DBUtil.getConnection();
		
		//insert into RESERVATION values(rsv_no, user_id, room_id, check_in, check_out, rsv_date, personnel, request, rsv_status);
		try {
			pst = conn.prepareStatement("insert into reservation values(seq_rsv.nextval, ?, ?, ?, ?, sysdate, ?, ?, '예약완료')");
			pst.setString(1, rsv.getUser_id());
			pst.setInt(2, rsv.getRoom_id());
			pst.setDate(3, rsv.getCheck_in());
			pst.setDate(4, rsv.getCheck_out());
			pst.setInt(5, rsv.getPersonnel());
			pst.setString(6, rsv.getRequest());
			

			result = pst.executeUpdate(); 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return result;
	}
	
	//reservation update
	public int rsvUpdate(ReservationDTO rsv) {
		result = 0;
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("update reservation set "
										+ " request = ? "
										+ " where rsv_no = ? and check_in>=sysdate");
			pst.setString(1, rsv.getRequest());
			pst.setInt(2, rsv.getRsv_no());
			result = pst.executeUpdate(); 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return result;
	}
	
	//reservation delete
	public int rsvDelete(int rsv_no) {
		result = 0;
		conn = DBUtil.getConnection();
		try {
			//delete from reservation where rsv_no = ?;
			pst = conn.prepareStatement("delete from reservation where rsv_no = ?");
			pst.setInt(1, rsv_no);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return result;
		
	}
	
	//reservation delete list(user)
	public List<ReservationDTO> rsvDeleteAll(String user_id){
		List<ReservationDTO> rsvList = new ArrayList<>();
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("SELECT dr.D_RSV_NO, a.ACCOMMODATION_NAME, r2.ROOM_NAME , dr.CHECK_IN ,dr.CHECK_OUT,((dr.CHECK_OUT-dr.CHECK_IN)*r2.PRICE_BY_DAY) AS totalprice, dr.RSV_DATE,u.USER_PHONE, u.user_name  \r\n"
					+ "FROM DELETE_RESERVATION dr ,ROOM r2 , ACCOMMODATION a,USERS u  \r\n"
					+ "WHERE (dr.ROOM_ID = r2.ROOM_ID AND r2.ACCOMMODATION_ID = a.ACCOMMODATION_ID AND dr.USER_ID = u.USER_ID) AND dr.USER_ID = ? \r\n"
					+ "ORDER BY dr.D_RSV_NO DESC");
			pst.setString(1, user_id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				rsvList.add(makeRsv6(rs));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
	
		
		return rsvList;
		
	}
	
	//reservation delete detail(user)
	public ReservationDTO rsvDeleteAllDetail(int d_rsv_no) {
		ReservationDTO rsv = new ReservationDTO();
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("SELECT dr.*, r2.ROOM_NAME, ((dr.CHECK_OUT-dr.CHECK_IN)*r2.PRICE_BY_DAY) AS totalprice, a.ACCOMMODATION_NAME ,a.PHONE, a.address\r\n"
					+ "FROM DELETE_RESERVATION dr , ROOM r2 , ACCOMMODATION a \r\n"
					+ "WHERE(dr.ROOM_ID = r2.ROOM_ID AND r2.ACCOMMODATION_ID = a.ACCOMMODATION_ID) AND dr.D_RSV_NO  = ?");
			pst.setInt(1, d_rsv_no);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				rsv.setD_rsv_no(rs.getInt("D_rsv_no"));
				rsv.setUser_id(rs.getString("User_id"));
				rsv.setRoom_id(rs.getInt("Room_id"));
				rsv.setCheck_in(rs.getDate("Check_in"));
				rsv.setCheck_out(rs.getDate("Check_out"));
				rsv.setRsv_date(rs.getDate("Rsv_date"));
				rsv.setPersonnel(rs.getInt("Personnel"));
				rsv.setRequest(rs.getString("Request"));
				rsv.setRoom_name(rs.getString("Room_name"));
				rsv.setTotalprice(rs.getInt("Totalprice"));
				rsv.setAccommodation_name(rs.getString("Accommodation_name"));
				rsv.setPhone(rs.getString("Phone"));
				rsv.setAddress(rs.getString("Address"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
	
		
		return rsv;
	}
	
	//delete detail delete
	public int dRsvNoDelete(int d_rsv_no) {
		result = 0;
		conn = DBUtil.getConnection();
		try {
			//delete from reservation where rsv_no = ?;
			pst = conn.prepareStatement("DELETE FROM DELETE_RESERVATION WHERE D_RSV_NO = ?");
			pst.setInt(1, d_rsv_no);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return result;
		
	}

	//reservation delete list(host) 
	public List<ReservationDTO> rsvDeleteAllhost(String user_id){
		List<ReservationDTO> rsvList = new ArrayList<>();
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(""
					+ "SELECT dr.D_RSV_NO, a.ACCOMMODATION_NAME, r2.ROOM_NAME , dr.CHECK_IN ,dr.CHECK_OUT,((dr.CHECK_OUT-dr.CHECK_IN)*r2.PRICE_BY_DAY) AS totalprice, dr.RSV_DATE ,u.USER_PHONE,u.user_name  \r\n"
					+ "FROM DELETE_RESERVATION dr,ROOM r2 , ACCOMMODATION a ,USERS u \r\n"
					+ "WHERE (dr.ROOM_ID = r2.ROOM_ID AND r2.ACCOMMODATION_ID = a.ACCOMMODATION_ID AND dr.USER_ID = u.USER_ID) AND a.USER_ID = ? ORDER BY D_RSV_NO DESC");
			pst.setString(1, user_id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				rsvList.add(makeRsv6(rs));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
	
		
		return rsvList;
		
	}
	
	
	public ReservationDTO rsvDeleteDetailHost(int d_rsv_no) {
		ReservationDTO rsv = new ReservationDTO();
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("SELECT  dr.D_RSV_NO , u.USER_NAME ,u.USER_PHONE, a.ACCOMMODATION_NAME, r2.ROOM_NAME, dr.PERSONNEL,((dr.CHECK_OUT-dr.CHECK_IN)*r2.PRICE_BY_DAY) AS totalprice \r\n"
					+ ",dr.CHECK_IN, dr.CHECK_OUT, dr.RSV_DATE, dr.REQUEST \r\n"
					+ "FROM DELETE_RESERVATION dr  , ROOM r2 , ACCOMMODATION a, USERS u\r\n"
					+ "WHERE(dr.ROOM_ID = r2.ROOM_ID AND r2.ACCOMMODATION_ID = a.ACCOMMODATION_ID AND dr.USER_ID = u.USER_ID) \r\n"
					+ "AND dr.D_RSV_NO   = ? \r\n"
					+ "");
			pst.setInt(1, d_rsv_no);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				rsv.setD_rsv_no(rs.getInt("D_rsv_no"));
				rsv.setUser_name(rs.getString("User_name"));
				rsv.setUser_phone(rs.getString("User_phone"));
				rsv.setAccommodation_name(rs.getString("Accommodation_name"));
				rsv.setRoom_name(rs.getString("Room_name"));
				rsv.setPersonnel(rs.getInt("Personnel"));
				rsv.setTotalprice(rs.getInt("Totalprice"));
				rsv.setCheck_in(rs.getDate("Check_in"));
				rsv.setCheck_out(rs.getDate("Check_out"));
				rsv.setRsv_date(rs.getDate("Rsv_date"));				
				rsv.setRequest(rs.getString("Request"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
	
		
		return rsv;
	}
	
	//reservation list(user)
	public List<ReservationDTO> rsvAll(String user_id){
		List<ReservationDTO> rsvList = new ArrayList<>();
		conn = DBUtil.getConnection();
		
		//select * from reservation order by desc
		try {
			pst = conn.prepareStatement("SELECT r.RSV_NO, r.room_id, a.ACCOMMODATION_NAME, r2.ROOM_NAME , r.CHECK_IN ,r.CHECK_OUT , r.RSV_DATE ,((r.CHECK_OUT-r.CHECK_IN)*r2.PRICE_BY_DAY) AS totalprice, r.rsv_status \r\n"
					+ "FROM RESERVATION r ,ROOM r2 , ACCOMMODATION a \r\n"
					+ "WHERE r.ROOM_ID = r2.ROOM_ID AND r2.ACCOMMODATION_ID = a.ACCOMMODATION_ID AND r.USER_ID = ? ORDER BY rsv_no DESC ");
			pst.setString(1, user_id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				rsvList.add(makeRsv(rs));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
	
		
		return rsvList;
		
	}
	
	//reservation detail(user)
	public ReservationDTO selectByRsvNo(int rsv_no) {
		ReservationDTO rsv = null;
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("SELECT r.*, r2.ROOM_NAME, ((r.CHECK_OUT-r.CHECK_IN)*r2.PRICE_BY_DAY) AS totalprice, a.ACCOMMODATION_NAME ,a.PHONE, a.address \r\n"
					+ "FROM RESERVATION r, ROOM r2 , ACCOMMODATION a \r\n"
					+ "WHERE(r.ROOM_ID = r2.ROOM_ID AND r2.ACCOMMODATION_ID = a.ACCOMMODATION_ID) AND r.RSV_NO = ?");
			pst.setInt(1, rsv_no);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				rsv = makeRsv2(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
	
		
		return rsv;
	}
	
	//reservation success after detail
	public int insertAfterRsv(String user_id) {
		int rsvNo = 0;
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("select max(rsv_no) from reservation where user_id = ?");
			pst.setString(1, user_id);
			rs = pst.executeQuery();		
			while(rs.next()) {
				rsvNo = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
	
		
		return rsvNo;
	}
	
	//reservation list(host)
	public List<ReservationDTO> hostRsvAll(String user_id) {
		List<ReservationDTO> hostRsvList = new ArrayList<>();
		
		conn = DBUtil.getConnection();

		// select * from reservation order by desc
		try {
			pst = conn.prepareStatement(
					"SELECT  r.RSV_NO, r.PERSONNEL, r.CHECK_IN, r.CHECK_OUT, u.USER_PHONE \r\n"
					+ "FROM RESERVATION r , ROOM r2 , ACCOMMODATION a, USERS u \r\n"
					+ "WHERE(r.ROOM_ID = r2.ROOM_ID AND r2.ACCOMMODATION_ID = a.ACCOMMODATION_ID AND r.USER_ID = u.USER_ID) AND a.USER_ID = ?\r\n"
					+ "ORDER BY r.RSV_DATE DESC ");
			pst.setString(1, user_id);
			rs = pst.executeQuery();

			while (rs.next()) {
				hostRsvList.add(makeRsv3(rs));
			}
		} catch (

		SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}

		return hostRsvList;

	}
	
	//reservation detail(host)
	public ReservationDTO selectByHostRsvNo(int rsv_no) {
		ReservationDTO rsv = null;
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("SELECT  r.RSV_NO, u.USER_NAME ,u.USER_PHONE, a.ACCOMMODATION_NAME, r2.ROOM_NAME,r.PERSONNEL, r.CHECK_IN, r.CHECK_OUT, r.RSV_DATE, r.rsv_status , r.REQUEST \r\n"
					+ "FROM RESERVATION r , ROOM r2 , ACCOMMODATION a, USERS u \r\n"
					+ "WHERE(r.ROOM_ID = r2.ROOM_ID AND r2.ACCOMMODATION_ID = a.ACCOMMODATION_ID AND r.USER_ID = u.USER_ID) AND r.RSV_NO  = ?");
			pst.setInt(1, rsv_no);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				rsv = makeRsv4(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
	
		
		return rsv;
	}
	
	
	//accommodation, room information
	public ReservationDTO selectByRoomId(int room_id) {
		ReservationDTO rsv = new ReservationDTO();
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("SELECT r.ROOM_NAME , a.ACCOMMODATION_NAME ,r.price_by_day , r.MIN_PERSONNEL ,r.MAX_PERSONNEL, r.MIN_DAY ,r.MAX_DAY\r\n"
					+ "FROM ROOM r , ACCOMMODATION a\r\n"
					+ "WHERE r.ACCOMMODATION_ID  = a.ACCOMMODATION_ID AND r.ROOM_ID = ?");
			pst.setInt(1, room_id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				rsv.setRoom_name(rs.getString("Room_name"));
				rsv.setAccommodation_name(rs.getString("Accommodation_name"));
				rsv.setMin_personnel(rs.getInt("Min_personnel"));
				rsv.setMax_personnel(rs.getInt("Max_personnel"));
				rsv.setPrice_by_day(rs.getInt("Price_by_day"));
				rsv.setMin_day(rs.getInt("Min_day"));
				rsv.setMax_day(rs.getInt("Max_day"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
	
		
		return rsv;
	}
	
	//scheduled date
	public List<ReservationDTO> selectByCheckInOut(int room_id) {
		List<ReservationDTO> rsvlist = new ArrayList<>();
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("SELECT CHECK_IN , CHECK_OUT \r\n"
					+ "FROM RESERVATION\r\n"
					+ "WHERE ROOM_ID = ?");
			pst.setInt(1, room_id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				rsvlist.add(makeRsv5(rs));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
	
		
		return rsvlist;
	}
	public int deleteAll(String userid) {
		conn = DBUtil.getConnection();
		int ret = 0;
		try {
			pst = conn.prepareStatement(SQL_DELETE_ALL);
			pst.setString(1, userid);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return ret;
	}
	public int ddAll(String userid) {
		conn = DBUtil.getConnection();
		int ret = 0;
		try {
			pst = conn.prepareStatement(SQL_DD_ALL);
			pst.setString(1, userid);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return ret;
	}
	private ReservationDTO makeRsv5(ResultSet rs) throws SQLException {
		ReservationDTO rsv = new ReservationDTO();
		rsv.setCheck_in(rs.getDate("Check_in"));
		rsv.setCheck_out(rs.getDate("Check_out"));
		return rsv;
	}




	private ReservationDTO makeRsv(ResultSet rs) throws SQLException {
		ReservationDTO rsv = new ReservationDTO();
		rsv.setRsv_no(rs.getInt("Rsv_no"));
		rsv.setAccommodation_name(rs.getString("Accommodation_name"));
		rsv.setRoom_name(rs.getString("Room_name"));
		rsv.setCheck_in(rs.getDate("Check_in"));
		rsv.setCheck_out(rs.getDate("Check_out"));
		rsv.setRsv_date(rs.getDate("Rsv_date"));
		rsv.setTotalprice(rs.getInt("Totalprice"));
		rsv.setRsv_status(rs.getString("Rsv_status"));	
		rsv.setRoom_id(rs.getInt("room_id"));
		rsv.setRsv_status(rs.getString("Rsv_status"));				

		return rsv;
	}
	
	private ReservationDTO makeRsv2(ResultSet rs) throws SQLException {
		ReservationDTO rsv = new ReservationDTO();
		rsv.setRsv_no(rs.getInt("Rsv_no"));
		rsv.setUser_id(rs.getString("User_id"));
		rsv.setRoom_id(rs.getInt("Room_id"));
		rsv.setCheck_in(rs.getDate("Check_in"));
		rsv.setCheck_out(rs.getDate("Check_out"));
		rsv.setRsv_date(rs.getDate("Rsv_date"));
		rsv.setPersonnel(rs.getInt("Personnel"));
		rsv.setRequest(rs.getString("Request"));
		rsv.setRsv_status(rs.getString("Rsv_status"));
		
		rsv.setTotalprice(rs.getInt("Totalprice"));
		rsv.setAccommodation_name(rs.getString("Accommodation_name"));
		rsv.setPhone(rs.getString("Phone"));
		rsv.setRoom_name(rs.getString("Room_name"));
		rsv.setAddress(rs.getString("Address"));
		

		System.out.println(rsv);
		return rsv;
	}
	
	private ReservationDTO makeRsv3(ResultSet rs) throws SQLException {
		ReservationDTO rsv = new ReservationDTO();
		rsv.setRsv_no(rs.getInt("Rsv_no"));
		rsv.setCheck_in(rs.getDate("Check_in"));
		rsv.setCheck_out(rs.getDate("Check_out"));		
		rsv.setPersonnel(rs.getInt("Personnel"));
		rsv.setUser_phone(rs.getString("User_phone"));
		System.out.println(rsv);
		return rsv;
	}
	
	private ReservationDTO makeRsv4(ResultSet rs) throws SQLException {
		ReservationDTO rsv = new ReservationDTO();
		rsv.setRsv_no(rs.getInt("Rsv_no"));
		rsv.setUser_name(rs.getString("User_name"));
		rsv.setUser_phone(rs.getString("User_phone"));
		rsv.setAccommodation_name(rs.getString("Accommodation_name"));
		rsv.setRoom_name(rs.getString("Room_name"));
		rsv.setPersonnel(rs.getInt("Personnel"));
		rsv.setCheck_in(rs.getDate("Check_in"));
		rsv.setCheck_out(rs.getDate("Check_out"));
		rsv.setRsv_date(rs.getDate("Rsv_date"));
		rsv.setRsv_status(rs.getString("Rsv_status"));
		rsv.setRequest(rs.getString("Request"));
		
		System.out.println(rsv);
		return rsv;
	}

	private ReservationDTO makeRsv6(ResultSet rs) throws SQLException {
		ReservationDTO rsv = new ReservationDTO();
		rsv.setD_rsv_no(rs.getInt("D_rsv_no"));
		rsv.setAccommodation_name(rs.getString("Accommodation_name"));
		rsv.setRoom_name(rs.getString("Room_name"));
		rsv.setCheck_in(rs.getDate("Check_in"));
		rsv.setCheck_out(rs.getDate("Check_out"));
		rsv.setRsv_date(rs.getDate("Rsv_date"));
		rsv.setTotalprice(rs.getInt("Totalprice"));	
		rsv.setUser_phone(rs.getString("User_phone"));
		rsv.setUser_name(rs.getString("User_name"));
		return rsv;
	}

}
