package travel.controller;


import javax.servlet.http.HttpServletRequest;


import travel.model.ReviewService;

public class updateReportController implements Command{

	
	@Override
	public String execute(HttpServletRequest request) {
		int rId = Integer.parseInt(request.getParameter("rId"));
		ReviewService rService = new ReviewService();
		boolean result = rService.updateReport(rId)==0? false:true;
		request.setAttribute("result", result);
		return "resultReviewReport.jsp";
	}

	
}
