package travel.controller;

import java.sql.Date;
import java.util.List;

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

		if (method.equals("GET")) {
			String roomId = reQuest.getParameter("room_id");
			int i_roomId = 0;
			if (roomId != null) {
				i_roomId = Integer.parseInt(roomId);
			}
			ReservationService rService = new ReservationService();

			reQuest.setAttribute("rsv", rService.selectByRoomId(i_roomId));
			reQuest.setAttribute("checkInOut", rService.selectByCheckInOut(i_roomId));

			page = "/reservation/reservation.jsp";
		} else {

			ReservationDTO rsv = makeRsv(reQuest);
			HttpSession session = reQuest.getSession();
			String user_id = (String)session.getAttribute("user_id");
			ReservationService rService = new ReservationService();
			System.out.println(rsv);
			int result = rService.resevation(rsv);
			int rsv_no = rService.insertAfterRsv(user_id);
			if (result > 0) {
				reQuest.setAttribute("message", "예약이 성공적으로 이루어 졌습니다");
				reQuest.setAttribute("rsv_no", rsv_no);

				page = "/reservation/rsvResult.jsp";
			} else {
				reQuest.setAttribute("message", "예약이 실패했습니다.");
				page = "/reservation/result.jsp";
			}

		}
		return page;
	}

	private ReservationDTO makeRsv(HttpServletRequest reQuest) {
		ReservationDTO rsv = new ReservationDTO();
		int room_id = Integer.parseInt(reQuest.getParameter("room_id"));

		HttpSession session = reQuest.getSession();

		UserDTO user = (UserDTO) session.getAttribute("user");
		String request = reQuest.getParameter("request");
		String rsv_status = reQuest.getParameter("rsv_status");

		// Date check_in =
		// DateUtil.convertToDate((String)session.getAttribute("check_in"));
		// Date check_out =
		// DateUtil.convertToDate((String)session.getAttribute("check_out"));
		// int personnel = (Integer) session.getAttribute("person");

		 Date check_in = DateUtil.convertToDate( reQuest.getParameter("check_in"));
		 Date check_out = DateUtil.convertToDate( reQuest.getParameter("check_out"));
		 int personnel = Integer.parseInt(reQuest.getParameter("personnel"));

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

}
