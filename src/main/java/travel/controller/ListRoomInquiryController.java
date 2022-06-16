package travel.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.ReviewDto;
import travel.DTO.Room_InquiryDto;
import travel.model.Room_InquiryService;
import travel.model.UserService;

public class ListRoomInquiryController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		Room_InquiryService service = new Room_InquiryService();
		UserService uservice = new UserService();
		HttpSession session = request.getSession();
		
		List<Room_InquiryDto> rinquirylist = new ArrayList<>();
		List<Room_InquiryDto> arinquirylist = new ArrayList<>();
		List<Room_InquiryDto> hrinquirylist = new ArrayList<>();
		
		List<String> nicks = new ArrayList<>();
		List<String> anicks = new ArrayList<>();
		List<String> hnicks = new ArrayList<>();
		
		String user_id = (String) session.getAttribute("user_id");
		
		rinquirylist = service.selectUserRinquiry(user_id);
		arinquirylist = service.selectAUserRinquiry(user_id);
		hrinquirylist = service.selectHostRinquiry(user_id);
		
		for(Room_InquiryDto rinquiry : rinquirylist) {
			nicks.add(uservice.nickToId(rinquiry.getHost_id()));
		}
		
		for(Room_InquiryDto rinquiry : arinquirylist) {
			anicks.add(uservice.nickToId(rinquiry.getHost_id()));
		}
		
		for(Room_InquiryDto rinquiry : hrinquirylist) {
			hnicks.add(uservice.nickToId(rinquiry.getUser_id()));
		}
		
		
		request.setAttribute("rinquirylist", rinquirylist);
		request.setAttribute("arinquirylist", arinquirylist);
		request.setAttribute("hrinquirylist", hrinquirylist);
		request.setAttribute("nicks", nicks);
		request.setAttribute("anicks", anicks);
		request.setAttribute("hnicks", hnicks);
		
		return "/accommodation/listRoominquiry.jsp";
	}

}
