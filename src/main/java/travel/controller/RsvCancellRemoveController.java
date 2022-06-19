package travel.controller;

import javax.servlet.http.HttpServletRequest;

import travel.model.ReservationService;

public class RsvCancellRemoveController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		int dRsvNo = Integer.parseInt(request.getParameter("d_rsv_no"));
		
		ReservationService service = new ReservationService();
		int result = service.dRsvNoDelete(dRsvNo);
		request.setAttribute("message", result>0?"성공":"실패");
		return "/reservation/rsvList.jsp";
	}

}