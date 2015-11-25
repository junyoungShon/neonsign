package org.cobro.neonsign.model;

import java.util.List;

import org.cobro.neonsign.vo.MainArticleVO;
import org.cobro.neonsign.vo.ReportVO;

public interface UtilService {
	public List<MainArticleVO> searchByKeyword(String tag);

	public List<ReportVO> notifyList();

	public void deleteByNotify(ReportVO notifyVO);

	public int notifyCount();

	public List<MainArticleVO> articleSort(String sort);

	public ReportVO articleNotify(MainArticleVO mainArticleVO);
}
