package travel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.UserDTO;
import travel.model.UserService;

public class UserDeleteController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		UserService service = new UserService();
		int result = 0;
		
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("user");

		String pass = request.getParameter("user_pass");
		String id = request.getParameter("user_id");
		
		
		if(user.getUser_id().equals(id) && user.getUser_pass().equals(pass)) {
			
			result = service.userDelete(id , pass );
			
		}
			
		String message = "등록실패"; 
		if(result == 0) message = "등록완료";
		request.setAttribute("message", message);

		/*
		 * int resultPass = service.userDelete(pass); System.out.println(user); int
		 * result = service.userDelete(pass , user.getUser_id());
		 * 
		 * 
		 */

		
		return "confirmUserDelete.jsp";
		
	}

}
