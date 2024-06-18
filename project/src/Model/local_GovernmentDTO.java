package Model;

public class local_GovernmentDTO {

	private String noticePost;
	private String point;
	private String localID;
	private String noticeMember;
	public String getNoticePost() {
		return noticePost;
	}
	public void setNoticePost(String noticePost) {
		this.noticePost = noticePost;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public String getLocalID() {
		return localID;
	}
	public void setLocalID(String localID) {
		this.localID = localID;
	}
	public String getNoticeMember() {
		return noticeMember;
	}
	public void setNoticeMember(String noticeMember) {
		this.noticeMember = noticeMember;
	}
	public local_GovernmentDTO(String noticePost, String point, String localID, String noticeMember) {
		super();
		this.noticePost = noticePost;
		this.point = point;
		this.localID = localID;
		this.noticeMember = noticeMember;
	}
	
	
}
