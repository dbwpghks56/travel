package travel.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import oracle.net.aso.l;
import travel.DTO.AccommodationDto;
import travel.model.AccommodationService;
import travel.util.DateUtil;

public class searchContreller implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		AccommodationService service = new AccommodationService();
		Date check_in = DateUtil.convertToDate(request.getParameter("check_in"));
		Date check_out = DateUtil.convertToDate(request.getParameter("check_out"));
		List<AccommodationDto> daccommoList = service.selectByDate(check_in, check_out);
		List<AccommodationDto> accommoList = service.selectAllaccommo();
		for(int i = 0 ; i<daccommoList.size();i++) {
			for(int j =0; j<accommoList.size(); j++) {
				if(daccommoList.get(i).getAccommodation_id()==accommoList.get(j).getAccommodation_id()) {
					accommoList.remove(j);
					break;
				}
			}
		}
		
		request.setAttribute("accommoList", accommoList);
		return "resultSearch.jsp";
	}

}
