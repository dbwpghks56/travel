package travel.controller;




import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.InteAccoDTO;

import travel.DTO.RoomDto;
import travel.model.AccommodationService;
import travel.model.ReviewService;

import travel.model.RoomService;
import travel.util.DateUtil;
import travel.model.UserService;

public class SelectRoomController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		int accoId = Integer.parseInt(request.getParameter("acco_id"));
		String accoName =request.getParameter("acco_name");
		HttpSession session = request.getSession();
		Date check_in = (Date)session.getAttribute("check_in");
		Date check_out = (Date)session.getAttribute("check_out");
		int person = (Integer)session.getAttribute("person");
		
		RoomService service = new RoomService();
		
		List<InteAccoDTO> droomList = service.selectByDate(accoId, check_in, check_out);
		List<InteAccoDTO> roomList = service.selectByName(accoId, person);
		
		for(int i = 0; i<droomList.size(); i++) {
			for(int j = 0; j<roomList.size();j++) {
				if(droomList.get(i).getRoom_id()==roomList.get(j).getRoom_id()) {
					roomList.remove(j);
				}
			}
		}
		ReviewService rService = new ReviewService();
		List<Map<String, String>> reviewList = rService.selectByAcco(accoId);
		
		UserService uService = new UserService();
		String nick_name = uService.nickToId(accommo.getUser_id());
		request.setAttribute("accoName", accoName);
		request.setAttribute("address", roomList.get(0).getAddress());
		request.setAttribute("user_id", roomList.get(0).getUser_id());
		request.setAttribute("aImges", roomList.get(0).getA_image_path()[0]);
		request.setAttribute("address", accommo.getAddress());
		request.setAttribute("host_id", accommo.getUser_id());
		request.setAttribute("accoType", accommo.getAccommodation_type());
		request.setAttribute("nick_name", nick_name);
		request.setAttribute("a_image_path", accommo.getA_image_path().split(","));
		request.setAttribute("roomList", roomList);
		request.setAttribute("accoType", accommo.getAccommodation_type());
		request.setAttribute("rImgs", rImgs);
		request.setAttribute("x", accommo.getX());
		request.setAttribute("y", accommo.getY());
		request.setAttribute("phone", accommo.getPhone());
		request.setAttribute("option", accommo.getA_option());
		request.setAttribute("price", roomList.get(0).getPrice_by_day());
		request.setAttribute("reviewList", reviewList);
		
		
		return "selectRoom.jsp";
	}

}
