package travel.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import travel.DTO.ReviewDto;
import travel.model.ReviewService;
import travel.model.UserService;

public class ListReview implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		ReviewService rservice = new ReviewService();
		UserService uservice = new UserService();
		List<ReviewDto> reviews = rservice.selectAllReview();
		List<String> nicks = new ArrayList<>();
		
		for(ReviewDto review : reviews) {
			nicks.add(uservice.nickToId(review.getUser_id()));
		}
		
		
		request.setAttribute("reviews", reviews);
		request.setAttribute("nicks", nicks);
		
		return "/review/listReview.jsp";
	}

}
