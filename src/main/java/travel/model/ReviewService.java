package travel.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import travel.DTO.ReviewDto;
import travel.util.DBUtil;

public class ReviewService {
	ReviewDAO reviewdao = new ReviewDAO();
	
	public int insertReview(ReviewDto review) {
		return reviewdao.insertReview(review);
	}
	
	public List<ReviewDto> selectAllReview() {
		return reviewdao.selectAllReview();
	}
	
	public List<ReviewDto> selectUseridReview(String user_id) {
		return reviewdao.selectUseridReview(user_id);
	}
	
	public List<ReviewDto> selectHostidReview(String host_id) {
		return reviewdao.selectHostidReview(host_id);
	}
	public List<Map<String, String>> selectByAcco(int accoId){
		return reviewdao.selectByAcco(accoId);
	}
	public int updateReport(int review_id) {
		return reviewdao.updateReport(review_id);
	}
	public int reviewDelete(int review_id) {
		return reviewdao.reviewDelete(review_id);
	}
	public int updateReportUser(int review_id, String user_id) {
		return reviewdao.updateReportUser(review_id, user_id);
	}
	public List<String> confirmReview(int rsv_no) {
		return reviewdao.confirmReview(rsv_no);
	}
	public int selectNumber(int accoId) {
		return reviewdao.selectNumber(accoId);
	}
	
}
