package org.cobro.neonsign.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.cobro.neonsign.vo.ItjaMemberVO;
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
	@Resource
	private ItjaMemberBean itjaMemberBean;
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
	public List<MainArticleVO> selectListCompleteMainArticleOrderByTotalLike(int pageNo) {
		List<MainArticleVO> completeMainArticleList = boardDAO
				.selectListCompleteMainArticleOrderByTotalLike(pageNo);
		System.out.println("service " + completeMainArticleList);
		String tagName = "";
		ArrayList<TagBoardVO> list = new ArrayList<TagBoardVO>();
		for(int i = 0 ; i<completeMainArticleList.size() ; i++){
			list = boardDAO.getMainArticleTagList(completeMainArticleList.get(i).getMainArticleNo());
			for(int j = 0 ; j<list.size() ; j++){
				if(j == list.size()-1){
					tagName += "#" + list.get(j).getTagName();
				}else{
					tagName += "#" +  list.get(j).getTagName() + ", ";
				}
				completeMainArticleList.get(i).setTagName(tagName);
			}
			tagName = "";
		}
		return completeMainArticleList;
	}
	
	@Override
	/**
	 * 새로운 주제글 최신순 List + Tag
	 * @author JeSeong Lee
	 */
	public List<MainArticleVO> selectListNotCompleteMainArticleOrderByDate(int pageNo) {
		List<MainArticleVO> newMainArticleVOList
			= boardDAO.selectListNotCompleteMainArticleOrderByDate(pageNo);
		String tagName = "";
		ArrayList<TagBoardVO> list = new ArrayList<TagBoardVO>();
		for(int i = 0 ; i<newMainArticleVOList.size() ; i++){
			list = boardDAO.getMainArticleTagList(newMainArticleVOList.get(i).getMainArticleNo());
			for(int j = 0 ; j<list.size() ; j++){
				if(j == list.size()-1){
					tagName += "#" + list.get(j).getTagName();
				}else{
					tagName += "#" +  list.get(j).getTagName() + ", ";
				}
				newMainArticleVOList.get(i).setTagName(tagName);
			}
			tagName = "";
		}
		return newMainArticleVOList;
	}
	
	@Override
	/**
	 * best 주제글 최신순 List 불러오는 메서드 + Tag
	 * @author JeSeong Lee 
	 */
	public List<MainArticleVO> getBestMainArticleVOListOrderByDate() {
		List<MainArticleVO> bestMainArticleVOList
			= boardDAO.getBestMainArticleVOListOrderByDate();
		String tagName = "";
		ArrayList<TagBoardVO> list = new ArrayList<TagBoardVO>();
		for(int i = 0 ; i<bestMainArticleVOList.size() ; i++){
			list = boardDAO.getMainArticleTagList(bestMainArticleVOList.get(i).getMainArticleNo());
			for(int j = 0 ; j<list.size() ; j++){
				if(j == list.size()-1){
					tagName += "#" + list.get(j).getTagName();
				}else{
					tagName += "#" + list.get(j).getTagName() + ", ";
				}
				bestMainArticleVOList.get(i).setTagName(tagName);
			}
			tagName = "";
		}
		return bestMainArticleVOList;
	}
	
	@Override
	public List<MainArticleVO> selectListNotCompleteMainArticleOrderByTotalLike() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	/**
	 * 해당 MainArticle 정보를 가져 오는 메서드
	 * 	해당 MainArticle 정보 안에는 해당 MainArticle의 SubArticle의 정보 ,
	 * 작성자의 정보가 담겨져 있고 SubArticle 정보 안에는 SubArticle의 작성자
	 * 정보가 있음
	 */
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
	/**
	 * 해당 글의 itja 수와, 요청한 아이디가 itja를 눌렀는지 여부를 판단해준다.
	 * 1. itjaMemberBean에 잇자 체크를 요청하고
	 * 2. Map을 통해 itja수 와 잇자를 한 것인지 취소한 것인지를 리턴한다.
	 * @author junyoung
	 */
	@Override
	public HashMap<String, Integer> selectItjaState(ItjaMemberVO itjaMemberVO) {
		HashMap<String,Integer> map = new HashMap<String, Integer>();
		map.put("itjaSuccess",itjaMemberBean.checkItja(itjaMemberVO));
		map.put("itjaCount",itjaMemberBean.itjaCount(itjaMemberVO));
		return map;
	}
}
