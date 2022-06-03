package travel.DTO;

public class SiteInquiryDTO {
	 private int inquiry_id;
	 private String user_id;
	private String content;
	private String answer;
	private String manager_id;
	private int s_answer_confirm;
	public SiteInquiryDTO(int inquiry_id, String user_id, String content) {
		super();
		this.inquiry_id = inquiry_id;
		this.user_id = user_id;
		this.content = content;
	}
	public SiteInquiryDTO() {
		super();
	}
	@Override
	public String toString() {
		return "SiteInquiryDTO [inquiry_id=" + inquiry_id + ", user_id=" + user_id + ", content=" + content
				+ ", answer=" + answer + ", manager_id=" + manager_id + ", s_answer_confirm=" + s_answer_confirm + "]";
	}
	public int getInquiry_id() {
		return inquiry_id;
	}
	public void setInquiry_id(int inquiry_id) {
		this.inquiry_id = inquiry_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public int getS_answer_confirm() {
		return s_answer_confirm;
	}
	public void setS_answer_confirm(int s_answer_confirm) {
		this.s_answer_confirm = s_answer_confirm;
	}
	
}
