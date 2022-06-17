package travel.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.ReviewDto;
import travel.model.ReviewService;
import travel.model.UserService;

public class ListReview implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ReviewService rservice = new ReviewService();
		UserService uservice = new UserService();
		String user_id = (String) session.getAttribute("user_id");
		
		List<ReviewDto> reviews = rservice.selectUseridReview(user_id);
		List<String> nicks = new ArrayList<>();
		
		for(ReviewDto review : reviews) {
			nicks.add(uservice.nickToId(review.getHost_id()));
		}
		
		
		request.setAttribute("reviews", reviews);
		request.setAttribute("nicks", nicks);
		
		return "/review/listReview.jsp";
	}

}
