package travel.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import travel.DTO.ReviewDto;
import travel.util.DBUtil;

public class ReviewDAO {
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
		review.setHost_id(rs2.getString("host_id"));
		
		return review;
	}
}












