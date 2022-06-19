package travel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.UserDTO;
import travel.model.UserService;

public class LoginUserController implements Command {

	@Override
	public String execute(HttpServletRequest request) { //�뀒�뒪�듃2
		
		
	  if(request.getMethod().equals("GET")) {
		  
		  return "/user/login.jsp";
	  }
		
		
		UserService service = new UserService();
		
		String kakao_email = request.getParameter("email");
		String kakao_nick = request.getParameter("nick");
		String kakao_profile = request.getParameter("profile");
		
		String user_id = request.getParameter("id");
		String user_pass = request.getParameter("password");
		HttpSession session = request.getSession();
		UserDTO user = null;
		
		if(kakao_email.equals(null) || kakao_email.equals("")) {
			user = service.loginUser(user_id, user_pass);
			session.setAttribute("user", user);
			session.setAttribute("user_id", user_id);
		}
		
		else {
			user = service.loginKakaoUser(kakao_email);
			session.setAttribute("user", user);
			session.setAttribute("user_id", user_id);
			if(user == null) {
				request.setAttribute("email", kakao_email);
				request.setAttribute("nick", kakao_nick);
				request.setAttribute("kakao_profile", kakao_profile);
				return "signUp.jsp";
			}
		}
		
		return "redirect:/travel/index.jsp";
	}

}
