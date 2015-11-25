package org.cobro.neonsign.model;

import java.util.List;

import javax.annotation.Resource;

import org.cobro.neonsign.vo.MainArticleVO;
import org.cobro.neonsign.vo.ReportVO;
import org.springframework.stereotype.Service;

@Service
public class UtilServiceImpl implements UtilService{
	@Resource
	private SearchDAO searchDAO;
	@Resource
	private ReportDAO notifyDAO;
	@Override
	public List<MainArticleVO> searchByKeyword(String tag) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<ReportVO> notifyList() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void deleteByNotify(ReportVO notifyVO) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public int notifyCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<MainArticleVO> articleSort(String sort) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public ReportVO articleNotify(MainArticleVO mainArticleVO) {
		// TODO Auto-generated method stub
		return null;
	}

}
