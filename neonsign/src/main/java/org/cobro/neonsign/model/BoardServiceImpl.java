package org.cobro.neonsign.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.cobro.neonsign.vo.MainArticleVO;
import org.cobro.neonsign.vo.ReportVO;
import org.cobro.neonsign.vo.SubArticleVO;
import org.cobro.neonsign.vo.TagBoardVO;
import org.cobro.neonsign.vo.TagVO;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
	@Resource
	private BoardDAO boardDAO;
	@Resource
	private UtilService utilService;
	@Override
	public int insertMainArticle(MainArticleVO mainArticleVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateMainArticle(MainArticleVO mainArticleVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public void deleteMainArticle(MainArticleVO mainArticleVO) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public MainArticleVO selectOneCompleteMainArticleByMainArticleNo(
			MainArticleVO mainArticleVO) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<MainArticleVO> selectListCompleteMainArticleOrderByTotalLike() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<MainArticleVO> selectListNotCompleteMainArticleOrderByDate() {
		return boardDAO.selectListNotCompleteMainArticleOrderByDate();
	}
	@Override
	public List<MainArticleVO> selectListNotCompleteMainArticleOrderByTotalLike() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public MainArticleVO selectOneNotCompleteMainArticleByMainArticleNo(
			MainArticleVO mainArticleVO) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int insertSubArticle(SubArticleVO subArticleVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateSubArticle(SubArticleVO subArticleVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public void deleteSubArticle(SubArticleVO subArticleVO) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<SubArticleVO> selectListSubArticleByMainArticleNo(
			SubArticleVO subArticleVO) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<SubArticleVO> selectListSubArticleByIsConnect(
			SubArticleVO subArticleVO) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<SubArticleVO> selectListSubArticleBySubArticleGrade(
			SubArticleVO subArticleVO) {
		// TODO Auto-generated method stub
		return null;
	}
	//윤택
	@Override
	public List<MainArticleVO> searchByKeyWord(String keyword) {
		return utilService.searchByKeyword(keyword);
	}
	@Override
	public List<ReportVO> notifyList() {
		// TODO Auto-generated method stub
		return utilService.notifyList();
	}
	@Override
	/**
	 * 관리자가 아티클을 삭제하는 메서드
	 */
	public void ArticleDelete(MainArticleVO mavo) {
		boardDAO.ArticleDelete(mavo);	
	}
	@Override
	public void deleteByNotify(ReportVO nvo) {
		utilService.deleteByNotify(nvo);
		
	}
	@Override
	public Map<String, Object> boardStatistics() {
		Map<String,Object>map=new HashMap<String,Object>();
		map.put("notifyCount",utilService.notifyCount());
		map.put("boardCount",boardDAO.boardCount());
		return map;
	}
	@Override
	public List<MainArticleVO> articleSort(String sort) {
		return utilService.articleSort(sort);
	}
	@Override
	/**
	 * 게시물 신고 횟수를 증가 하고 신고횟수가 10이상이면
	 * 아티클을 delete해주는 메서드
	 */
	public void articleNotify(MainArticleVO mavo) {
		ReportVO nvo=utilService.articleNotify(mavo);
		if(nvo.getNotifyCount()>=10){
			boardDAO.ArticleDelete(mavo);
		}
	}
	
	/**
	 * Tag를 불러오는 메서드 
	 */
	@Override
	public List<TagBoardVO> selectTagList() {
		return boardDAO.selectTagList();
	}
}
