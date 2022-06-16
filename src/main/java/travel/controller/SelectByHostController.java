package travel.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.RoomDto;
import travel.model.AccommodationService;
import travel.model.RoomService;

public class SelectByHostController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		AccommodationService aService = new AccommodationService();
		RoomService rService = new RoomService();
		HttpSession session = request.getSession();
		String host_id = (String) session.getAttribute("user_id");
		
		List<Map<String, String>> accoList = aService.selectByUser(host_id);
		int[] accoIdList = new int[accoList.size()];
		for(int i = 0;i<accoIdList.length; i++) {
			accoIdList[i] = Integer.parseInt(accoList.get(i).get("accommodation_id"));
		}
		List<List<RoomDto>> rList = new ArrayList<>();
		for(int i = 0; i<accoIdList.length; i++) {
			rList.add(rService.selectByAcco(accoIdList[i]));
		}
		
		request.setAttribute("accoList", accoList);
		request.setAttribute("rList", rList);
		
		return "selectAccoHost.jsp";
	}

}
