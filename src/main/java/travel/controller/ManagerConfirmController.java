package travel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.UserDTO;
import travel.model.ReviewService;
import travel.model.UserService;

public class ManagerConfirmController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		UserService service = new UserService();
		
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("user");
		
		return "/travel/review/listReview.jsp";
		
		
	}

}
