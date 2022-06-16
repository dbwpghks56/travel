package travel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.AccommodationDto;
import travel.DTO.ReviewDto;
import travel.DTO.UserDTO;
import travel.model.AccommodationService;
import travel.model.ReviewService;
import travel.util.UploadFileHelper;

public class InsertReview implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		String path = request.getContextPath();
		ReviewService reviewservice = new ReviewService();
		
		ReviewDto review = makeReview(request);
		
		int result = reviewservice.insertReview(review);
		
		request.setAttribute("review_result", result > 0 ? "�꽦怨�" : "�떎�뙣");
		
		
		//accommodation별점 추가하기
		AccommodationService aService = new AccommodationService();
		double cStar = Integer.parseInt(request.getParameter("clean"));
		double lStar = Integer.parseInt(request.getParameter("location"));
		double sStar = Integer.parseInt(request.getParameter("sati"));
		int accoId = aService.roomToAcco(Integer.parseInt(request.getParameter("room_id")));
		int totalNum = reviewservice.selectNumber(accoId);
		
		AccommodationDto acco = aService.selectById(accoId);
		cStar = (acco.getCleaning_star()/totalNum)+(cStar/totalNum);
		lStar = (acco.getLocation_star()/totalNum)+(lStar/totalNum);
		sStar = (acco.getSatisfied_star()/totalNum)+(sStar/totalNum);
		aService.updateStar(cStar, lStar, sStar, accoId);
		
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






