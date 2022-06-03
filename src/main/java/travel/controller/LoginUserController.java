package travel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.UserDTO;
import travel.model.UserService;

public class LoginUserController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		UserService service = new UserService();
		
		String user_id = request.getParameter("id");
		String user_pass = request.getParameter("password");
		
		UserDTO user = service.loginUser(user_id, user_pass);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("user", user);
		
		return "confirmlogin.jsp";
	}

}
