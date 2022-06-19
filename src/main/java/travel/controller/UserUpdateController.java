package travel.controller;

import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.UserDTO;
import travel.model.UserService;
import travel.util.DateUtil;

public class UserUpdateController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		
		if(request.getMethod().equals("GET")) {
			return "updateUser.jsp";
		}
		 
		
		int result = 0;
		
		UserService service = new UserService();
		HttpSession session = request.getSession();
		UserDTO userSession = (UserDTO) session.getAttribute("user");

		
		
		UserDTO user = new UserDTO();

		String pass = request.getParameter("password");
		String email = request.getParameter("email");
		String nick = request.getParameter("nickname");
		String phone = request.getParameter("phone");
		String date = request.getParameter("birth");
		String favorite = request.getParameter("favorite");
		String photos = request.getParameter("photos");
		int host = Integer.parseInt(request.getParameter("host"));

		user.setUser_pass(pass);
		user.setUser_email(email);
		user.setU_image_path(photos);
		user.setNickname(nick);
		user.setUser_phone(phone);
		System.out.println(date);
		user.setBirth(DateUtil.convertToDate(date));
		user.setFavorite(favorite);
		user.setHost(host);
		
		result = service.updateUser(user, userSession.getUser_id());
		session.setAttribute("user", user);
		
	   if (user.getHost() == 1){
		   return "/user/myPageHost.jsp";
		   
	   }
		return "/user/myPageUser.jsp";
	}
		 
	 
	}

 	 

