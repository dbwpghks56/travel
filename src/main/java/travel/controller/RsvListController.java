package travel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.UserDTO;
import travel.model.ReservationService;

public class RsvListController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		ReservationService service = new ReservationService();
		HttpSession session = request.getSession();
		String user_id=((UserDTO)session.getAttribute("user")).getUser_id();
		System.out.println(user_id);
		request.setAttribute("rsvlist", service.rsvAll(user_id));
		request.setAttribute("rsvdeletelist", service.rsvDeleteAll(user_id));
		return "rsvList.jsp";
	}

}
