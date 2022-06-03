package travel.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod(); // "GET of "POST"
		System.out.println(req.getRequestURI());
		System.out.println(req.getContextPath());
		
		String uri = req.getRequestURI().substring(req.getContextPath().length());
		
		System.out.println(uri);
		String page = "";
		
		Command command = null;
		
		if(uri.equals("/jsp/search.do")) {
			command = new searchContreller();
		} else if(uri.equals("/jsp/login.do")) {
			
		}
		
		page = command.execute(req);
		
		RequestDispatcher rd = req.getRequestDispatcher(page);
		rd.forward(req, resp);
		
	}
       
	

}
