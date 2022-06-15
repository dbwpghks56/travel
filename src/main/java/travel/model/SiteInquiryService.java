package travel.model;


import java.util.List;

import travel.DTO.SiteInquiryDTO;

public class SiteInquiryService {
	SiteInquiryDAO sDao  = new SiteInquiryDAO();
	public List<SiteInquiryDTO> selectAllReview(String userId) {
		return sDao.selectAllReview(userId);
	}
	public int insertInquiry(String user_id, String comment) {
		return sDao.insertInquiry(user_id,comment);
	}
	public int updateAnswer(SiteInquiryDTO site) {
		return sDao.updateAnswer(site);
	}
	public List<SiteInquiryDTO> selectAll() {
		return sDao.selectAll();
	}
}
