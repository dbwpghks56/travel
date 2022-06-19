package travel.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.UserDTO;
import travel.model.ReviewService;

public class updateReportController implements Command{

	
	@Override
	public String execute(HttpServletRequest request) {
		int rId = Integer.parseInt(request.getParameter("rId"));
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		ReviewService rService = new ReviewService();
		int result = rService.updateReport(rId)==0? 0:1;
		result = rService.updateReportUser(rId, user_id)==0? 0:1;
		return "rest:"+result;
	}

	
}
