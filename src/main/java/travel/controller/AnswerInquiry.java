package travel.controller;

import javax.servlet.http.HttpServletRequest;

import travel.model.Room_InquiryService;

public class AnswerInquiry implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		Room_InquiryService rservice = new Room_InquiryService();
		
		int inquiry_id = Integer.parseInt(request.getParameter("inquiry_id"));
		String answer = request.getParameter("answer");
		
		int result = rservice.insertAnswerInquiry(inquiry_id, answer);
		
		return "listRoomInquiry.do";
	}

}
