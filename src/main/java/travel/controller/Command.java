package travel.controller;

import javax.servlet.http.HttpServletRequest;

public interface Command {
	public String execute(HttpServletRequest request);
}

