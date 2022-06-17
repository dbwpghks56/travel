package travel.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import travel.util.UploadFileHelper;

public class AddImgController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		String pro = request.getParameter("pro");
		
		
		if(pro.equals("a_image_path")) {
			Map<String, Object> map = UploadFileHelper.uploadFile("uploads", request);
		}else {
			Map<String, Object> map = UploadFileHelper.uploadFile("uploads", request);
		}
		
		return null;
	}

}
