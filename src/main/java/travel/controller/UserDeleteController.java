package travel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.UserDTO;
import travel.model.ReservationService;
import travel.model.ReviewService;
import travel.model.Room_InquiryService;
import travel.model.SiteInquiryService;
import travel.model.UserService;

public class UserDeleteController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		UserService service = new UserService();
		ReservationService rService = new ReservationService();
		Room_InquiryService iService = new Room_InquiryService();
		SiteInquiryService sService = new SiteInquiryService();
		int result = 0;
		
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("user");

		String id = request.getParameter("id");
		String pass = request.getParameter("password");
		
		System.out.println("user" + user);
		
		if(user.getUser_id().equals(id) && user.getUser_pass().equals(pass)) {
			
			result = service.userDelete(id , pass);
			rService.ddAll(id);
			rService.deleteAll(id);
			iService.deleteAll(id);
			sService.deleteAll(id);
			session.removeAttribute("user");
		}
			
			return "/";
		
	}

}
