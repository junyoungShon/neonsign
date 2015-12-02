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
	private ReportDAO reportDAO;
	@Override
	public List<MainArticleVO> searchByKeyword(String tag) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	/**
	 * 반려한 신고글의 리스트를 삭제
	 * @author 윤택
	 */
	public void deleteByNotify(ReportVO notifyVO) {
		// TODO Auto-generated method stub
		reportDAO.deleteByReporter(notifyVO);
		reportDAO.deleteByNotify(notifyVO);
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
	@Override
	public List<ReportVO> mainArticleReportList() {
		// TODO Auto-generated method stub
		return reportDAO.mainArticleReportList();
	}

	@Override
	public List<ReportVO> subArticleReportList() {
		// TODO Auto-generated method stub
		return reportDAO.subArticleReportList();
	}

	@Override
	/**
	 * 신고한 회원들의 포인트를 지급해주는 메서드
	 * @author 윤택
	 */
	public void memberPointUpdate(int reportNumber) {
		// TODO Auto-generated method stub
		List<String> list=reportDAO.reporterNames(reportNumber);
		for(int i=0; i<list.size();i++){
			reportDAO.memberPointUpdate(list.get(i));
		}
	}
	@Override
	public void stagesOfProcess (int reportNumber) {
		// TODO Auto-generated method stub
		reportDAO.stagesOfProcess(reportNumber);
	}

}
