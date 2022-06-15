package travel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.UserDTO;
import travel.model.ReservationService;

public class RsvListHostController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		String path = request.getContextPath();
		ReservationService service = new ReservationService();
		HttpSession session = request.getSession();
		String user_id=((UserDTO)session.getAttribute("user")).getUser_id();
		System.out.println(user_id);
		request.setAttribute("hostrsvlist", service.hostRsvAll(user_id));
		request.setAttribute("hostrsvdeletelist", service.rsvDeleteAllhost(user_id));
		return "/reservation/hostRsvList.jsp";
		//return null;
	}

}
