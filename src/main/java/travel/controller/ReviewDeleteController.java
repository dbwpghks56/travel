package travel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.UserDTO;
import travel.model.ReviewService;
import travel.model.UserService;

public class ReviewDeleteController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		 return "/travel/review/deleteReview.jsp";
	}

	

}
