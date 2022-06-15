package travel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.SiteInquiryDTO;
import travel.model.SiteInquiryService;
import travel.model.UserService;

public class SiteInquiryController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		UserService uService = new UserService();
		int mgr = uService.selectMGR(user_id);
		SiteInquiryService sService = new SiteInquiryService();
		if(mgr == 1) {
			List<SiteInquiryDTO> iList = sService.selectAll();
			request.setAttribute("iList", iList);
			return "/user/mgrInquiry.jsp";
		}else {
			List<SiteInquiryDTO> iList = sService.selectAllReview(user_id);
			
			request.setAttribute("iList", iList);

			return "/user/selectInquiry.jsp";
		}
		
		
	}

}
