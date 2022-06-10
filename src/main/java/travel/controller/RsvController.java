package travel.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.ReservationDTO;
import travel.DTO.UserDTO;
import travel.model.ReservationService;
import travel.util.DateUtil;

public class RsvController implements Command {

	@Override
	public String execute(HttpServletRequest reQuest) {
		String method = reQuest.getMethod();
		String page = null;
		String result = null;
		if(method.equals("GET")) {
			return page = "reservation.jsp";
		} else {
			
			ReservationDTO rsv = makeRsv(reQuest);
			ReservationService rService = new ReservationService();
			int ret = rService.resevation(rsv);
			result = ret==0? "실패":"성공";
			
			int rsv_no = rService.insertAfterRsv();
			reQuest.setAttribute("rsv_no",rsv_no);
			
			page="rsvResult.jsp";
		}
		return "rest:"+result;
	}

	private ReservationDTO makeRsv(HttpServletRequest reQuest) {
		ReservationDTO rsv = new ReservationDTO();
		int room_id = Integer.parseInt(reQuest.getParameter("room_id")) ;
		int personnel = Integer.parseInt(reQuest.getParameter("personnel")) ;
		HttpSession session = reQuest.getSession();
		
		Date check_in = readDate(reQuest, "check_in");
		Date check_out = readDate(reQuest, "check_out");
		
//		String usre_id = reQuest.getParameter("user_id");
		UserDTO user = (UserDTO)session.getAttribute("user");
		String request = reQuest.getParameter("request");
		String rsv_status = reQuest.getParameter("rsv_status");
		
		rsv.setRsv_no(0);
		rsv.setRoom_id(room_id);
		rsv.setPersonnel(personnel);
		rsv.setCheck_in(check_in);
		rsv.setCheck_out(check_out);
		rsv.setRsv_date(null);
		rsv.setUser_id(user.getUser_id());
		rsv.setRequest(request);
		rsv.setRsv_status(rsv_status);
		
		return rsv;
	}

	/*
	 * private int readInt(HttpServletRequest reQuest, String column) { String data
	 * = reQuest.getParameter(column); return Integer.parseInt(data); }
	 */
	private Date readDate(HttpServletRequest reQuest, String column) {
		String data = reQuest.getParameter(column);
		return DateUtil.convertToDate(data);
	}
	


}
