package Model;

public class memberDTO {

	private String memberId;
	private String memberPw;
	private String memberName;
	private int memberAge;
	private double memberLat;
	private double memberLng;
	private String memberPlogOwn;
	private int memberPlogCount;
	private int memberPoint;

	public memberDTO(String memberId, String memberPw, String memberName, int memberAge, double memberLat,
			double memberLng, String memberPlogOwn) {
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberAge = memberAge;
		this.memberLat = memberLat;
		this.memberLng = memberLng;
		this.memberPlogOwn = memberPlogOwn;
	}

	public memberDTO(String memberId, String memberPw, String memberName, int memberAge, double memberLat,
			double memberLng, String memberPlogOwn, int memberPlogCount) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberAge = memberAge;
		this.memberLat = memberLat;
		this.memberLng = memberLng;
		this.memberPlogOwn = memberPlogOwn;
		this.memberPlogCount = memberPlogCount;

	}

	public memberDTO(String memberId, String memberPw, String memberName, int memberAge) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberAge = memberAge;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getMemberAge() {
		return memberAge;
	}

	public void setMemberAge(int memberAge) {
		this.memberAge = memberAge;
	}

	public double getMemberLat() {
		return memberLat;
	}

	public void setMemberLat(double memberLat) {
		this.memberLat = memberLat;
	}

	public double getMemberLng() {
		return memberLng;
	}

	public void setMemberLng(double memberLng) {
		this.memberLng = memberLng;
	}

	public String getMemberPlogOwn() {
		return memberPlogOwn;
	}

	public void setMemberPlogOwn(String memberPlogOwn) {
		this.memberPlogOwn = memberPlogOwn;
	}

	public int getMemberPlogCount() {
		return memberPlogCount;
	}

	public void setMemberPlogCount(int memberPlogCount) {
		this.memberPlogCount = memberPlogCount;
	}

}