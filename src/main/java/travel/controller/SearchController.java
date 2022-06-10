package travel.controller;

import java.sql.Date;

import java.util.ArrayList;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import java.util.List;

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
		List<InteAccoDTO> accommoList = service.selectByOption(location,person,check_in,check_out);
		for (int i = 0; i < daccommoList.size(); i++) {
			for (int j = 0; j < accommoList.size(); j++) {
				if (daccommoList.get(i) == accommoList.get(j).getRoom_id()) {
					accommoList.remove(j);
					break;
				}
			}
		}
		
		for(int i = 0; i<accommoList.size(); i++) {
			for(int j = i+1; j<accommoList.size(); j++) {
				if(accommoList.get(i).getAccommodation_id()==accommoList.get(j).getAccommodation_id()) {
					accommoList.remove(j);
				}
			}
		}

		
		HttpSession session = request.getSession();
		session.setAttribute("check_in", check_in);
		session.setAttribute("check_out", check_out);
		session.setAttribute("person", person);
		
		request.setAttribute("accommoList", accommoList);
		request.setAttribute("initCenterX", accommoList.get(0).getX());
		request.setAttribute("initCenterY", accommoList.get(0).getY());
		
		return "resultSelectAcco.jsp";
	}

}
