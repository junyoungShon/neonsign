package org.cobro.neonsign.model;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

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
	public List<MainArticleVO> selectListCompleteMainArticleOrderByTotalLike() {
		List<MainArticleVO> mainArticleList = sqlSessionTemplate
				.selectList("completeMainArticleOrderByTotalLike");
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
	public List<MainArticleVO> selectListNotCompleteMainArticleOrderByDate() {
		return sqlSessionTemplate.selectList("board.selectListNotCompleteMainArticleOrderByDate");
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
		System.out.println(mainArticleVO.getMainArticleNo());
		MainArticleVO main=null;
		try{
		main=sqlSessionTemplate.selectOne("board.selectOneCompleteMainArticleByMainArticleNo",mainArticleVO);
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
	public void ArticleDelete(MainArticleVO mavo) {
		// TODO Auto-generated method stub
		
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

}
