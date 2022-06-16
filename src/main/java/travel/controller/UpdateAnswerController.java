package travel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.model.SiteInquiryService;

public class UpdateAnswerController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		int iId = Integer.parseInt(request.getParameter("iId"));
		String answer = request.getParameter("answer");
		HttpSession session = request.getSession();
		String mgrId = (String) session.getAttribute("user_id");
		
		SiteInquiryService sService = new SiteInquiryService();
		int ret  = sService.updateAnswer(iId, answer, mgrId);
		return "rest:"+ret;
	}

}
