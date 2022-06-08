package travel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.ReviewDto;
import travel.DTO.UserDTO;
import travel.model.ReviewService;
import travel.util.UploadFileHelper;

public class InsertReview implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		ReviewService reviewservice = new ReviewService();
		
		String dir = request.getServletContext().getRealPath("uploads");
		Map<String, Object> map = UploadFileHelper.uploadFile("uploads", request);
		
		ReviewDto review = makeReview(map);
		
		int result = reviewservice.insertReview(review);
		
		request.setAttribute("review_result", result > 0 ? "성공" : "실패");
		
		return "confirmreviewinsert.jsp";
	}

	private ReviewDto makeReview(Map<String, Object> map) {
		ReviewDto review = new ReviewDto();
		
		List<String> potos = (List<String>)map.get("potos");
		System.out.println(potos);
		
		Map<String,String> params = (Map<String,String>)map.get("params");
		
		int acco_id = Integer.parseInt(params.get("acco_id"));
		String user_id = params.get("user_id");
		String content = params.get("content");
		float cleaning_stars = Float.parseFloat(params.get("cleaning_stars"));
		float location_stars = Float.parseFloat(params.get("location_stars"));
		float satisfied_stars = Float.parseFloat(params.get("satisfied_stars"));
		String potos2 = potos.get(0);
		
		review.setAccommodation_id(acco_id);
		review.setUser_id(user_id);
		review.setContent(content);
		review.setCleaning_stars(cleaning_stars);
		review.setLocation_stars(location_stars);
		review.setSatisfied_stars(satisfied_stars);
		review.setR_image_path(potos2);
		
		return review;
	}

}






