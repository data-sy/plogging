package Model;

public class notice_BoardDTO {

	private int noticeNumber;
	private int tip_off_number;
	private String noticeDate;
	private String limitedNumber;
	private String plogDate;
	private String noticeImage;
	private String addr;
	private double lat;
	private double lng;
	
	
	public notice_BoardDTO() {
		super();
	}


	public notice_BoardDTO(int noticeNumber, String limitedNumber, String plogDate, String noticeImage, String addr) {
		super();
		this.noticeNumber = noticeNumber;
		this.limitedNumber = limitedNumber;
		this.plogDate = plogDate;
		this.noticeImage = noticeImage;
		this.addr = addr;
	}


	public notice_BoardDTO(int noticeNumber) {
		super();
		this.noticeNumber = noticeNumber;
	}

	public notice_BoardDTO(int noticeNumber, int tip_off_number, String noticeDate, String limitedNumber,
			String plogDate, String noticeImage, String addr, double lat, double lng) {
		super();
		this.noticeNumber = noticeNumber;
		this.tip_off_number = tip_off_number;
		this.noticeDate = noticeDate;
		this.limitedNumber = limitedNumber;
		this.plogDate = plogDate;
		this.noticeImage = noticeImage;
		this.addr = addr;
		this.lat = lat;
		this.lng = lng;
	}

	// 리뷰게시판을 선택할려는데 있어 셀렉트 하는곳
	public notice_BoardDTO(int noticeNumber, String addr, double lat, double lng) {
		super();
		this.noticeNumber = noticeNumber;
		this.addr = addr;
		this.lat = lat;
		this.lng = lng;
	}

	public notice_BoardDTO(double lat, double lng) {
		this.lat = lat;
		this.lng = lng;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
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

	public int getNoticeNumber() {
		return noticeNumber;
	}

	public void setNoticeNumber(int noticeNumber) {
		this.noticeNumber = noticeNumber;
	}

	public int getTip_off_number() {
		return tip_off_number;
	}

	public void setTip_off_number(int tip_off_number) {
		this.tip_off_number = tip_off_number;
	}

	public String getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getLimitedNumber() {
		return limitedNumber;
	}

	public void setLimitedNumber(String limitedNumber) {
		this.limitedNumber = limitedNumber;
	}

	public String getPlogDate() {
		return plogDate;
	}

	public void setPlogDate(String plogDate) {
		this.plogDate = plogDate;
	}

	public String getNoticeImage() {
		return noticeImage;
	}

	public void setNoticeImage(String noticeImage) {
		this.noticeImage = noticeImage;
	}

}