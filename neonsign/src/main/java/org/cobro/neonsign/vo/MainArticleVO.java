package org.cobro.neonsign.vo;

import java.util.List;

public class MainArticleVO {
	private int mainArticleNo;
	private String memberEmail;
	private String mainArticleTltle;
	private String mainArticleContent;
	private int mainArticleHIt;
	private int mainArticleLike;
	private int mainArticleTotalLike;
	private String mainArticleDate;
	private String mainArticleCompleteDate;
	//MainArticleVO는 MemberVO와 SubArticleVO를 가진다.
	private MemberVO memberVO;
	private List<SubArticleVO> subArticleList;
	public MainArticleVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MainArticleVO(int mainArticleNo, String memberEmail,
			String mainArticleTltle, String mainArticleContent,
			int mainArticleHIt, int mainArticleLike, int mainArticleTotalLike,
			String mainArticleDate, String mainArticleCompleteDate,
			MemberVO memberVO, List<SubArticleVO> subArticleList) {
		super();
		this.mainArticleNo = mainArticleNo;
		this.memberEmail = memberEmail;
		this.mainArticleTltle = mainArticleTltle;
		this.mainArticleContent = mainArticleContent;
		this.mainArticleHIt = mainArticleHIt;
		this.mainArticleLike = mainArticleLike;
		this.mainArticleTotalLike = mainArticleTotalLike;
		this.mainArticleDate = mainArticleDate;
		this.mainArticleCompleteDate = mainArticleCompleteDate;
		this.memberVO = memberVO;
		this.subArticleList = subArticleList;
	}
	public int getMainArticleNo() {
		return mainArticleNo;
	}
	public void setMainArticleNo(int mainArticleNo) {
		this.mainArticleNo = mainArticleNo;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMainArticleTltle() {
		return mainArticleTltle;
	}
	public void setMainArticleTltle(String mainArticleTltle) {
		this.mainArticleTltle = mainArticleTltle;
	}
	public String getMainArticleContent() {
		return mainArticleContent;
	}
	public void setMainArticleContent(String mainArticleContent) {
		this.mainArticleContent = mainArticleContent;
	}
	public int getMainArticleHIt() {
		return mainArticleHIt;
	}
	public void setMainArticleHIt(int mainArticleHIt) {
		this.mainArticleHIt = mainArticleHIt;
	}
	public int getMainArticleLike() {
		return mainArticleLike;
	}
	public void setMainArticleLike(int mainArticleLike) {
		this.mainArticleLike = mainArticleLike;
	}
	public int getMainArticleTotalLike() {
		return mainArticleTotalLike;
	}
	public void setMainArticleTotalLike(int mainArticleTotalLike) {
		this.mainArticleTotalLike = mainArticleTotalLike;
	}
	public String getMainArticleDate() {
		return mainArticleDate;
	}
	public void setMainArticleDate(String mainArticleDate) {
		this.mainArticleDate = mainArticleDate;
	}
	public String getMainArticleCompleteDate() {
		return mainArticleCompleteDate;
	}
	public void setMainArticleCompleteDate(String mainArticleCompleteDate) {
		this.mainArticleCompleteDate = mainArticleCompleteDate;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public List<SubArticleVO> getSubArticleList() {
		return subArticleList;
	}
	public void setSubArticleList(List<SubArticleVO> subArticleList) {
		this.subArticleList = subArticleList;
	}
	@Override
	public String toString() {
		return "MainArticleVO [mainArticleNo=" + mainArticleNo
				+ ", memberEmail=" + memberEmail + ", mainArticleTltle="
				+ mainArticleTltle + ", mainArticleContent="
				+ mainArticleContent + ", mainArticleHIt=" + mainArticleHIt
				+ ", mainArticleLike=" + mainArticleLike
				+ ", mainArticleTotalLike=" + mainArticleTotalLike
				+ ", mainArticleDate=" + mainArticleDate
				+ ", mainArticleCompleteDate=" + mainArticleCompleteDate
				+ ", memberVO=" + memberVO + ", subArticleList="
				+ subArticleList + "]";
	}
	
}
