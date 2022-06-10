package travel.model;

import java.util.List;
import java.util.Map;

import travel.DTO.ReviewDto;

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
	
}
