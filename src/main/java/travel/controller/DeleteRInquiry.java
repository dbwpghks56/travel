package travel.controller;

import javax.servlet.http.HttpServletRequest;

import travel.model.Room_InquiryService;

public class DeleteRInquiry implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		Room_InquiryService riservice = new Room_InquiryService();
		
		int r_id = Integer.parseInt(request.getParameter("r_id"));
		
		int result = riservice.deleteInquiry(r_id);
		
		return "rest:" + result;
	}

}
