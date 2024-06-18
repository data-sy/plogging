package Model;

public class reviewBoardDTO {
	
	private int reviewNumber;
	private String memberId;
	private String reviewDate;
	private String img;
	private double lat;
	private double lng;
	private String contents;
	private String title;
	private String trash;
	private String run;
	
	
	
	public reviewBoardDTO(int reviewNumber, String memberId, String reviewDate, String img, double lat, double lng,
			String contents, String title, String trash, String run) {
		super();
		this.reviewNumber = reviewNumber;
		this.memberId = memberId;
		this.reviewDate = reviewDate;
		this.img = img;
		this.lat = lat;
		this.lng = lng;
		this.contents = contents;
		this.title = title;
		this.trash = trash;
		this.run = run;
	}
	public reviewBoardDTO(int reviewNumber, String title,double lat,double lng ,String memberId) {
		super();
		this.reviewNumber = reviewNumber;
		this.lat = lat;
		this.lng = lng;
		this.title = title;
		this.memberId = memberId;
	}
	public reviewBoardDTO(String memberId, String reviewDate, String img,double lat,double lng, String contents,
			String title, String trash, String run) {
		super();
		this.memberId = memberId;
		this.reviewDate = reviewDate;
		this.img = img;
		this.lat = lat;
		this.lng = lng;
		this.contents = contents;
		this.title = title;
		this.trash = trash;
		this.run = run;
	}
	public reviewBoardDTO(String memberId,String img, double lat,double lng, String contents,
			String title, String trash, String run) {
		super();
		this.memberId = memberId;
		this.img = img;
		this.lat = lat;
		this.lng = lng;
		this.contents = contents;
		this.title = title;
		this.trash = trash;
		this.run = run;
	}
	public int getReviewNumber() {
		return reviewNumber;
	}
	public void setReviewNumber(int reviewNumber) {
		this.reviewNumber = reviewNumber;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTrash() {
		return trash;
	}
	public void setTrash(String trash) {
		this.trash = trash;
	}
	public String getRun() {
		return run;
	}
	public void setRun(String run) {
		this.run = run;
	}
	
	
	

	
	
	
	
}
