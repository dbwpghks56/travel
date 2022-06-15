package travel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.ReviewDto;
import travel.DTO.UserDTO;
import travel.model.ReviewService;
import travel.util.UploadFileHelper;

public class InsertReview implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		String path = request.getContextPath();
		ReviewService reviewservice = new ReviewService();
		
		ReviewDto review = makeReview(request);
		
		int result = reviewservice.insertReview(review);
		
		request.setAttribute("review_result", result > 0 ? "성공" : "실패");
		
		return "rest:" + result;
	}

	private ReviewDto makeReview(HttpServletRequest request) {
		ReviewDto review = new ReviewDto();

		review.setAccommodation_id(Integer.parseInt(request.getParameter("room_id")));
		review.setUser_id(request.getParameter("user_id"));
		review.setContent(request.getParameter("content"));
		review.setCleaning_stars(Float.parseFloat(request.getParameter("clean")));
		review.setLocation_stars(Float.parseFloat(request.getParameter("location")));
		review.setSatisfied_stars(Float.parseFloat(request.getParameter("sati")));
		review.setRsv_no(Integer.parseInt(request.getParameter("rsv_no")));
		
		return review;
	}

}






