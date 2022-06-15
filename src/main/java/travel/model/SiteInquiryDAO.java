package travel.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import travel.DTO.ReviewDto;
import travel.DTO.SiteInquiryDTO;
import travel.util.DBUtil;

public class SiteInquiryDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	Statement st = null;
	ResultSet rs = null;
	int result = 0;
	private static final String SQL_SELECT_BY_ID = "select * from site_inquiry where user_id =?";
	private static final String SQL_INSERT_BY_USER = "insert into site_inquiry values(s_seq.nextval,?,?,null,null,0)";
	private static final String SQL_UPDATE_BY_MGR = "update site_inquiry set answer = ?, manager_id = ?, s_answer_confirm=1 where inquiry_id = ?";
	private static final String SQL_SELECT_ALL = "select * from site_inquiry";
	public List<SiteInquiryDTO> selectAllReview(String userId) {
		conn = DBUtil.getConnection();
		List<SiteInquiryDTO> inquirys = new ArrayList<>();
		
		try {
			pst = conn.prepareStatement(SQL_SELECT_BY_ID);
			pst.setString(1, userId);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				SiteInquiryDTO inquiry = makeInquiry(rs);
				inquirys.add(inquiry);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return inquirys;
	}
	public List<SiteInquiryDTO> selectAll() {
		conn = DBUtil.getConnection();
		List<SiteInquiryDTO> inquirys = new ArrayList<>();
		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(SQL_SELECT_ALL);
			
			while(rs.next()) {
				SiteInquiryDTO inquiry = makeInquiry(rs);
				inquirys.add(inquiry);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		
		return inquirys;
	}
	public int insertInquiry(String user_id, String comment) {
		conn = DBUtil.getConnection();
		int ret = 0;
		try {
			pst = conn.prepareStatement(SQL_INSERT_BY_USER);
			pst.setString(1, user_id);
			pst.setString(2, comment);
			
			ret = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return ret;
	}
	public int updateAnswer(SiteInquiryDTO site) {
		conn = DBUtil.getConnection();
		int ret = 0;
		try {
			pst = conn.prepareStatement(SQL_UPDATE_BY_MGR);
			pst.setString(1, site.getAnswer());
			pst.setString(2, site.getManager_id());
			pst.setInt(3, site.getInquiry_id());
			ret = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return ret;
	}
	private SiteInquiryDTO makeInquiry(ResultSet rs2) {
		SiteInquiryDTO inquiry = new SiteInquiryDTO();
		try {
			inquiry.setUser_id(rs2.getString("user_id"));
			inquiry.setContent(rs2.getString("content"));
			inquiry.setInquiry_id(rs2.getInt("inquiry_id"));
			if(rs2.getInt("s_answer_confirm")!=0) {
				inquiry.setAnswer(rs2.getString("answer"));
				inquiry.setManager_id("manager_id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return inquiry;
	}
}
