package org.cobro.neonsign.model;

import java.util.ArrayList;
import java.util.List;

import org.cobro.neonsign.vo.ItjaMemberVO;
import org.cobro.neonsign.vo.MainArticleVO;
import org.cobro.neonsign.vo.MemberVO;
import org.cobro.neonsign.vo.RankingVO;
import org.cobro.neonsign.vo.SubArticleVO;
import org.cobro.neonsign.vo.TagBoardVO;
import org.cobro.neonsign.vo.TagVO;

public interface BoardDAO {
	public String selectOneMainArticleUpdateDate (int mainArticleNo);
	//main article 관련 메서드
	public void insertMainArticle(MainArticleVO mainArticleVO);
	public void updateMainArticle(MainArticleVO mainArticleVO);
	public void deleteMainArticle(MainArticleVO mainArticleVO);
	public MainArticleVO selectOneCompleteMainArticleByMainArticleNo(MainArticleVO mainArticleVO);
	public List<MainArticleVO> selectListCompleteMainArticleOrderByTotalLike(int pageNo);
	public List<MainArticleVO> selectListCompleteMainArticleOrderByDate(int pageNo);
	public List<MainArticleVO> selectListCompleteMainArticleOrderByTag(int pageNo, String getTagName);
	public List<MainArticleVO> selectListNotCompleteMainArticleOrderByDate(int pageNo);
	public List<MainArticleVO> selectListNotCompleteMainArticleOrderByTag(int pageNo, String getTagName);
	public MainArticleVO selectOneNotCompleteMainArticleByMainArticleNo(MainArticleVO mainArticleVO);
	public List<TagVO> getTagVOList();
	public List<MainArticleVO> getBestMainArticleVOListOrderByDate();
	public void insertTagBoardVO(TagBoardVO tagBoardVO);
	public List<TagVO> selectListTagNameOrderBySearchCount();
	
	//sub article 관련 메서드
	public void insertSubArticle(SubArticleVO subArticleVO);
	public void updateSubArticle(SubArticleVO subArticleVO);
	public void deleteSubArticle(SubArticleVO subArticleVO);
	public List<SubArticleVO> selectListSubArticleByMainArticleNo(SubArticleVO subArticleVO);
	public List<SubArticleVO> selectListSubArticleByIsConnect(SubArticleVO subArticleVO);
	public List<SubArticleVO> selectListSubArticle(SubArticleVO subArticleVO);
	public void articleDelete(MainArticleVO mavo);
	public Object boardCount();
	
	//잇자 클릭 관련 메서드
	public void insertMainItjaMember(ItjaMemberVO itjaMemberVO);
	public int checkItja(ItjaMemberVO itjaMemberVO);
	public void insertSubItjaMember(ItjaMemberVO itjaMemberVO);
	public void deleteItja(ItjaMemberVO itjaMemberVO);
	public void updateMainMinusItjaHit(ItjaMemberVO itjaMemberVO);
	public void updateMainPlusItjaHit(ItjaMemberVO itjaMemberVO);
	public void updateSubPlusItjaHit(ItjaMemberVO itjaMemberVO);
	public void updateSubMinusItjaHit(ItjaMemberVO itjaMemberVO);
	public void updateMainMinusTotalItjaHit(ItjaMemberVO itjaMemberVO);
	public int selectMainItjaCount(ItjaMemberVO itjaMemberVO);
	public int selectSubItjaCount(ItjaMemberVO itjaMemberVO);
	public void updateMainPlusTotalItjaHit(ItjaMemberVO itjaMemberVO);
	public List<ItjaMemberVO> getItjaListByMemberEmail(String memberEmail);
	public MainArticleVO selectOneNotCompleteMainArticleByMainArticleAndSubArticleNo(
			MainArticleVO mainArticleVO);
	public void articleBlock(MainArticleVO mavo);
	public void subArticleBlock(int subArticleNumber);
	public int selectItjaTotalCount(ItjaMemberVO itjaMemberVO);
	int selectSubArticleCurruntGrade(SubArticleVO subArticleVO);
	public List<SubArticleVO> likingSubArticleFindByMainArticleNo(
			SubArticleVO subArticleVO);
	public void itjaCountDefault(ItjaMemberVO itjaMemberVO);
	public int alreadyWriteSubArticleInThisGrade(SubArticleVO subArticleVO);
	public void updateDateForMainArticle(int mainArticleNo);
	public void moveToBest(int mainArticleNo);
	public RankingVO getMemberRankingByMemberEmail(MemberVO memberVO);
	public List<Integer> getPickedMainArticleNoByEmail(MemberVO memberVO);
	public MainArticleVO getMainArticleByMainArticleNoOrderByDate(
			Integer integer);
	public MemberVO getMemberNickNameByEmail(MemberVO memberVO);
	public List<Integer> getWriteMainArticleNoByEmail(MemberVO memberVO);
	public List<Integer> getJoinMainArticleNoByEmail(MemberVO memberVO);
	public List<RankingVO> getRankingList();
	public List<SubArticleVO> selectListHigherLikeSubArticle(
			SubArticleVO subArticleVO);
	public void updateBestToCompletArticle(int mainArticleNo);
	public void updateIsConnect(SubArticleVO subArticleVO);
	public List<TagBoardVO> getMainArticleTagList(int mainArticleNo);
}
