package org.cobro.neonsign.model;

import java.util.List;

import javax.annotation.Resource;

import org.cobro.neonsign.vo.MainArticleVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class SearchDAOImpl implements SearchDAO{
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<MainArticleVO> rsearchBykeyword(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MainArticleVO> searchByTag(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void hitArticle(String keyword) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MainArticleVO> articleSort(String sort) {
		// TODO Auto-generated method stub
		return null;
	}
}
