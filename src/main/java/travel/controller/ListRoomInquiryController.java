package travel.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import travel.DTO.ReviewDto;
import travel.DTO.Room_InquiryDto;
import travel.model.Room_InquiryService;
import travel.model.UserService;

public class ListRoomInquiryController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		Room_InquiryService service = new Room_InquiryService();
		UserService uservice = new UserService();
		
		List<Room_InquiryDto> rinquirylist = new ArrayList<>();
		
		List<String> nicks = new ArrayList<>();
		
		rinquirylist = service.selectAllRinquiry();
		
		for(Room_InquiryDto rinquiry : rinquirylist) {
			nicks.add(uservice.nickToId(rinquiry.getUser_id()));
		}
		
		
		
		request.setAttribute("rinquirylist", rinquirylist);
		request.setAttribute("nicks", nicks);
		
		return "/accommodation/listRoominquiry.jsp";
	}

}
