package travel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.UserDTO;
import travel.model.UserService;

public class LoginUserController implements Command {

	@Override
	public String execute(HttpServletRequest request) { //테스트2
		UserService service = new UserService();
		
		String kakao_email = request.getParameter("email");
		String kakao_nick = request.getParameter("nick");
		String kakao_profile = request.getParameter("profile");
		
		String user_id = request.getParameter("id");
		String user_pass = request.getParameter("password");
		
		UserDTO user = new UserDTO();
		
		if(kakao_email == null || kakao_email == "") {
			System.out.println(kakao_email);
			user = service.loginUser(user_id, user_pass);
		}
		
		else {
			user = service.loginKakaoUser(kakao_email);
			
			if(user.getUser_id().equals(null)) {
				return "signUp.jsp";
			}
		}
		
		HttpSession session = request.getSession();
		
		session.setAttribute("user", user);
		
		return "confirmlogin.jsp";
	}

}
