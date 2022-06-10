package travel.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.ReservationDTO;
import travel.DTO.UserDTO;
import travel.model.ReservationService;
import travel.util.DateUtil;

public class RsvDetailController implements Command {

	@Override
	public String execute(HttpServletRequest reQuest) {
		String method = reQuest.getMethod();
		String page = null;
		if(method.equals("GET")) {
			String rsvNo = reQuest.getParameter("rsv_no");
			int i_rsvNO = 0;
			if(rsvNo !=null) {
				i_rsvNO = Integer.parseInt(rsvNo);
			}
			
			ReservationService rService = new ReservationService();
			ReservationDTO rsv = rService.selectByRsvNo(i_rsvNO);
			reQuest.setAttribute("rsv", rsv);
			page = "rsvDetail.jsp";
			
		}else {
			ReservationDTO rsv = new ReservationDTO();
			rsv.setRequest(reQuest.getParameter("request"));
			rsv.setRsv_no(Integer.parseInt(reQuest.getParameter("rsv_no")));
			ReservationService rService = new ReservationService();
			int result = rService.rsvUpdate(rsv);
			reQuest.setAttribute("message", result>0?"수정성공":"수정실패");
			
			page="result.jsp";
		}
		return page;
	}
	
	private ReservationDTO makeRsv(HttpServletRequest reQuest) {
		ReservationDTO rsv = new ReservationDTO();
		int rsv_no = Integer.parseInt(reQuest.getParameter("rsv_no"));
		int room_id = Integer.parseInt(reQuest.getParameter("room_id")) ;
		int personnel = Integer.parseInt(reQuest.getParameter("personnel")) ;
		HttpSession session = reQuest.getSession();
		
		Date check_in = readDate(reQuest, "check_in");
		Date check_out = readDate(reQuest, "check_out");
		
//		String usre_id = reQuest.getParameter("user_id");
		UserDTO user = (UserDTO)session.getAttribute("user");
		String request = reQuest.getParameter("request");
		String rsv_status = reQuest.getParameter("rsv_status");
		
		//rsv.setRsv_no(rsv_no);
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
