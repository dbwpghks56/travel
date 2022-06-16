package travel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class DeleteSessionUser implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		String path = request.getContextPath();
		HttpSession session = request.getSession();
		
		session.removeAttribute("user");
		session.removeAttribute("user_id");
		
		return "redirect:/travel/index.jsp";
	}

}
