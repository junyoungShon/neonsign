package org.cobro.neonsign.model;

import java.util.List;

import javax.annotation.Resource;

import org.cobro.neonsign.vo.MainArticleVO;
import org.cobro.neonsign.vo.SubArticleVO;
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
		return null;
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
