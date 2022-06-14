package travel.controller;

import javax.servlet.http.HttpServletRequest;

import travel.model.ReviewService;

public class ReviewDeleteController implements Command {
	
	
	
	@Override
	public String execute(HttpServletRequest request) {
		
		 String rid = request.getParameter("reviewid");
		 ReviewService service = new ReviewService();
		 service.reviewDelete(Integer.parseInt(rid));
		 //return "redirect:listReview.do";
		 return "/review/redirect:listReview.jsp";
	}

	


}
