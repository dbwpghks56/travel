package travel.controller;

import javax.servlet.http.HttpServletRequest;

import travel.DTO.Room_InquiryDto;
import travel.model.Room_InquiryService;

public class InsertRoomInquiryController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		String path = request.getContextPath();
		Room_InquiryService riservice = new Room_InquiryService();
		
		request.setAttribute("message", riservice.insertRinquiry(makeRi(request)) >0 ? "성공" : "실패");
		
		return "redirect:/travel/accommodation/listRoomInquiry.do";
	}

	private Room_InquiryDto makeRi(HttpServletRequest request) {
		Room_InquiryDto rinquiry = new Room_InquiryDto();
		
		String user_id = request.getParameter("user_id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String pwd = request.getParameter("ri_pass");
		int acco_id = Integer.parseInt(request.getParameter("acco_id"));
		
		rinquiry.setUser_id(user_id);
		rinquiry.setTitle(title);
		rinquiry.setContent(content);
		rinquiry.setI_password(pwd);
		rinquiry.setAccommodation_id(acco_id);
		
		return rinquiry;
	}

}
