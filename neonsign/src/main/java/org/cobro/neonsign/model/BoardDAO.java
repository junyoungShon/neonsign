package org.cobro.neonsign.model;

import java.util.List;

import org.cobro.neonsign.vo.MainArticleVO;
import org.cobro.neonsign.vo.SubArticleVO;
import org.cobro.neonsign.vo.TagBoardVO;

public interface BoardDAO {
	//main article 관련 메서드
	public void insertMainArticle(MainArticleVO mainArticleVO);
	public void updateMainArticle(MainArticleVO mainArticleVO);
	public void deleteMainArticle(MainArticleVO mainArticleVO);
	public MainArticleVO selectOneCompleteMainArticleByMainArticleNo(MainArticleVO mainArticleVO);
	public List<MainArticleVO> selectListCompleteMainArticleOrderByTotalLike();
	public List<MainArticleVO> selectListNotCompleteMainArticleOrderByDate();
	public List<MainArticleVO> selectListNotCompleteMainArticleOrderByTotalLike();
	public MainArticleVO selectOneNotCompleteMainArticleByMainArticleNo(MainArticleVO mainArticleVO);
	public List<MainArticleVO> selectListCompleteMainArticleOrderByDate();
	public List<TagBoardVO> selectTagList();
	
	
	//sub article 관련 메서드
	public void insertSubArticle(SubArticleVO subArticleVO);
	public void updateSubArticle(SubArticleVO subArticleVO);
	public void deleteSubArticle(SubArticleVO subArticleVO);
	public List<SubArticleVO> selectListSubArticleByMainArticleNo(SubArticleVO subArticleVO);
	public List<SubArticleVO> selectListSubArticleByIsConnect(SubArticleVO subArticleVO);
	public List<SubArticleVO> selectListSubArticleBySubArticleGrade(SubArticleVO subArticleVO);
	public void ArticleDelete(MainArticleVO mavo);
	public Object boardCount();
	
	
}
