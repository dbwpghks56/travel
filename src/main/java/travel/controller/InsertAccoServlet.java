package travel.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.DTO.AccommodationDto;
import travel.model.AccommodationDAO;
import travel.model.AccommodationService;
import travel.util.UploadFileHelper;

/**
 * Servlet implementation class InsertAccoServlet
 */
@WebServlet("/insertAcco.do")
public class InsertAccoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 입력 form
		request.setCharacterEncoding("utf-8");

		RequestDispatcher rd;
		rd = request.getRequestDispatcher("insertAcco.jsp");
		rd.forward(request, response);

	}
	/*
	 * @SuppressWarnings("unchecked") protected void doPost(HttpServletRequest
	 * request, HttpServletResponse response) throws ServletException, IOException {
	 * 
	 * 
	 * 
	 * AccommodationDAO AccDAO = new AccommodationDAO(); String user_id =
	 * request.getParameter("user_id"); String acco_name =
	 * request.getParameter("acco_name"); String address =
	 * request.getParameter("address"); String new_address =
	 * request.getParameter("new_address"); //String photos =
	 * request.getParameter("photos"); String acco_option =
	 * request.getParameter("acco_option"); String acco_phone =
	 * request.getParameter("acco_phone"); String acco_type =
	 * request.getParameter("acco_type"); AccommodationDto accoDto = new
	 * AccommodationDto(0, user_id, user_id, new_address, acco_name, 0, 0, 0,
	 * address, acco_option, 0, 0, serialVersionUID, serialVersionUID, new_address,
	 * acco_phone, acco_type);
	 * 
	 * 
	 * 
	 * 
	 * Map<String, Object> map =
	 * (Map<String,Object>)UploadFileHelper.uploadFile("uploads", request);
	 * List<String> fileNames = (List<String>)map.get("potos"); Map<String, String>
	 * mapParam = (Map<String, String>)map.get("params"); String pic =
	 * fileNames.get(0); AccommodationDto accoDTO = new AccommodationDto();
	 * for(String key:mapParam.keySet()) { if(key.equals("photos"))
	 * accoDTO.setAccommodation_id(Integer.parseInt(mapParam.get(key)));
	 * 
	 * }
	 */

	/* AccommodationService service = new AccommodationService(); */

	/*
	 * response.sendRedirect("");
	 * 
	 * 
	 * RequestDispatcher rd; rd = request.getRequestDispatcher("result.jsp");
	 * rd.forward(request, response);
	 */

	protected String insertPic(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		AccommodationService service = new AccommodationService();
		String dir = request.getServletContext().getRealPath("uploads");

		Map<String, Object> map = UploadFileHelper.uploadFile("uploads", request);

		int result = service.InsertAcco(insertAcco(map));

		request.setAttribute("result", result);

		return "confirmInsertAcco.jsp";
	}

	@SuppressWarnings("unchecked")
	private AccommodationDto insertAcco(Map<String, Object> map) {
		AccommodationDto insertAcco = new AccommodationDto();

		List<String> photos = (List<String>) map.get("photos");
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

	// response.sendRedirect("test.jsp");
	// Redirect : 주소창을 바꾼다.
	// forward : 주소창을 바꾸지 않는다. 요청과 응답이 다른 문서이다.

	/*
	 * String message = "insert실패"; if(result>0) message = "insert성공";
	 * request.setAttribute("message", message);
	 */

}
