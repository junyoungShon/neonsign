package org.cobro.neonsign.vo;

public class ReportVO {
	private String reportNo;
	private String reportDate;
	private int mainArticleNo;
	private int subArticleNo;
	private int reportAmount;
	private String stagesOfProcess;
	public ReportVO(String reportNo, String reportDate, int mainArticleNo,
			int subArticleNo, int reportAmount, String stagesOfProcess) {
		super();
		this.reportNo = reportNo;
		this.reportDate = reportDate;
		this.mainArticleNo = mainArticleNo;
		this.subArticleNo = subArticleNo;
		this.reportAmount = reportAmount;
		this.stagesOfProcess = stagesOfProcess;
	}
	public ReportVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getReportNo() {
		return reportNo;
	}
	public void setReportNo(String reportNo) {
		this.reportNo = reportNo;
	}
	public String getReportDate() {
		return reportDate;
	}
	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
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
	public int getReportAmount() {
		return reportAmount;
	}
	public void setReportAmount(int reportAmount) {
		this.reportAmount = reportAmount;
	}
	public String getStagesOfProcess() {
		return stagesOfProcess;
	}
	public void setStagesOfProcess(String stagesOfProcess) {
		this.stagesOfProcess = stagesOfProcess;
	}
	@Override
	public String toString() {
		return "ReportVO [reportNo=" + reportNo + ", reportDate=" + reportDate
				+ ", mainArticleNo=" + mainArticleNo + ", subArticleNo="
				+ subArticleNo + ", reportAmount=" + reportAmount
				+ ", stagesOfProcess=" + stagesOfProcess + "]";
	}
	
	
}
