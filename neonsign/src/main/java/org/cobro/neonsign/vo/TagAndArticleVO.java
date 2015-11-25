package org.cobro.neonsign.vo;

public class TagAndArticleVO {
	private String tagName;
	private int mainArticleNo;
	public TagAndArticleVO() {
		super();
	}
	public TagAndArticleVO(String tagName, int mainArticleNo) {
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
