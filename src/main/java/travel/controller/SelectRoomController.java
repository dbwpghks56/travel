package travel.controller;


import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import geoUtil.GeoPoint;
import geoUtil.GeoTrans;
import travel.DTO.AccommodationDto;
import travel.DTO.InteAccoDTO;
import travel.DTO.RoomDto;
import travel.DTO.SightDTO;
import travel.model.AccommodationService;
import travel.model.ReviewService;
import travel.model.RoomService;
import travel.model.SightsDAO;
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
		String loc = (String) session.getAttribute("loc");
		
		AccommodationService aService = new AccommodationService();
		AccommodationDto accommo = aService.selectById(accoId);
		
		RoomService service = new RoomService();
		List<RoomDto> roomList = service.selectByAcco(accoId);
		List<String[]> rImgs = service.selectImg(accoId);
		
		ReviewService rService = new ReviewService();
		List<Map<String, String>> reviewList = rService.selectByAcco(accoId);
		
		UserService uService = new UserService();
		String nick_name = uService.nickToId(accommo.getUser_id());
		
		int star = (accommo.getCleaning_star()+accommo.getLocation_star()+accommo.getSatisfied_star())/3;
		
		GeoPoint pt = new GeoPoint(accommo.getX(),accommo.getY());
		GeoPoint npt = GeoTrans.convert(GeoTrans.TM, GeoTrans.GEO, pt);
		npt = new GeoPoint(npt.getY(),npt.getX());
		
		SightsDAO sService = new SightsDAO();
		List<SightDTO> sights = sService.selectAll();
		for(int i = 0; i<sights.size(); i++) {
			GeoPoint spt = new GeoPoint(sights.get(i).getX(),sights.get(i).getY());
			double distance = GeoTrans.getDistancebyGeo(npt, spt);
			if(distance>20){
				sights.remove(i);
				i--;
			}
		}
		System.out.println(sights.size());
		
		request.setAttribute("accoName", accoName);
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
		request.setAttribute("star", star);
		request.setAttribute("sights", sights);
		
		
		return "selectRoom.jsp";
	}

}
