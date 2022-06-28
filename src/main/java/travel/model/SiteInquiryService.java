package travel.model;


import java.sql.SQLException;
import java.util.List;

import travel.DTO.SiteInquiryDTO;
import travel.util.DBUtil;

public class SiteInquiryService {
	SiteInquiryDAO sDao  = new SiteInquiryDAO();
	public List<SiteInquiryDTO> selectAllReview(String userId) {
		return sDao.selectAllReview(userId);
	}
	public int insertInquiry(String user_id, String comment) {
		return sDao.insertInquiry(user_id,comment);
	}
	public int updateAnswer(int iId, String answer, String mgrId) {
		return sDao.updateAnswer(iId,answer,mgrId);
	}
	public List<SiteInquiryDTO> selectAll() {
		return sDao.selectAll();
	}
	public int deleteAll(String userid) {
		return sDao.deleteAll(userid);
	}
}
