package travel.controller;

import java.io.File;
import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import com.oreilly.servlet.MultipartRequest;

import travel.util.UploadImgHelper;

public class AddImgController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		String pro = request.getParameter("pro");
		int id = Integer.parseInt(request.getParameter("id"));
		UploadImgHelper uploadImgHelper = UploadImgHelper.create(request.getServletContext());
		
		
		
		try {
			List<Part> parts = (List<Part>) request.getParts();
			for(Part part:parts) {
				System.out.println(part.getName());
				if(!part.getName().equals("photos"))continue;
				if(part.getName().equals(""))continue;
				String fileName = part.getSubmittedFileName();
				System.out.println(fileName);
				uploadImgHelper.saveFiles(part);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
