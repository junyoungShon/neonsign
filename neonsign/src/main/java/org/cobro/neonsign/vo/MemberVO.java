package org.cobro.neonsign.vo;

import java.util.List;

public class MemberVO {
	private String memberEmail;
	private String memberNickName;
	private String memberPassword;
	private String memberJoinDate;
	private int memberPoint;
	private int memberNotifiedAmount;
	private String memberCategory;
	private RankingVO rankingVO;
	private List<ItjaMemberVO> itjaMemberList;
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
	public List<ItjaMemberVO> getItjaMemberList() {
		return itjaMemberList;
	}
	public void setItjaMemberList(List<ItjaMemberVO> list) {
		this.itjaMemberList = list;
	}
	public MemberVO(String memberEmail, String memberNickName,
			String memberPassword, String memberJoinDate, int memberPoint,
			int memberNotifiedAmount, String memberCategory,
			RankingVO rankingVO, List<ItjaMemberVO> itjaMemberList) {
		super();
		this.memberEmail = memberEmail;
		this.memberNickName = memberNickName;
		this.memberPassword = memberPassword;
		this.memberJoinDate = memberJoinDate;
		this.memberPoint = memberPoint;
		this.memberNotifiedAmount = memberNotifiedAmount;
		this.memberCategory = memberCategory;
		this.rankingVO = rankingVO;
		this.itjaMemberList = itjaMemberList;
	}
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "MemberVO [memberEmail=" + memberEmail + ", memberNickName="
				+ memberNickName + ", memberPassword=" + memberPassword
				+ ", memberJoinDate=" + memberJoinDate + ", memberPoint="
				+ memberPoint + ", memberNotifiedAmount="
				+ memberNotifiedAmount + ", memberCategory=" + memberCategory
				+ ", rankingVO=" + rankingVO + ", itjaMemberList="
				+ itjaMemberList + "]";
	}
	

}
