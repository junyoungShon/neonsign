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
	 * 완결된 주제글을 총잇자수순 리스트로 받는 메소드
	 * 
	 * @author daehyeop
	 */
	@Override
	public List<MainArticleVO> selectListCompleteMainArticle(int pageNo,
			String orderBy, String getTagName) {
		List<MainArticleVO> completeMainArticleList = null;
		//System.out.println("Service orderBy : " + orderBy);
		//System.out.println("Service PageNo : " + pageNo);
		if (orderBy.equals("like")) {
			completeMainArticleList = boardDAO
					.selectListCompleteMainArticleOrderByTotalLike(pageNo);
		} else if (orderBy.equals("date")) {
			completeMainArticleList = boardDAO
					.selectListCompleteMainArticleOrderByDate(pageNo);
		} else if (orderBy.equals("tag")) {
			completeMainArticleList = boardDAO
					.selectListCompleteMainArticleOrderByTag(pageNo, getTagName);
		}
		//System.out.println("service " + completeMainArticleList);
		String tagName = "";
		ArrayList<TagBoardVO> list = new ArrayList<TagBoardVO>();
		for (int i = 0; i < completeMainArticleList.size(); i++) {
			list = boardDAO.getMainArticleTagList(completeMainArticleList
					.get(i).getMainArticleNo());
			for (int j = 0; j < list.size(); j++) {
				if (j == list.size() - 1) {
					tagName += "#" + list.get(j).getTagName();
				} else {
					tagName += "#" + list.get(j).getTagName() + ", ";
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
	/**
	 * 무한스크롤 적용위해 수정
	 * @param pageNo
	 * @param orderBy
	 * @param getTagName
	 * @return
	 * @author daehyeop
	 */
	public List<MainArticleVO> selectListNotCompleteMainArticle(int pageNo,
			String orderBy, String getTagName) {
		List<MainArticleVO> newMainArticleVOList = null;
		if (orderBy.equals("date")) {
			newMainArticleVOList = boardDAO
					.selectListNotCompleteMainArticleOrderByDate(pageNo);
		} else if (orderBy.equals("tag")) {
			newMainArticleVOList = boardDAO
					.selectListNotCompleteMainArticleOrderByTag(pageNo,
							getTagName);
		}
		String tagName = "";
		ArrayList<TagBoardVO> list = new ArrayList<TagBoardVO>();
		for (int i = 0; i < newMainArticleVOList.size(); i++) {
			list = boardDAO.getMainArticleTagList(newMainArticleVOList.get(i)
					.getMainArticleNo());
			for (int j = 0; j < list.size(); j++) {
				if (j == list.size() - 1) {
					tagName += "#" + list.get(j).getTagName();
				} else {
					tagName += "#" + list.get(j).getTagName() + ", ";
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
	 * 해당 MainArticle 의 정보와 
	 * 이어진 글, 잇는글 목록을  가져 오는 메서드
	 * 	
	 * @author 윤택
	 */
	public Map<String, Object> selectOneNotCompleteMainArticleByMainArticleNo(
			MainArticleVO mainArticleVO) {
		//MainArticle의 정보를 가져온다 (주제글의 정보 , 작성자의 정보)		
		MainArticleVO mainVO=boardDAO.selectOneNotCompleteMainArticleByMainArticleAndSubArticleNo(mainArticleVO);
		//현재의 스토리 단계를 받아 오는 메서드
		SubArticleVO subArticleVO=new SubArticleVO();
		subArticleVO.setMainArticleNo(mainArticleVO.getMainArticleNo());
		int grade=boardDAO.selectSubArticleCurruntGrade(subArticleVO);
		subArticleVO.setSubAtricleGrade(grade);
		//MainArticl의 이어진 글을 받아오는 메서드 
		ArrayList<SubArticleVO> likingSubArticleList=
				(ArrayList<SubArticleVO>)boardDAO.likingSubArticleFindByMainArticleNo(subArticleVO);
		//MainArticl의 잇는 글을 받아오는 메서드
		ArrayList<SubArticleVO> subArticleVOList=(ArrayList<SubArticleVO>)boardDAO.selectListSubArticle(subArticleVO);
		System.out.println("SubArticle 여부 : "+subArticleVOList);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("mainArticleVO", mainVO);map.put("likingSubArticle", likingSubArticleList);map.put("subArticleVO", subArticleVOList);
		return map;
	}
	/**
	 * 가장 최근에 이어진 글의 단계를 얻어와서 1을 더해서 세팅한다.
	 * 해당 단계에서 요청한 사용자가 이미 글을 작성하였는지 확인 하고, 이미 작성했다면 작성을 거부한다.
	 * @author junyoung
	 */
	@Override
	public boolean insertSubArticle(SubArticleVO subArticleVO) {
		boolean flag =false;
		//현재 진행되는 이야기 단계를 반환
		System.out.println("aa2"+subArticleVO.getSubAtricleGrade());
		int subArticleCurruntGrade = boardDAO.selectSubArticleCurruntGrade(subArticleVO);
		subArticleVO.setSubAtricleGrade(subArticleCurruntGrade);
		System.out.println("aa4"+subArticleVO.getSubAtricleGrade());
		//현재 진행되는 이야기에 이미 사용자가 글을 썻는지 반환 썻으면 1 안썼으면 0
		int alreadyWriteSubArticleInThisGrade = boardDAO.alreadyWriteSubArticleInThisGrade(subArticleVO);
		System.out.println(alreadyWriteSubArticleInThisGrade);
		if(alreadyWriteSubArticleInThisGrade==0){
			flag=true;
			System.out.println("aa7"+subArticleVO.getSubAtricleGrade());
			boardDAO.insertSubArticle(subArticleVO);
		}
		System.out.println("aa8"+subArticleVO.getSubAtricleGrade());
		return flag;
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
	/**
	 * 주제글의 신고리스트를 받아오는 메서드
	 * @author 윤택
	 */
	@Override
	public List<ReportVO> mainArticleReportList() {
		// TODO Auto-generated method stub
		return utilService.mainArticleReportList();
		
	}
	@Override
	/**
	 * 잇는글의 신고리스트를 받아오는 메서드
	 * @author 윤택
	 */
	public List<ReportVO> subArticleReportList() {
		// TODO Auto-generated method stub
		return utilService.subArticleReportList();
	}
	@Override
	/**
	 * 관리자가 게시물신고를 신고처리하여
	 * 해당 게시물을 Block하는 메서드 
	 * @author 윤택
	 */
	public void articleBlock(MainArticleVO mavo, int reportNumber) {
		boardDAO.articleBlock(mavo);
		utilService.stagesOfProcess(reportNumber);
	}
	
	/**
	 * 관리자가 잇는글신고를 신고처리하여
	 * 해당 잇는글을 Block하는 메서드
	 * @author 윤택
	 */
	@Override
	public void subArticleBlock(int subArticleNumber, int articleNumber, int reportNumber) {
		// TODO Auto-generated method stub
		boardDAO.subArticleBlock(subArticleNumber);
		utilService.stagesOfProcess(reportNumber);
	}
	/**
	 * 관리자가 게시물신고를 반려처리하여 
	 * 신고 리스트에서 없애는 메서드
	 * @author 윤택
	 */
	@Override
	public void reportListDelete(ReportVO nvo) {
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
			boardDAO.articleDelete(mavo);
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
	 * 3. 총 잇자수가 10을 넘는 순간 주제글의 업데이트 데이트가 null이 아닐 경우(10이 되었다 취소되는 경우 다시 업데이트 갱신되는 것을 방지)
	 * 4. 주제글의 업데이트 데이트를 sysdate로 수정해준다.
	 * @author junyoung
	 */
	@Override
	public HashMap<String, Object> selectItjaState(ItjaMemberVO itjaMemberVO) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("itjaSuccess",itjaMemberBean.checkItja(itjaMemberVO));
		map.put("itjaCount",itjaMemberBean.itjaCount(itjaMemberVO));
		int totalCount = itjaMemberBean.itjaTotalCount(itjaMemberVO);
		map.put("itjaTotalCount",totalCount);
		if(totalCount>9){
			String defaultUpdateDate = boardDAO.selectOneMainArticleUpdateDate(itjaMemberVO.getMainArticleNo());
			if(defaultUpdateDate.equals("19700101000000")){
				boardDAO.updateDateForMainArticle(itjaMemberVO.getMainArticleNo());
				map.put("mainArticleUpdateDate",boardDAO.selectOneMainArticleUpdateDate(itjaMemberVO.getMainArticleNo()));
				boardDAO.moveToBest(itjaMemberVO.getMainArticleNo());
				map.put("moveToBest", 1);
			}
		}
		return map;
	}
	
	@Override
	/**
	 * 신고한 회원들에게 포인트를 지급해주는 메서드
	 * @author 윤택
	 */
	public void memberPointUpdate(int reportNumber) {
		// TODO Auto-generated method stub
		utilService.memberPointUpdate(reportNumber);
	}
	@Override
	public List<MainArticleVO> selectListCompleteMainArticleOrderByTotalLike() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<MainArticleVO> selectListNotCompleteMainArticleOrderByDate() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<MainArticleVO> selectListCompleteMainArticleOrderByDate() {
		// TODO Auto-generated method stub
		return null;
	}

}
