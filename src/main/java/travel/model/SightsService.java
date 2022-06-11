package travel.model;



import java.util.List;

import travel.DTO.SightDTO;

public class SightsService {
	SightsService sightDAO = new SightsService();
	public List<SightDTO> selectAll(){
		return sightDAO.selectAll();
	}
	public List<SightDTO> selectByAddress(String address){
		return sightDAO.selectByAddress(address);
		
	}
}
