package travel.model;

import java.sql.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import travel.DTO.AccommodationDto;

public class AccommodationService {
	AccommodationDAO accommoDAO = new AccommodationDAO();
	
	public List<AccommodationDto> selectAllaccommo(){
		return accommoDAO.selectAllaccommo();
	}
	public List<AccommodationDto> selectByAddress(String address){
		return accommoDAO.selectByAddress(address);
	}

	public List<AccommodationDto> selectByDate(Date check_in, Date check_out){
		return accommoDAO.selectByDate(check_in, check_out);
	}
	public JSONArray makeJsonArray(List<AccommodationDto> list) {
		return accommoDAO.makeJsonArray(list);
	}
}
