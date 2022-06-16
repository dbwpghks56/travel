package travel.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import travel.DTO.Room_InquiryDto;
import travel.util.DBUtil;

public class Room_InquiryDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	
	int result = 0;
	
	public int insertRinquiry(Room_InquiryDto rinquiry) {
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("insert into room_inquiry values(seq_rinquiry.nextval, ?, ?, ?, ?, ?, ?, 0, sysdate)");
			
			pst.setInt(1, rinquiry.getAccommodation_id());
			pst.setString(2, rinquiry.getUser_id());
			pst.setString(3, rinquiry.getTitle());
			pst.setString(4, rinquiry.getContent());
			pst.setString(5, rinquiry.getI_password());
			pst.setString(6, rinquiry.getAnswer());
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return result;
	}
	
	public List<Room_InquiryDto> selectAllRinquiry() {
		List<Room_InquiryDto> rinquirylist = new ArrayList<>();
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("select ri.*, a.user_id as host_id from room_inquiry ri, accommodation a "
					+ "where ri.accommodation_id = a.accommodation_id");
			
			rs = pst.executeQuery();
			
			while(rs.next()) {
				rinquirylist.add(makeRinquiry(rs));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return rinquirylist;
	}
	
	public List<Room_InquiryDto> selectAccoRinquiry(String acco_id) {
		List<Room_InquiryDto> rinquirylist = new ArrayList<>();
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("select * from room_inquiry where accommodation_id = ?");
			pst.setString(1, acco_id);
			
			rs = pst.executeQuery();
			
			while(rs.next()) {
				rinquirylist.add(makeRinquiry(rs));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return rinquirylist;
	}
	public List<Room_InquiryDto> selectUserRinquiry(String user_id) {
		List<Room_InquiryDto> rinquirylist = new ArrayList<>();
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("select ri.*, a.user_id as host_id from room_inquiry ri, accommodation a where ri.accommodation_id = a.accommodation_id and ri.user_id = ? and answer_confirm = 0");
			
			pst.setString(1, user_id);
			
			rs = pst.executeQuery();
			
			while(rs.next()) {
				rinquirylist.add(makeRinquiry(rs));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return rinquirylist;
	}
	
	public List<Room_InquiryDto> selectAUserRinquiry(String user_id) {
		List<Room_InquiryDto> rinquirylist = new ArrayList<>();
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("select ri.*, a.user_id as host_id from room_inquiry ri, accommodation a where ri.accommodation_id = a.accommodation_id and ri.user_id = ? and answer_confirm = 1");
			
			pst.setString(1, user_id);
			
			rs = pst.executeQuery();
			
			while(rs.next()) {
				rinquirylist.add(makeRinquiry(rs));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return rinquirylist;
	}
	
	public List<Room_InquiryDto> selectHostRinquiry(String host_id) {
		List<Room_InquiryDto> rinquirylist = new ArrayList<>();
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("select * from room_inquiry where ACCOMMODATION_ID in (select ACCOMMODATION_ID from accommodation where "
					+ "user_id = ?)");
			pst.setString(1, host_id);
			
			rs = pst.executeQuery();
			
			while(rs.next()) {
				rinquirylist.add(makeRinquiry2(rs));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return rinquirylist;
	}
	
	private Room_InquiryDto makeRinquiry2(ResultSet rs2) throws SQLException {
		Room_InquiryDto rinquiry = new Room_InquiryDto();
		
		rinquiry.setR_inquiry_id(rs2.getInt("r_inquiry_id"));
		rinquiry.setAccommodation_id(rs2.getInt("accommodation_id"));
		rinquiry.setUser_id(rs2.getString("user_id"));
		rinquiry.setTitle(rs2.getString("title"));
		rinquiry.setContent(rs2.getString("content"));
		rinquiry.setI_password(rs2.getString("i_password"));
		rinquiry.setAnswer(rs2.getString("answer"));
		rinquiry.setAnswer_confirm(rs2.getInt("answer_confirm"));
		rinquiry.setRi_regdate(rs2.getDate("ri_regdate"));
		
		return rinquiry;
	}

	public List<Room_InquiryDto> selectAnswerRinquiry(int a_confirm, String user_id) {
		List<Room_InquiryDto> rinquirylist = new ArrayList<>();
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("select * from room_inquiry where ANSWER_CONFIRM = ? and user_id = ?");
			pst.setInt(1, a_confirm);
			pst.setString(2, user_id);
			
			rs = pst.executeQuery();
			
			while(rs.next()) {
				rinquirylist.add(makeRinquiry(rs));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return rinquirylist;
	}
	
	public int insertAnswerInquiry(int inquiry_id, String answer) {
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("update room_inquiry set answer = ?, answer_confirm = 1 where r_inquiry_id = ?");
			
			pst.setString(1, answer);
			pst.setInt(2, inquiry_id);
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	public int deleteInquiry(int inquiry_id) {
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("delete from room_inquiry where r_inquiry_id = ?");
			
			pst.setInt(1, inquiry_id);
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}

	private Room_InquiryDto makeRinquiry(ResultSet rs2) throws SQLException {
		Room_InquiryDto rinquiry = new Room_InquiryDto();
		
		rinquiry.setR_inquiry_id(rs2.getInt("r_inquiry_id"));
		rinquiry.setAccommodation_id(rs2.getInt("accommodation_id"));
		rinquiry.setUser_id(rs2.getString("user_id"));
		rinquiry.setTitle(rs2.getString("title"));
		rinquiry.setContent(rs2.getString("content"));
		rinquiry.setI_password(rs2.getString("i_password"));
		rinquiry.setAnswer(rs2.getString("answer"));
		rinquiry.setHost_id(rs2.getString("host_id"));
		rinquiry.setAnswer_confirm(rs2.getInt("answer_confirm"));
		rinquiry.setRi_regdate(rs2.getDate("ri_regdate"));
		
		return rinquiry;
	}
}













