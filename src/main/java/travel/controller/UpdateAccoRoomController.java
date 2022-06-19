package travel.controller;

import javax.servlet.http.HttpServletRequest;

import travel.model.AccommodationService;
import travel.model.RoomService;

public class UpdateAccoRoomController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		String pro = request.getParameter("pro");
		String newValue = request.getParameter("newValue");
		int id = Integer.parseInt(request.getParameter("id").trim());
		int ret = 0;
		if(pro.equals("accommodation_name")||pro.equals("address")||pro.equals("phone")||pro.equals("a_option")) {
			AccommodationService aService = new AccommodationService();
			ret = aService.updateAcco(pro,newValue,id);
		}else {
			RoomService rService = new RoomService();
			ret = rService.updateRoom(pro,newValue,id);
		}
			
			
		return "rest:"+ret;
	}

}
