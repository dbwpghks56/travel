package travel.controller;

import javax.servlet.http.HttpServletRequest;

import travel.model.ReservationService;

public class RsvDeleteController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		String path = request.getContextPath();
		
		int rsvNo = Integer.parseInt(request.getParameter("rsv_no"));
		
		ReservationService service = new ReservationService();
		int result = service.rsvDelete(rsvNo);
		request.setAttribute("message", result>0?"성공":"실패");
		return "/reservation/result.jsp";
	}

}
