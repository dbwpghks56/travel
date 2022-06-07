package travel.model;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import travel.DTO.AccommodationDto;
import travel.DTO.InteAccoDTO;
import travel.util.DBUtil;

public class AccommodationService {
	AccommodationDAO accommoDAO = new AccommodationDAO();
	
	public List<InteAccoDTO> selectAllaccommo(){
		return accommoDAO.selectAllaccommo();
	}
	public List<InteAccoDTO> selectByAddress(String address){
		return accommoDAO.selectByAddress(address);
	}

	public List<Integer> selectByDate(Date check_in, Date check_out){
		return accommoDAO.selectByDate(check_in, check_out);
	}
	
	public int InsertAcco (AccommodationDto acco) {
		return accommoDAO.InsertAcco(acco);
	}
	
	public JSONArray makeJsonArray(List<InteAccoDTO> list) {
		return accommoDAO.makeJsonArray(list);
	}
	public List<InteAccoDTO> selectByOption(String loc, int person){
		return accommoDAO.selectByOption(loc, person);
	}
}
