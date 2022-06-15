package travel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.model.SiteInquiryService;

public class InsertSInquiryController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String uId = (String) session.getAttribute("user_id");
		String comment = request.getParameter("comment");
		
		SiteInquiryService sService = new SiteInquiryService();
		int ret = sService.insertInquiry(uId, comment);
		
		return "rest:"+ret;
	}

}
