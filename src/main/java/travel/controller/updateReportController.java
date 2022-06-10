package travel.controller;


import javax.servlet.http.HttpServletRequest;


import travel.model.ReviewService;

public class updateReportController implements Command{

	
	@Override
	public String execute(HttpServletRequest request) {
		int rId = Integer.parseInt(request.getParameter("rId"));
		ReviewService rService = new ReviewService();
		int result = rService.updateReport(rId);
		return "rest:"+result;
	}

	
}
