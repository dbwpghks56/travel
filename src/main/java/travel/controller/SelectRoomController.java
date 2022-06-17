package travel.controller;


import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import geoUtil.GeoPoint;
import geoUtil.GeoTrans;
import oracle.net.aso.l;
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
		
		int cStar = accommo.getCleaning_star();
		int lStar= accommo.getLocation_star();
		int sStar = accommo.getSatisfied_star();
		

		GeoPoint pt = new GeoPoint(accommo.getX(),accommo.getY());
		GeoPoint npt = GeoTrans.convert(GeoTrans.TM, GeoTrans.GEO, pt);
		npt = new GeoPoint(npt.getY(),npt.getX());
		
		SightsDAO sService = new SightsDAO();
		List<Map<String, String>> sights = sService.selectAll();
		JSONArray jSights = new JSONArray();
		for(int i = 0; i<sights.size(); i++) {
			Double x = Double.parseDouble(sights.get(i).get("x"));
			Double y = Double.parseDouble(sights.get(i).get("y"));
			GeoPoint spt = new GeoPoint(x,y);
			double distance = GeoTrans.getDistancebyGeo(npt, spt);
			if(distance>10){
				sights.remove(i);
				if(i!=1) {
					i--;
				}
			}
		}
		for(int i = 0 ; i<sights.size(); i++) {
			JSONObject jSight = new JSONObject(sights.get(i));
			jSights.add(jSight);
		}
		String[] aImgs = accommo.getA_image_path().split(",");
		for(int i = 0; i<aImgs.length; i++) {
			aImgs[i] = aImgs[i].trim();
		}
		
		request.setAttribute("accoName", accoName);
		request.setAttribute("accoId", accoId);
		request.setAttribute("address", accommo.getAddress());
		request.setAttribute("host_id", accommo.getUser_id());
		request.setAttribute("accoType", accommo.getAccommodation_type());
		request.setAttribute("nick_name", nick_name);
		request.setAttribute("a_image_path", aImgs);
		request.setAttribute("roomList", roomList);
		request.setAttribute("accoType", accommo.getAccommodation_type());
		request.setAttribute("rImgs", rImgs);
		request.setAttribute("x", accommo.getX());
		request.setAttribute("y", accommo.getY());
		request.setAttribute("phone", accommo.getPhone());
		request.setAttribute("option", accommo.getA_option());
		request.setAttribute("price", roomList.get(0).getPrice_by_day());
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("cStar", cStar);
		request.setAttribute("lStar", lStar);
		request.setAttribute("sStar", sStar);

		request.setAttribute("sights", jSights);

		
		
		return "/accommodation/selectRoom.jsp";
	}

}
