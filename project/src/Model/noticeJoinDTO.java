package Model;

public class noticeJoinDTO {
	
	private String member_id;
	private int notice_number;
	
	
	public noticeJoinDTO(String member_id,int notice_number) {
		super();
		this.member_id = member_id;
		this.notice_number = notice_number;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getNotice_number() {
		return notice_number;
	}
	public void setNotice_number(int notice_number) {
		this.notice_number = notice_number;
	}
}
