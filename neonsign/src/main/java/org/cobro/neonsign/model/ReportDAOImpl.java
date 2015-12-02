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
	public List<ReportVO> mainArticleReportList() {
		List<ReportVO> list=null;
		try{
		 list=sqlSessionTemplate.selectList("report.mainArticleReportList");
		 System.out.println(list.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ReportVO> subArticleReportList() {
		List<ReportVO> list=sqlSessionTemplate.selectList("report.subArticleReportList");
		System.out.println(list);
		return list;
	}

	@Override
	public void deleteByNotify(ReportVO notifyVO) {
		// TODO Auto-generated method stub
		System.out.println("희");
		try{
		sqlSessionTemplate.delete("report.deleteByReport",notifyVO);
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("삭제완료");
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

	@Override
	/**
	 * 신고한 회원들의 리스트를 받아오는 메서드
	 * @author 윤택
	 */
	public List<String> reporterNames(int reportNumber) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("report.reporterNames",reportNumber);
	}

	@Override
	/**
	 * 회원의 포인트를 10 지급해주는 메서드 
	 * @author 윤택
	 */
	public void memberPointUpdate(String email) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("report.memberPointUpdate",email);

	}

	@Override
	/**
	 * 신고 리스트의 신자들을 삭제
	 * @author 윤택
	 */
	public void deleteByReporter(ReportVO notifyVO) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("report.deleteByReporter",notifyVO);
	}

	@Override
	/**
	 * stagesOfProcess 를 신고처리로 update해주는 메서드
	 * @author 윤택
	 */
	public void stagesOfProcess(int reportNumber) {
		// TODO Auto-generated method stub
		 sqlSessionTemplate.update("report.stagesOfProcess",reportNumber);
	}

}
 