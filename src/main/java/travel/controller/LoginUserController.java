package travel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.UserDTO;
import travel.model.UserService;

public class LoginUserController implements Command {

	@Override
	public String execute(HttpServletRequest request) { //�뀒�뒪�듃2
		UserService service = new UserService();
		
		String kakao_email = request.getParameter("email");
		String kakao_nick = request.getParameter("nick");
		String kakao_profile = request.getParameter("profile");
		
		String user_id = request.getParameter("id");
		String user_pass = request.getParameter("password");
		
		UserDTO user = null;
		
		if(kakao_email.equals(null) || kakao_email.equals("")) {
			System.out.println(kakao_email);
			System.out.println("�솗�씤");
			user = service.loginUser(user_id, user_pass);
		}
		
		else {
			user = service.loginKakaoUser(kakao_email);
			System.out.println(kakao_email);
			System.out.println("�솗�씤"+ user);
			if(user == null) {
				request.setAttribute("email", kakao_email);
				request.setAttribute("nick", kakao_nick);
				request.setAttribute("kakao_profile", kakao_profile);
				return "signUp.jsp";
			}
		}
		
		HttpSession session = request.getSession();
		
		session.setAttribute("user", user);
		session.setAttribute("user_id", user_id);
		
		return "../test/fontall.jsp";
	}

}
