package org.cobro.neonsign.vo;

public class ReportVO {
	private String notifyNo;
	private String notifyDate;
	private int mainArticleNo;
	private int subArticleNo;
	private int notifiedAmount;
	private String stagesOfProcess;
	public ReportVO(String notifyNo, String notifyDate, int mainArticleNo,
			int subArticleNo, int notifiedAmount, String stagesOfProcess) {
		super();
		this.notifyNo = notifyNo;
		this.notifyDate = notifyDate;
		this.mainArticleNo = mainArticleNo;
		this.subArticleNo = subArticleNo;
		this.notifiedAmount = notifiedAmount;
		this.stagesOfProcess = stagesOfProcess;
	}
	public ReportVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getNotifyNo() {
		return notifyNo;
	}
	public void setNotifyNo(String notifyNo) {
		this.notifyNo = notifyNo;
	}
	public String getNotifyDate() {
		return notifyDate;
	}
	public void setNotifyDate(String notifyDate) {
		this.notifyDate = notifyDate;
	}
	public int getMainArticleNo() {
		return mainArticleNo;
	}
	public void setMainArticleNo(int mainArticleNo) {
		this.mainArticleNo = mainArticleNo;
	}
	public int getSubArticleNo() {
		return subArticleNo;
	}
	public void setSubArticleNo(int subArticleNo) {
		this.subArticleNo = subArticleNo;
	}
	public int getNotifiedAmount() {
		return notifiedAmount;
	}
	public void setNotifiedAmount(int notifiedAmount) {
		this.notifiedAmount = notifiedAmount;
	}
	public String getStagesOfProcess() {
		return stagesOfProcess;
	}
	public void setStagesOfProcess(String stagesOfProcess) {
		this.stagesOfProcess = stagesOfProcess;
	}
	@Override
	public String toString() {
		return "NotifyVO [notifyNo=" + notifyNo + ", notifyDate=" + notifyDate
				+ ", mainArticleNo=" + mainArticleNo + ", subArticleNo="
				+ subArticleNo + ", notifiedAmount=" + notifiedAmount
				+ ", stagesOfProcess=" + stagesOfProcess + "]";
	}
	public int getNotifyCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
