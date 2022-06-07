package travel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.AccommodationDto;
import travel.DTO.RoomDto;
import travel.DTO.UserDTO;
import travel.model.AccommodationService;
import travel.model.RoomService;
import travel.util.UploadFileHelper;

public class InsertRoomController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		RoomService service = new RoomService();
		String dir = request.getServletContext().getRealPath("uploads");

		Map<String, Object> map = UploadFileHelper.uploadFile("uploads", request);

		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("user");
		
		System.out.println(user);
		int result = service.InsertRoom(insertRoom2(map,user.getUser_id()));

		//request.setAttribute("result", result);
		
		String message = "등록실패"; if(result>0) message = "등록완료";
		request.setAttribute("message", message);

		
		return "confirmInsertRoom.jsp";
	
	}
	
	private RoomDto insertRoom2(Map<String, Object> map , String user_id) {
	
		RoomDto room = new RoomDto();

	List<String> photos = (List<String>) map.get("potos");
	System.out.println(photos);

	Map<String, String> params = (Map<String, String>) map.get("params");

	room.setAccommodation_id(Integer.parseInt(params.get("acco_id")));
	room.setMin_personnel(Integer.parseInt(params.get("min_per")));
	room.setMax_personnel(Integer.parseInt(params.get("max_per")));
	room.setMin_day(Integer.parseInt(params.get("min_day")));
	room.setMax_day(Integer.parseInt(params.get("max_day")));
	room.setPrice_by_day(Integer.parseInt(params.get("price")));
	room.setRoom_name(params.get("room_name"));
	room.setR_image_path(photos.get(0));
	room.setR_option(params.get("room_option"));
	
	
	return room;
	
}

}