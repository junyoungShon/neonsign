package org.cobro.neonsign.model;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.cobro.neonsign.vo.ItjaMemberVO;
import org.cobro.neonsign.vo.MainArticleVO;
import org.cobro.neonsign.vo.SubArticleVO;
import org.cobro.neonsign.vo.TagBoardVO;
import org.cobro.neonsign.vo.TagVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	/**
	 * 새로운 주제글을 인서트한다.
	 * @author junyoung
	 */
	@Override
	public void insertMainArticle(MainArticleVO mainArticleVO) {
		System.out.println(mainArticleVO);
		sqlSessionTemplate.insert("board.insertMainArticle", mainArticleVO);
	}
	/**
	 * 위 메서드와 동시에 실행된다. 태그 보드 게시판에 게시글 번호와 태그를 저장
	 * @author junyoung
	 */
	@Override
	public void insertTagBoardVO(TagBoardVO tagBoardVO) {
		sqlSessionTemplate.insert("board.insertTagBoardVO", tagBoardVO);
	}
	/**글 인서트를 위해 모달창을 클릭할 때 사용자가 태그를 선택해야 하는데
	 * 이때 태그를 인기순으로 출력해 주기 위한 메서드
	 * @author junyoung
	 */
	@Override
	public List<TagVO> selectListTagNameOrderBySearchCount(){
		return sqlSessionTemplate.selectList("board.selectListTagNameOrderBySearchCount");
	}
	@Override
	public void updateMainArticle(MainArticleVO mainArticleVO) {
		// TODO Auto-generated method stub
		
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
		int mainArticleNo = mainArticleVO.getMainArticleNo();
		MainArticleVO resultMainArticleVO = sqlSessionTemplate.selectOne(
				"completeMainArticleByMainArticleNo", mainArticleNo);
		return resultMainArticleVO;
	}

	/**
	 * 완결된 주제글을 게시일순 리스트로 받는 메소드
	 * 
	 * @author daehyeop
	 */
	@Override
	public List<MainArticleVO> selectListCompleteMainArticleOrderByDate() {
		List<MainArticleVO> completeMainArticleList = sqlSessionTemplate
				.selectList("completeMainArticleOrderByDate");
		return completeMainArticleList;
	}
	/**
	 * @author jeseongLee
	 */
	@Override
	public List<MainArticleVO> selectListCompleteMainArticleOrderByTotalLike(int pageNo) {
		List<MainArticleVO> mainArticleList = sqlSessionTemplate
				.selectList("completeMainArticleOrderByTotalLike", pageNo);
		return mainArticleList;
	}
	/**
	 * @author jeseongLee
	 */
	@Override
	public List<TagBoardVO> selectTagList() {
		return sqlSessionTemplate.selectList("board.selectTagList");
	}

	@Override
	public List<MainArticleVO> selectListNotCompleteMainArticleOrderByDate(int pageNo) {
		return sqlSessionTemplate.selectList("board.selectListNotCompleteMainArticleOrderByDate", pageNo);
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
	 * @author 윤택
	 */
	public MainArticleVO selectOneNotCompleteMainArticleByMainArticleNo(
			MainArticleVO mainArticleVO) {
		MainArticleVO main=sqlSessionTemplate.selectOne("board.selectOneNotCompleteMainArticleByMainArticleNo",mainArticleVO);
		return main;
	}
	@Override
	public MainArticleVO selectOneNotCompleteMainArticleByMainArticleAndSubArticleNo(
			MainArticleVO mainArticleVO) {
		// TODO Auto-generated method stub
				MainArticleVO main=null;
				try{
				main=sqlSessionTemplate.selectOne("board.selectOneNotCompleteMainArticleByMainArticleAndSubArticleNo",mainArticleVO);
				}catch(Exception e){
					e.printStackTrace();
				}
		return main;
		
	}
	@Override
	public void insertSubArticle(SubArticleVO subArticleVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateSubArticle(SubArticleVO subArticleVO) {
		// TODO Auto-generated method stub
		
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

	@Override
	public void articleDelete(MainArticleVO mavo) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("board.articleDelete",mavo);
	}

	@Override
	public Object boardCount() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<MainArticleVO> getBestMainArticleVOListOrderByDate() {
		System.out.println("DAOIMPL 희의");
		List<MainArticleVO> list=null;
		try{
			list=sqlSessionTemplate.selectList("board.getBestMainArticleVOListOrderByDate");
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<TagVO> getTagVOList() {
		return sqlSessionTemplate.selectList("board.getTagVOList");
	}

	@Override
	public ArrayList<TagBoardVO> getMainArticleTagList(int mainArticleNo) {
		List<TagBoardVO> list =null;
		try{
			list =sqlSessionTemplate.selectList("board.getMainArticleTagList", mainArticleNo);
		}catch(Exception e){
			e.printStackTrace();
		}
		return (ArrayList<TagBoardVO>) list;
	}
	/**
	 * 주제글에대한 잇자 클릭과 회원의 관계 정보를 가진 테이블에 정보를  삽입한다. 
	 * @author junyoung
	 */
	@Override
	public void insertMainItjaMember(ItjaMemberVO itjaMemberVO) {
		sqlSessionTemplate.insert("board.insertMainItjaMember", itjaMemberVO);
	}
	/**
	 * 잇자 여부를 확인하여 반환해준다. 이미 잇자햇다면 1 아니라면 0
	 * @author junyoung
	 */
	@Override
	public int checkItja(ItjaMemberVO itjaMemberVO) {
		return sqlSessionTemplate.selectOne("board.checkItja", itjaMemberVO);
	}
	/**
	 * 잇는글에 대한 잇자 클릭과 회원의 관계정보를 테이블에  저장하다.
	 * @author junyoung
	 */
	@Override
	public void insertSubItjaMember(ItjaMemberVO itjaMemberVO) {
		sqlSessionTemplate.insert("board.insertSubItjaMember", itjaMemberVO);
	}
	/**
	 * 주제게시물의 잇자수를 올려준다.
	 * @author junyoung
	 */
	@Override
	public void updateMainPlusItjaHit(ItjaMemberVO itjaMemberVO) {
		sqlSessionTemplate.update("board.updateMainPlusItjaHit", itjaMemberVO);
		
	}
	/**
	 * 잇는글의 잇자수를 올려준다.
	 * @author junyoung
	 */
	@Override
	public void updateSubPlusItjaHit(ItjaMemberVO itjaMemberVO) {
		sqlSessionTemplate.update("board.updateMainPlusItjaHit", itjaMemberVO);
		
	}
	/**
	 * 잇는글에 대한 잇자 클릭과 회원의 관계정보를 테이블에서 삭제한다.
	 * @author junyoung
	 */
	@Override
	public void deleteItja(ItjaMemberVO itjaMemberVO) {
		sqlSessionTemplate.delete("board.deleteItja",itjaMemberVO);
		
	}
	/**
	 * 주제게시물의 잇자수를 줄여준다.
	 * @author junyoung
	 */
	@Override
	public void updateMainMinusItjaHit(ItjaMemberVO itjaMemberVO) {
		sqlSessionTemplate.update("board.updateMainMinusItjaHit", itjaMemberVO);
		
	}
	/**
	 * 잇는글의 잇자수를 줄여준다.
	 * @author junyoung
	 */
	@Override
	public void updateSubMinusItjaHit(ItjaMemberVO itjaMemberVO) {
		sqlSessionTemplate.update("board.updateSubMinusItjaHit", itjaMemberVO);
		
	}
	/**
	 * 주제글의 총 잇자수를 줄여줍니다.
	 * @author junyoung
	 */
	@Override
	public void updateMainMinusTotalItjaHit(ItjaMemberVO itjaMemberVO) {
		sqlSessionTemplate.update("board.updateMainMinusTotalItjaHit", itjaMemberVO);
	}
	/**
	 * 주제글의 총 잇자수를 늘려줍니다.
	 * @author junyoung
	 */
	@Override
	public void updateMainPlusTotalItjaHit(ItjaMemberVO itjaMemberVO) {
		sqlSessionTemplate.update("board.updateMainPlusTotalItjaHit", itjaMemberVO);
	}
	/**
	 * 메인 주제글 단독의 잇자수를 반환한다.
	 * @author junyoung
	 */
	@Override
	public int selectMainItjaCount(ItjaMemberVO itjaMemberVO) {
		return sqlSessionTemplate.selectOne("board.selectMainItjaCount", itjaMemberVO);
	}
	/**
	 * 잇는 주제글의 잇자수를 반환한다.
	 */
	@Override
	public int selectSubItjaCount(ItjaMemberVO itjaMemberVO) {
		return sqlSessionTemplate.selectOne("board.selectSubItjaCount", itjaMemberVO);
	}
	/**
	 * 이메일에 해당하는 회원이 잇자를 누른 게시물을 모두 반환한다.
	 */
	@Override
	public List<ItjaMemberVO> getItjaListByMemberEmail(String memberEmail) {
		return sqlSessionTemplate.selectList("board.getItjaListByMemberEmail",memberEmail);
	}
	@Override
	public void articleBlock(MainArticleVO mavo) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("board.articleBlock",mavo);
	}
	/**
	 * 잇는글을 Block 처리하는 메서드
	 * @author 윤택
	 */
	@Override
	public void subArticleBlock(int subArticleNumber) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("board.subArticleBlock",subArticleNumber);
	}
	
}
