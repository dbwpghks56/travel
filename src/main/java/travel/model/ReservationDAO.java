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

	Connection conn;
	Statement st;
	PreparedStatement pst;
	ResultSet rs;
	int result;

	//예약하기
	public int resevation(ReservationDTO rsv) {
		result = 0;
		conn = DBUtil.getConnection();
		
		//insert into RESERVATION values(rsv_no, user_id, room_id, check_in, check_out, rsv_date, personnel, request, rsv_status);
		try {
			pst = conn.prepareStatement("insert into reservation values(seq_rsv.nextval, ?, ?, ?, ?, sysdate, ?, ?, ?)");
			pst.setString(1, rsv.getUsre_id());
			pst.setInt(2, rsv.getRoom_id());
			pst.setDate(3, rsv.getCheck_in());
			pst.setDate(4, rsv.getCheck_out());
			pst.setInt(5, rsv.getPersonnel());
			pst.setString(6, rsv.getRequest());
			pst.setString(7, rsv.getRsv_status());

			result = pst.executeUpdate(); 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return result;
	}
	
	//예약 수정하기
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
	
	//예약취소하기
	public int rsvDelete(int rsv_no) {
		result = 0;
		conn = DBUtil.getConnection();
		try {
			//delete from reservation where rsv_no = ?;
			pst = conn.prepareStatement("delete from reservation where rsv_no = ?");
			pst.setInt(1, rsv_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return result;
		
	}
	
	
	
	//예약 전체 조회하기(최근 예약순으로) //select문 수정 해야함
	public List<ReservationDTO> rsvAll(){
		List<ReservationDTO> rsvList = new ArrayList<>();
		conn = DBUtil.getConnection();
		
		//select * from reservation order by desc
		try {
			st = conn.createStatement();
			rs = st.executeQuery("select * from reservation order by desc");
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

	private ReservationDTO makeRsv(ResultSet rs) throws SQLException {
		ReservationDTO rsv = new ReservationDTO();
		rsv.setRsv_no(rs.getInt("Rsv_no"));
		rsv.setUsre_id(rs.getString("Usre_id"));
		rsv.setRoom_id(rs.getInt("Room_id"));
		rsv.setCheck_in(rs.getDate("Check_in"));
		rsv.setCheck_out(rs.getDate("Check_out"));
		rsv.setRsv_date(rs.getDate("Rsv_date"));
		rsv.setPersonnel(rs.getInt("Personnel"));
		rsv.setRequest(rs.getString("Personnel"));
		rsv.setRsv_status(rs.getString("Rsv_status"));
		return rsv;
	}
}
