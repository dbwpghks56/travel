package travel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.UserDTO;
import travel.model.UserService;

public class ReviewDeleteController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		UserService service = new UserService();
		int result = 0;
		
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("user");

		if(user.getUser_id().equals("Admin") && user.getUser_pass().equals("manager")){
			
			//int review = request.getParameter("review_id");
		}
		String id = request.getParameter("id");
		String pass = request.getParameter("password");
		
		
		return null;
	}

}
