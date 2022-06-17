package travel.model;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import travel.DTO.AccommodationDto;
import travel.DTO.InteAccoDTO;
import travel.util.DBUtil;

public class AccommodationService {
	AccommodationDAO accommoDAO = new AccommodationDAO();
	
	public List<Map<String, String>> selectAllaccommo(){
		return accommoDAO.selectAllaccommo();
	}
	public List<Map<String, String>> selectByAddress(String address){
		return accommoDAO.selectByAddress(address);
	}

	public List<Integer> selectByDate(Date check_in, Date check_out){
		return accommoDAO.selectByDate(check_in, check_out);
	}
	
	public int InsertAcco (AccommodationDto acco) {
		return accommoDAO.InsertAcco(acco);
	}
	
	
	public List<Map<String, String>> selectByOption(String loc, int person, Date check_in, Date check_out){
		return accommoDAO.selectByOption(loc, person, check_in, check_out);
	}
	public AccommodationDto selectById(int id) {
		return accommoDAO.selectById(id);
	}

	
	public int accoDelete(String user_id, int accommodation_id) {
		return accommoDAO.accoDelete(user_id, accommodation_id);
	}

	public int updateStar(double cStar,double lStar,double sStar,int accoId) {
		return accommoDAO.updateStar(cStar, lStar, sStar, accoId);
	}
	public int roomToAcco(int rId) {
		return accommoDAO.roomToAcco(rId);
	}
	public List<Map<String, String>> selectByUser(String user_id) {
		return accommoDAO.selectByUser(user_id);
	}
	
	public int updateAcco(String pro, String newValue, int id) {
		// TODO Auto-generated method stub
		return accommoDAO.updateAcco(pro, newValue,id);
	}
}
