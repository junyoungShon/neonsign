package org.cobro.neonsign.model;

import java.util.List;

import org.cobro.neonsign.vo.MainArticleVO;

public interface SearchDAO {

	public List<MainArticleVO> rsearchBykeyword(String keyword);

	public List<MainArticleVO> searchByTag(String keyword);

	public void hitArticle(String keyword);

	public List<MainArticleVO> articleSort(String sort);
}
