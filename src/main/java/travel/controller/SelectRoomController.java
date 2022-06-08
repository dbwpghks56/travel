package travel.controller;

import java.lang.StackWalker.Option;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.InteAccoDTO;
import travel.DTO.ReviewDto;
import travel.model.ReviewService;
import travel.model.RoomService;
import travel.model.UserService;
import travel.util.DateUtil;

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
		UserService uService = new UserService();
		String nickName = uService.nickToId(roomList.get(0).getUser_id());
		String phone = roomList.get(0).getPhone();
		
		String option = "";
		for(int i = 0; i<roomList.get(0).getA_option().length; i++) {
			if(i == 0) {
				option += roomList.get(0).getA_option()[i];
			}else {
				option += ", "+roomList.get(0).getA_option()[i];
			}
		}
		ReviewService rService = new ReviewService();
		List<ReviewDto> rList = rService.selectByAcco(accoId);
		
		String[][] userArr = new String[rList.size()][3];
		
		for(int i = 0; i<rList.size();i++) {
			userArr[i][0] = rList.get(i).getUser_id();
			userArr[i][1] = uService.selectImg(userArr[i][0]);
			userArr[i][2] = uService.nickToId(userArr[i][0]);
		}
		
		request.setAttribute("accoName", accoName);
		request.setAttribute("address", roomList.get(0).getAddress());
		request.setAttribute("user_id", roomList.get(0).getUser_id());
		request.setAttribute("a_image_path", roomList.get(0).getA_image_path());
		request.setAttribute("roomList", roomList);
		request.setAttribute("nickName", nickName);
		request.setAttribute("accoName", roomList.get(0).getAccommodation_name());
		request.setAttribute("max", roomList);
		request.setAttribute("accoType", roomList.get(0).getAccommodation_type());
		request.setAttribute("x", roomList.get(0).getX());
		request.setAttribute("y", roomList.get(0).getY());
		request.setAttribute("phone", phone);
		request.setAttribute("option", option);
		request.setAttribute("price", roomList.get(0).getPrice_by_day());
		request.setAttribute("rList", rList);
		request.setAttribute("userArr", userArr);
		
		
		return "selectRoom.jsp";
	}

}
