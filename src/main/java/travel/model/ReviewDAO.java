package travel.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



import travel.DTO.ReviewDto;
import travel.util.DBUtil;

public class ReviewDAO {
	private static final String SQL_SELECT_BY_ACCOID = "select * from review\r\n"
			+ "join users using(user_id)\r\n"
			+ "where accommodation_id = ?";
	private static final String SQL_UPDATE_REPORT = "update review set report = report+1 where review_id = ?";
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	int result = 0;
	
	public int insertReview(ReviewDto review) {
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement("insert into review values(seq_review.nextval, ?, ?, ?, ?, ?, ?, 0, ?, sysdate)");
			pst.setInt(1, review.getAccommodation_id());
			pst.setString(2, review.getUser_id());
			pst.setString(3, review.getContent());
			pst.setFloat(4, review.getCleaning_stars());
			pst.setFloat(5, review.getLocation_stars());
			pst.setFloat(6, review.getSatisfied_stars());
			pst.setString(7, review.getR_image_path());
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return result;
	}
	
	public List<ReviewDto> selectAllReview() {
		conn = DBUtil.getConnection();
		List<ReviewDto> reviews = new ArrayList<>();
		
		try {
			pst = conn.prepareStatement("select r.*, a.user_id as host_id from review r, accommodation a where r.accommodation_id = a.accommodation_id");
			
			rs = pst.executeQuery();
			
			while(rs.next()) {
				ReviewDto review = makeReview(rs);
				reviews.add(review);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return reviews;
	}
	
	public List<ReviewDto> selectUseridReview(String user_id) {
		conn = DBUtil.getConnection();
		List<ReviewDto> reviews = new ArrayList<>();
		
		try {
			pst = conn.prepareStatement("select r.*, a.user_id as host_id from review r, accommodation a where r.accommodation_id = a.accommodation_id"
					+ " and r.user_id = ?");
			pst.setString(1, user_id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				ReviewDto review = makeReview(rs);
				reviews.add(review);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return reviews;
	}
	
	public List<ReviewDto> selectHostidReview(String user_id) {
		conn = DBUtil.getConnection();
		List<ReviewDto> reviews = new ArrayList<>();
		
		try {
			pst = conn.prepareStatement("select r.*, a.user_id as host_id from review r, accommodation a where r.accommodation_id = a.accommodation_id"
					+ " and a.user_id = ?");
			pst.setString(1, user_id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				ReviewDto review = makeReview(rs);
				reviews.add(review);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return reviews;
	}
	public List<Map<String, String>> selectByAcco(int accoId){
		conn = DBUtil.getConnection();
		List<Map<String, String>> rlist = new ArrayList<>();
		
		try {
			pst = conn.prepareStatement(SQL_SELECT_BY_ACCOID);
			pst.setInt(1, accoId);
			rs = pst.executeQuery();
			rs.next();
			while(rs.next()) {
				Map<String, String> rMap = makeMap(rs);
				rlist.add(rMap);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return rlist;
	}
	public int updateReport(int review_id) {
		conn = DBUtil.getConnection();
		int ret = 0;
		
		try {
			pst = conn.prepareStatement(SQL_UPDATE_REPORT);
			pst.setInt(1, review_id);
			ret = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, pst, conn);
		}
		
		return ret;
	}

	private ReviewDto makeReview(ResultSet rs2) throws SQLException {
		ReviewDto review = new ReviewDto();
		
		review.setReview_id(rs2.getInt("review_id"));
		review.setAccommodation_id(rs2.getInt("accommodation_id"));
		review.setUser_id(rs2.getString("user_id"));
		review.setContent(rs2.getString("content"));
		review.setCleaning_stars(rs2.getFloat("cleaning_stars"));
		review.setLocation_stars(rs2.getFloat("LOCATION_STARTS"));
		review.setSatisfied_stars(rs2.getFloat("satisfied_stars"));
		review.setReport_number(rs2.getInt("report"));
		review.setR_image_path(rs2.getString("r_image_path"));
		review.setR_regdate(rs2.getDate("r_regdate"));
		return review;
	}
	private Map<String,String> makeMap(ResultSet rs2) {
		Map<String,String> rMap = new HashMap<>();
		try {
			rMap.put("review_id",rs2.getString("review_id"));
			rMap.put("accommodation_id",rs2.getString("accommodation_id"));
			rMap.put("nick_name",rs2.getString("nickname"));
			rMap.put("content",rs2.getString("content"));
			rMap.put("report",rs2.getString("report"));
			rMap.put("r_image_path",rs2.getString("r_image_path"));
			rMap.put("r_regdate",rs2.getString("r_regdate"));
			rMap.put("nick_name",rs2.getString("nickname"));
			rMap.put("u_image_path",rs2.getString("u_image_path"));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rMap;
	}
	//후기 삭제
	public int reviewDelete(int review_id) {
		int result =0;
		conn = DBUtil.getConnection();
		 try {
				pst = conn.prepareStatement("DELETE FROM REVIEW WHERE REVIEW_ID = ?");     
				pst.setInt(1, review_id); 
				
				
				result = pst.executeUpdate();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.dbClose(rs, pst, conn);
			}
			
		return result; 
	}
	
}












