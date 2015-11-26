package org.cobro.neonsign.vo;

public class TagBoardVO {
	private String tagName;
	private int mainArticleNo;
	public TagBoardVO() {
		super();
	}
	public TagBoardVO(String tagName, int mainArticleNo) {
		super();
		this.tagName = tagName;
		this.mainArticleNo = mainArticleNo;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public int getMainArticleNo() {
		return mainArticleNo;
	}
	public void setMainArticleNo(int mainArticleNo) {
		this.mainArticleNo = mainArticleNo;
	}
	@Override
	public String toString() {
		return "TagAndArticleVO [tagName=" + tagName + ", mainArticleNo="
				+ mainArticleNo + "]";
	}
	
}
