package org.cobro.neonsign.model;

import java.util.List;
import java.util.Map;

import org.cobro.neonsign.vo.MainArticleVO;
import org.cobro.neonsign.vo.ReportVO;
import org.cobro.neonsign.vo.SubArticleVO;

public interface BoardService {
	//main article 관련 메서드
	public int insertMainArticle(MainArticleVO mainArticleVO);
	public int updateMainArticle(MainArticleVO mainArticleVO);
	public void deleteMainArticle(MainArticleVO mainArticleVO);
	public MainArticleVO selectOneCompleteMainArticleByMainArticleNo(MainArticleVO mainArticleVO);
	public List<MainArticleVO> selectListCompleteMainArticleOrderByTotalLike();
	public List<MainArticleVO> selectListNotCompleteMainArticleOrderByDate();
	public List<MainArticleVO> selectListNotCompleteMainArticleOrderByTotalLike();
	public MainArticleVO selectOneNotCompleteMainArticleByMainArticleNo(MainArticleVO mainArticleVO);
	
	//sub article 관련 메서드
	public int insertSubArticle(SubArticleVO subArticleVO);
	public int updateSubArticle(SubArticleVO subArticleVO);
	public void deleteSubArticle(SubArticleVO subArticleVO);
	public List<SubArticleVO> selectListSubArticleByMainArticleNo(SubArticleVO subArticleVO);
	public List<SubArticleVO> selectListSubArticleByIsConnect(SubArticleVO subArticleVO);
	public List<SubArticleVO> selectListSubArticleBySubArticleGrade(SubArticleVO subArticleVO);
	
	//윤택
	public void ArticleDelete(MainArticleVO mainArticleVO);
	public void deleteByNotify(ReportVO notifyVO);
	public List<MainArticleVO> searchByKeyWord(String keyword);
	public List<ReportVO> notifyList();
	public Map<String, Object> boardStatistics();
	public List<MainArticleVO> articleSort(String sort);
	public void articleNotify(MainArticleVO mainArticleVO);
}
