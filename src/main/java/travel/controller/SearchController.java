package travel.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import travel.DTO.InteAccoDTO;
import travel.model.AccommodationService;
import travel.util.DateUtil;

public class SearchController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		AccommodationService service = new AccommodationService();
		
		Date check_in = DateUtil.convertToDate(request.getParameter("check_in"));
		Date check_out = DateUtil.convertToDate(request.getParameter("check_out"));
		String location = request.getParameter("loc");
		int person = Integer.parseInt(request.getParameter("person"));
		
		List<Integer> daccommoList = service.selectByDate(check_in, check_out);
		List<Map<String, String>> accommoList = service.selectByOption(location,person,check_in,check_out);
		
		for (int i = 0; i < daccommoList.size(); i++) {
			for (int j = 0; j < accommoList.size(); j++) {
				if (accommoList.get(j).get("room_id")!= null&&daccommoList.get(i) == Integer.parseInt(accommoList.get(j).get("room_id"))) {
					accommoList.remove(j);
					break;
				}
			}
		}
		
		for(int i = 0; i<accommoList.size(); i++) {
			for(int j = i+1; j<accommoList.size(); j++) {
				if(accommoList.get(i).get("accommodation_id").equals(accommoList.get(j).get("accommodation_id"))) {
					accommoList.remove(j);
				}
			}
		}
		List<String[]> aImgs = new ArrayList<>();
		for(int i = 0; i<accommoList.size(); i++) {
			aImgs.add(accommoList.get(i).get("a_image_path").split(","));
		}
		List<Integer> stars = new ArrayList<>();
		int c = 0;
		int l = 0;
		int s = 0;
		for(int i = 0; i<accommoList.size(); i++) {
			if(accommoList.get(i).get("cleaning_star")!=null) {
				c = Integer.parseInt(accommoList.get(i).get("cleaning_star"));
				l = Integer.parseInt(accommoList.get(i).get("location_star"));
				s = Integer.parseInt(accommoList.get(i).get("satisfied_star"));
			}
			int star = (c+l+s)/3;
			stars.add(star);
		}
		HttpSession session = request.getSession();
		session.setAttribute("check_in", check_in);
		session.setAttribute("check_out", check_out);
		session.setAttribute("person", person);
		
		request.setAttribute("accommoList", accommoList);
		request.setAttribute("aImgs", aImgs);
		request.setAttribute("stars", stars);
		request.setAttribute("initCenterX", Float.parseFloat(accommoList.get(0).get("x")));
		request.setAttribute("initCenterY", Float.parseFloat(accommoList.get(0).get("y")));
		return "resultSelectAcco.jsp";
	}

}
