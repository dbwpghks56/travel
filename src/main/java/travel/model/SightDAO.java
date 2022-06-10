package travel.model;


import java.util.List;

import travel.DTO.SightDTO;

public class SightDAO {
	SightDAO sightDAO = new SightDAO();
	public List<SightDTO> selectAll(){
		return sightDAO.selectAll();
	}
}
