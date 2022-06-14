package travel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import travel.model.ReviewService;

public class selectReviewController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		int accoId = Integer.parseInt(request.getParameter("accoId"));
		
		ReviewService rService = new ReviewService();
		List<Map<String, String>> reviewList = rService.selectByAcco(accoId);
		
		request.setAttribute("rList", reviewList);
		return "ret: 0";
	}

}
