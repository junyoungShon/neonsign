package org.cobro.neonsign.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.cobro.neonsign.vo.ItjaMemberVO;
import org.cobro.neonsign.vo.MainArticleVO;
import org.cobro.neonsign.vo.ReportVO;
import org.cobro.neonsign.vo.SubArticleVO;
import org.cobro.neonsign.vo.TagBoardVO;
import org.cobro.neonsign.vo.TagVO;

public interface BoardService {
	//main article 관련 메서드
	public int insertMainArticle(MainArticleVO mainArticleVO, ArrayList<String> list,
			TagBoardVO tagBoardVO);
	public int updateMainArticle(MainArticleVO mainArticleVO);
	public void deleteMainArticle(MainArticleVO mainArticleVO);
	public MainArticleVO selectOneCompleteMainArticleByMainArticleNo(MainArticleVO mainArticleVO);
	public List<MainArticleVO> selectListCompleteMainArticle(int pageNo,String orderBy, String getTagName);
	public List<MainArticleVO> selectListNotCompleteMainArticle(int pageNo,	String orderBy, String getTagName);
	public MainArticleVO selectOneNotCompleteMainArticleByMainArticleNo(MainArticleVO mainArticleVO);
	public List<MainArticleVO> getBestMainArticleVOListOrderByDate();
	public List<TagVO> getTagVOList();
	public List<TagVO> selectListTagNameOrderBySearchCount();
	
	//sub article 관련 메서드
	public int insertSubArticle(SubArticleVO subArticleVO);
	public int updateSubArticle(SubArticleVO subArticleVO);
	public void deleteSubArticle(SubArticleVO subArticleVO);
	public List<SubArticleVO> selectListSubArticleByMainArticleNo(SubArticleVO subArticleVO);
	public List<SubArticleVO> selectListSubArticleByIsConnect(SubArticleVO subArticleVO);
	public List<SubArticleVO> selectListSubArticleBySubArticleGrade(SubArticleVO subArticleVO);
	
	//윤택

	public List<MainArticleVO> searchByKeyWord(String keyword);
	public Map<String, Object> boardStatistics();
	public List<MainArticleVO> articleSort(String sort);
	public void articleNotify(MainArticleVO mainArticleVO);
	public List<TagBoardVO> selectTagList();
	List<ReportVO> mainArticleReportList();
	List<ReportVO> subArticleReportList();
	HashMap<String, Integer> selectItjaState(ItjaMemberVO itjaMemberVO);
	void articleBlock(MainArticleVO mavo, int reportNumber);
	void reportListDelete(ReportVO nvo);
	public void subArticleBlock(int subArticleNumber, int articleNumber, int reportNumber);
	public void memberPointUpdate(int reportNumber);
	
}
