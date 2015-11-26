package org.cobro.neonsign.model;

import java.util.ArrayList;
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
	/**
	 * 메인아티클을 삽입하면서 mainArticle의 글번호를 받아온다
	 * 이후에 글번호와 태그를 Tag_Board table에 삽입한다.
	 * 트랜젝션의 대상이 되는지 고민해 볼 것!!
	 * @junyoung
	 */
	@Override
	public int insertMainArticle(MainArticleVO mainArticleVO,ArrayList<String> list,TagBoardVO tagBoardVO) {
		boardDAO.insertMainArticle(mainArticleVO);
		System.out.println("boardDAO : "+mainArticleVO.getMainArticleNo());
		for(int i=0;i<list.size();i++){
			tagBoardVO.setMainArticleNo(mainArticleVO.getMainArticleNo());
			tagBoardVO.setTagName(list.get(i));
			boardDAO.insertTagBoardVO(tagBoardVO);
		}
		return 0;
	}
	/**
	 * 글 인서트를 위해 모달창을 클릭할 때 사용자가 태그를 선택해야 하는데
	 * 이때 태그를 인기순으로 출력해 주기 위한 메서드
	 * @author junyoung
	 * @return
	 */
	@Override
	public List<TagVO> selectListTagNameOrderBySearchCount(){
		return boardDAO.selectListTagNameOrderBySearchCount();
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
	/**
	 * 주제글을 번호로 검색해서 찾는메소드
	 * 
	 * @author daehyeop
	 */
	@Override
	public MainArticleVO selectOneCompleteMainArticleByMainArticleNo(
			MainArticleVO mainArticleVO) {
		MainArticleVO resultMainArticleVO = boardDAO
				.selectOneCompleteMainArticleByMainArticleNo(mainArticleVO);
		return resultMainArticleVO;
	}

	/**
	 * 완결된 주제글을 게시일순 리스트로 받는 메소드
	 * 
	 * @author daehyeop
	 */
	@Override
	public List<MainArticleVO> selectListCompleteMainArticleOrderByDate() {
		List<MainArticleVO> completeMainArticleList = boardDAO
				.selectListCompleteMainArticleOrderByDate();
		return completeMainArticleList;
	}

	/**
	 * 완결된 주제글을 총잇자수순 리스트로 받는 메소드
	 * 
	 * @author daehyeop
	 */
	@Override
	public List<MainArticleVO> selectListCompleteMainArticleOrderByTotalLike() {
		List<MainArticleVO> completeMainArticleList = boardDAO
				.selectListCompleteMainArticleOrderByTotalLike();
		System.out.println("service " + completeMainArticleList);
		return completeMainArticleList;
	}
	/**
	 * 새로운 주제글 최신순 List
	 * @author JeSeong Lee
	 */
	@Override
	public List<MainArticleVO> selectListNotCompleteMainArticleOrderByDate() {
		List<MainArticleVO> newMainArticleVOList
			= boardDAO.selectListNotCompleteMainArticleOrderByDate();
		ArrayList<ArrayList<TagBoardVO>> list = new ArrayList<ArrayList<TagBoardVO>>();
		for(int i = 0 ; i<newMainArticleVOList.size() ; i++){
			list.add(boardDAO.getMainArticleTagList(newMainArticleVOList.get(i).getMainArticleNo()));
			newMainArticleVOList.get(i).setTagBoardVOList(list);
		}
		return newMainArticleVOList;
	}
	
	@Override
	/**
	 * best 주제글 최신순 List 불러오는 메서드
	 * @author Jeseong Lee 
	 */
	public List<MainArticleVO> getBestMainArticleVOListOrderByDate() {
		List<MainArticleVO> bestMainArticleVOList
			= boardDAO.getBestMainArticleVOListOrderByDate();
		ArrayList<ArrayList<TagBoardVO>> list = new ArrayList<ArrayList<TagBoardVO>>();
		for(int i = 0 ; i<bestMainArticleVOList.size() ; i++){
			list.add(boardDAO.getMainArticleTagList(bestMainArticleVOList.get(i).getMainArticleNo()));
			bestMainArticleVOList.get(i).setTagBoardVOList(list);
		}
		return bestMainArticleVOList;
	}
	@Override
	public List<MainArticleVO> selectListNotCompleteMainArticleOrderByTotalLike() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public MainArticleVO selectOneNotCompleteMainArticleByMainArticleNo(
			MainArticleVO mainArticleVO) {
		return boardDAO.selectOneNotCompleteMainArticleByMainArticleNo(mainArticleVO);
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
		if(nvo.getReportAmount()>=10){
			boardDAO.ArticleDelete(mavo);
		}
	}
	
	@Override
	/**
	 * main화면에 전체 Tag 리스트 불러옴
	 * @author JeSeong Lee
	 */
	public List<TagVO> getTagVOList() {
		return boardDAO.getTagVOList();
	}
	@Override
	public List<TagBoardVO> selectTagList() {
		// TODO Auto-generated method stub
		return null;
	}
}
