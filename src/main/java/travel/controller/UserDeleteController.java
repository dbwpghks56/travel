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

		String id = request.getParameter("id");
		String pass = request.getParameter("password");
		
		System.out.println("user" + user);
		
		if(user.getUser_id().equals(id) && user.getUser_pass().equals(pass)) {
			
			result = service.userDelete(id , pass);
			
			String message = "아이디와 비밀번호를 다시 확인 해 주세요."; 
			if(result == 1) message = "탈퇴완료";
			request.setAttribute("message", message);
		}
			
		
		return "confirmUserDelete.jsp";
		
	}

}
