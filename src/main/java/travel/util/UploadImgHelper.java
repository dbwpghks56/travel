package travel.util;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.Part;

public class UploadImgHelper {
	private String uploadPath;
	private ServletContext app;
	/* 생성 메서드 */
	public static UploadImgHelper create(ServletContext app) {
		
		UploadImgHelper uploadImgHelper = new UploadImgHelper();
		uploadImgHelper.setApp(app);
		uploadImgHelper.setUploadPath(app.getRealPath("/accoImages"));
		return uploadImgHelper;
	}
	
	private void setApp(ServletContext app) {
		this.app = app;
	}
	private void setUploadPath(String realPath) {
		this.uploadPath = realPath;
	}
	public void saveFiles(Part filePart) {		
		String realPath = this.uploadPath+File.separator;
		String filePath = realPath+filePart.getSubmittedFileName();
		
		try {
			InputStream fis = filePart.getInputStream();
			OutputStream fos = new FileOutputStream(filePath);
			
			byte[] buf = new byte[1024];
			int len = 0;
			while((len=fis.read(buf,0,1024))!=-1) {
				fos.write(buf,0,len);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
}
