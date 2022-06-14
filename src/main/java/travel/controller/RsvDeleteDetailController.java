package travel.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.ReservationDTO;
import travel.DTO.UserDTO;
import travel.model.ReservationService;
import travel.util.DateUtil;

public class RsvDeleteDetailController implements Command {

	@Override
	public String execute(HttpServletRequest reQuest) {

			String dRsvNo = reQuest.getParameter("d_rsv_no");
			int i_dRsvNO = 0;
			if(dRsvNo !=null) {
				i_dRsvNO = Integer.parseInt(dRsvNo);
			}
			
			ReservationService rService = new ReservationService();
			ReservationDTO rsvdelete = rService.rsvDeleteAllDetail(i_dRsvNO);
			reQuest.setAttribute("rsvdelete", rsvdelete);

			return "rsvDeleteDetail.jsp";

}
}
