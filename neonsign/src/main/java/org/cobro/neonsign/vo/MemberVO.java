package org.cobro.neonsign.vo;

public class MemberVO {
	private String memberEmail;
	private String memberNickName;
	private String memberPassword;
	private String memberJoinDate;
	private int memberPoint;
	private int memberNotifiedAmount;
	private String memberCategory;
	private RankingVO rankingVO;
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVO(String memberEmail, String memberNickName,
			String memberPassword, String memberJoinDate, int memberPoint,
			int memberNotifiedAmount, String memberCategory, RankingVO rankingVO) {
		super();
		this.memberEmail = memberEmail;
		this.memberNickName = memberNickName;
		this.memberPassword = memberPassword;
		this.memberJoinDate = memberJoinDate;
		this.memberPoint = memberPoint;
		this.memberNotifiedAmount = memberNotifiedAmount;
		this.memberCategory = memberCategory;
		this.rankingVO = rankingVO;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberNickName() {
		return memberNickName;
	}
	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberJoinDate() {
		return memberJoinDate;
	}
	public void setMemberJoinDate(String memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}
	public int getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}
	public int getMemberNotifiedAmount() {
		return memberNotifiedAmount;
	}
	public void setMemberNotifiedAmount(int memberNotifiedAmount) {
		this.memberNotifiedAmount = memberNotifiedAmount;
	}
	public String getMemberCategory() {
		return memberCategory;
	}
	public void setMemberCategory(String memberCategory) {
		this.memberCategory = memberCategory;
	}
	public RankingVO getRankingVO() {
		return rankingVO;
	}
	public void setRankingVO(RankingVO rankingVO) {
		this.rankingVO = rankingVO;
	}
	@Override
	public String toString() {
		return "MemberVO [memberEmail=" + memberEmail + ", memberNickName="
				+ memberNickName + ", memberPassword=" + memberPassword
				+ ", memberJoinDate=" + memberJoinDate + ", memberPoint="
				+ memberPoint + ", memberNotifiedAmount="
				+ memberNotifiedAmount + ", memberCategory=" + memberCategory
				+ ", rankingVO=" + rankingVO + "]";
	}
	
}
