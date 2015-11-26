package org.cobro.neonsign.model;

import java.util.List;

import javax.annotation.Resource;

import org.cobro.neonsign.vo.MainArticleVO;
import org.cobro.neonsign.vo.SubArticleVO;
import org.cobro.neonsign.vo.TagBoardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertMainArticle(MainArticleVO mainArticleVO) {
		// TODO Auto-generated method stub
		
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

	@Override
	public List<MainArticleVO> selectListCompleteMainArticleOrderByDate() {
		List<MainArticleVO> mainArticleList = sqlSessionTemplate
				.selectList("completeMainArticleOrderByDate");
		return mainArticleList;
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
		System.out.println("희");
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
}
