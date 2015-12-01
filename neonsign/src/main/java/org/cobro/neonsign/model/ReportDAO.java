package org.cobro.neonsign.model;

import java.util.List;

import org.cobro.neonsign.vo.MainArticleVO;
import org.cobro.neonsign.vo.ReportVO;

public interface ReportDAO {

	public void deleteByNotify(ReportVO notifyVO);

	public int notifyCount();

	public void articleNotifyCount(MainArticleVO mainArticleVO);

	public ReportVO notifyByNo(MainArticleVO mainArticleVO);

	List<ReportVO> mainArticleReportList();

	List<ReportVO> subArticleReportList();
}
