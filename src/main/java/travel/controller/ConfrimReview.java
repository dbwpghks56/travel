package travel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.UserDTO;
import travel.model.ReviewService;

public class ConfrimReview implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		ReviewService rservice = new ReviewService();
		HttpSession session = request.getSession();
		
		
		List<String> users = rservice.confirmReview(Integer.parseInt(request.getParameter("rsv_no")));
		
		UserDTO user = (UserDTO)session.getAttribute("user");
		
		int result = (users.contains(user.getUser_id()) ? 1 : 0);
		
		return "rest:" + result;
	}

}
