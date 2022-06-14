package travel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import travel.DTO.AccommodationDto;
import travel.DTO.UserDTO;
import travel.model.AccommodationService;
import travel.util.UploadFileHelper;

public class InsertAccoController implements Command {

	@Override
	public String execute(HttpServletRequest request) {

		AccommodationService service = new AccommodationService();
		String dir = request.getServletContext().getRealPath("uploads");

		Map<String, Object> map = UploadFileHelper.uploadFile("uploads", request);
		
		int result = service.InsertAcco(insertAcco2(map));

		//request.setAttribute("result", result);
		String message = "등록실패"; if(result>0) message = "등록완료";
		request.setAttribute("message", message);



		//return insertAcco;
		return "confirmInsertAcco.jsp";
	
	}

	private AccommodationDto insertAcco2(Map<String, Object> map) {
		
		AccommodationDto Acco = new AccommodationDto();

		List<String> photos = (List<String>) map.get("potos");
		System.out.println(photos);

		Map<String, String> params = (Map<String, String>) map.get("params");
		
		Acco.setUser_id(params.get("user_id"));
		Acco.setAccommodation_name(params.get("acco_name"));
		Acco.setMail_num(Integer.parseInt(params.get("mail_num")));
		Acco.setAddress(params.get("address"));
		Acco.setLocation_detail(params.get("location_detail"));
		Acco.setX(Float.parseFloat(params.get("geoX")));
		Acco.setY(Float.parseFloat(params.get("geoY")));
		Acco.setA_image_path(photos.get(0));
		Acco.setA_option(params.get("acco_option"));
		Acco.setPhone(params.get("acco_phone"));
		Acco.setAccommodation_type(params.get("acco_type"));

		return Acco;
	}
}
