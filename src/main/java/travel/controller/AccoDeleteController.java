package travel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.model.AccommodationService;
import travel.model.ReservationService;

public class AccoDeleteController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		int accoId = Integer.parseInt(request.getParameter("accommodation_id"));
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		AccommodationService service = new AccommodationService();
		int result = service.accoDelete(user_id, accoId)==0? 0:1;
		
		return "rest:"+result;
	}

}
