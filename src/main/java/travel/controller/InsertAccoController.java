package travel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import travel.DTO.AccommodationDto;
import travel.model.AccommodationService;
import travel.util.UploadFileHelper;

public class InsertAccoController implements Command {

	@Override
	public String execute(HttpServletRequest request) {

		AccommodationService service = new AccommodationService();
		String dir = request.getServletContext().getRealPath("uploads");

		Map<String, Object> map = UploadFileHelper.uploadFile("uploads", request);

		int result = service.InsertAcco(insertAcco(map));

		request.setAttribute("result", result);



		//return insertAcco;
		return "confirmInsertAcco.jsp";
	
	}

	private AccommodationDto insertAcco(Map<String, Object> map) {
		
		AccommodationDto insertAcco = new AccommodationDto();

		List<String> photos = (List<String>) map.get("potos");
		System.out.println(photos);

		Map<String, String> params = (Map<String, String>) map.get("params");

		insertAcco.setUser_id(params.get("User_id"));
		insertAcco.setAccommodation_name(params.get("acconame"));
		insertAcco.setAddress(params.get("address"));
		insertAcco.setNew_address(params.get("new_address"));
		insertAcco.setA_image_path(photos.get(0));
		insertAcco.setA_option(params.get("acco_option"));
		insertAcco.setPhone(params.get("acco_phone"));
		insertAcco.setAccommodation_type(params.get("acco_type"));

		return insertAcco;
	}
}
