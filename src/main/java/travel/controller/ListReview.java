package travel.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import travel.DTO.ReviewDto;
import travel.model.ReviewService;

public class ListReview implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		ReviewService rservice = new ReviewService();
		List<ReviewDto> reviews = rservice.selectAllReview();
		
		request.setAttribute("reviews", reviews);
		
		return "listReview.jsp";
	}

}
