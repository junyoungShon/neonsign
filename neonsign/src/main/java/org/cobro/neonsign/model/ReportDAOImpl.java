package org.cobro.neonsign.model;

import java.util.List;

import javax.annotation.Resource;

import org.cobro.neonsign.vo.MainArticleVO;
import org.cobro.neonsign.vo.ReportVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class ReportDAOImpl implements ReportDAO{
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

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
	public void articleNotifyCount(MainArticleVO mainArticleVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ReportVO notifyByNo(MainArticleVO mainArticleVO) {
		// TODO Auto-generated method stub
		return null;
	}

}
 