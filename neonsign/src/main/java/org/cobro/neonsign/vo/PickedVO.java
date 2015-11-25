package org.cobro.neonsign.vo;

public class PickedVO {
	private String memberEmail;
	private int mainArticleNo;
	private MemberVO memberVO;
	private MainArticleVO mainArticleVO;
	public PickedVO() {
		super();
	}
	public PickedVO(String memberEmail, int mainArticleNo, MemberVO memberVO,
			MainArticleVO mainArticleVO) {
		super();
		this.memberEmail = memberEmail;
		this.mainArticleNo = mainArticleNo;
		this.memberVO = memberVO;
		this.mainArticleVO = mainArticleVO;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public int getMainArticleNo() {
		return mainArticleNo;
	}
	public void setMainArticleNo(int mainArticleNo) {
		this.mainArticleNo = mainArticleNo;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public MainArticleVO getMainArticleVO() {
		return mainArticleVO;
	}
	public void setMainArticleVO(MainArticleVO mainArticleVO) {
		this.mainArticleVO = mainArticleVO;
	}
	@Override
	public String toString() {
		return "PickedVO [memberEmail=" + memberEmail + ", mainArticleNo="
				+ mainArticleNo + ", memberVO=" + memberVO + ", mainArticleVO="
				+ mainArticleVO + "]";
	}
	
}
