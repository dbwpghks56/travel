package travel.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.ReservationDTO;
import travel.DTO.UserDTO;
import travel.model.ReservationService;
import travel.util.DateUtil;

public class RsvDetailHostController implements Command {

	@Override
	public String execute(HttpServletRequest reQuest) {
			String rsvNo = reQuest.getParameter("rsv_no");
			int i_rsvNO = 0;
			if(rsvNo !=null) {
				i_rsvNO = Integer.parseInt(rsvNo);
			}
			
			ReservationService rService = new ReservationService();
			ReservationDTO host = rService.selectByHostRsvNo(i_rsvNO);
			reQuest.setAttribute("host", host);
			
		
		return "/reservation/hostRsvDetail.jsp";
	}
	
	
	}


