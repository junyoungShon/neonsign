package org.cobro.neonsign.controller;



import java.util.ArrayList;

import java.util.List;

import javax.annotation.Resource;

import org.cobro.neonsign.model.BoardService;
import org.cobro.neonsign.vo.MainArticleVO;
import org.cobro.neonsign.vo.ReportVO;
import org.cobro.neonsign.vo.ReporterVO;
import org.cobro.neonsign.vo.SubArticleVO;
import org.cobro.neonsign.vo.TagBoardVO;
import org.cobro.neonsign.vo.TagVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Resource
	private BoardService boardService;
	
	/**
	 * No.1 goAnyWhere()-ModelAndView
	 * 설명 :  단순 페이지 이동 시 요청 유알엘과 뷰의 파일명을 맞추기만 하면 사용가능한 메서드
	 * @author junyoung
	 */
	@RequestMapping("{viewId}.neon")
	public String goAnyWhere(@PathVariable String viewId){
		return viewId;
	}
	/**
	 * main.jsp에 주제글 리스트, Tag리스트 출력
	 * @author JeSeongLee
	 */
	@RequestMapping("getMainList.neon")
	public ModelAndView getMainList(){
		List<TagBoardVO> tagBoardVOList = boardService.selectTagList();
		List<MainArticleVO> mainArticleVOList = boardService.selectListNotCompleteMainArticleOrderByDate();
		System.out.println(tagBoardVOList + ", " + mainArticleVOList);
		ModelAndView mav = new ModelAndView();
		mav.addObject("tagBoardVOList", tagBoardVOList);
		mav.addObject("mainArticleVOList", mainArticleVOList);
		mav.setViewName("home");
		return mav;
	}
	//main article 관련 메서드
	/**Controller1
	 * 사용자가 주제글을 작성할 때 사용한다.
	 * 태그와 주제글 테이블 동시에 적용
	 * @param mainArticleVO
	 * @param tagAndArticleVO
	 * @return
	 */
	public ModelAndView insertMainArticle(MainArticleVO mainArticleVO,TagBoardVO tagAndArticleVO){
		return null;
	}
	/**Controller2
	 * 사용자가 주제글을 수정하고자 할때 사용한다.
	 * @param mainArticleVO
	 * @param tagAndArticleVO
	 * @return
	 */
	public ModelAndView updateMainArticle(MainArticleVO mainArticleVO,TagBoardVO tagAndArticleVO){
		return null;
	}
	
	/**controller3
	 * 관리자 또는 글 작성자가 주제글을 지우고자 할때 사용한다.(신고 없이 순찰중에 하거나, 작성자가 지우므로 신고포상금과 무관)
	 * @param mainArticleVO
	 */
	public ModelAndView deleteMainArticle(MainArticleVO mainArticleVO){
		return null;
	}
	/**controller4
	 * 관리자 페이지 진입시 신고글 내용 및 장성자의 정보 출력,신고자 정보 출력을 위한 컨트롤러
	 * @param mainArticleVO
	 * @param SubArticleVO
	 * @param notifyVO
	 * @return
	 */
	public ModelAndView adminPageNotifyArticleList(MainArticleVO mainArticleVO,SubArticleVO subArticleVO,ReportVO notifyVO){
		return null;
	}
	/**Controller5
	 * 관리자 페이지에서 신고글을 블락하거나 블락을 반력하는 메서드로서 신고 성공이므로 신고자들에게 포인트를 적립해준다.
	 * 블락이 반려될 경우 포인트가 적립되지 않는다.
	 * @param mainArticleVO
	 * @param subArticleVO
	 * @param notifyVO
	 * @param notifierVO
	 * @return
	 */
	public ModelAndView adminPageDeleteArticle(MainArticleVO mainArticleVO,SubArticleVO subArticleVO,ReportVO notifyVO,ReporterVO notifierVO){
		return null;
	}
	/**Controller6
	 * 완결 글보기를 클릭하면 해당 메서드가 실행된다.
	 * @param mainArticleVO
	 * @return
	 */
	public ModelAndView selectOneCompleteMainArticleByMainArticleNo(MainArticleVO mainArticleVO){
		return null;
	}
	/**Controller7
	 * 완결 글보기 잇자 추천버튼 눌렀을 때
	 * @return
	 */
	public ModelAndView updateLikeOfMainArticle(MainArticleVO mainArticleVO){
		return null;
	}
	/**Controller6
	 * 미완결 글보기를 클릭하면 해당 메서드가 실행된다.
	 * @param mainArticleVO
	 * @return
	 */
	public ModelAndView selectOneNotCompleteMainArticleByMainArticleNo(MainArticleVO mainArticleVO){
		MainArticleVO mainArticle=boardService.selectOneNotCompleteMainArticleByMainArticleNo(mainArticleVO);
		return new ModelAndView("footer","",mainArticle);
	}
	/**Controller7
	 * 미완결 주제글 잇자 추천버튼 눌렀을 때
	 * @return
	 */
	public ModelAndView updateLikeOfNotCompleteMainArticle(MainArticleVO mainArticleVO){
		return null;
	}
	/**Cotroller8-1
	 * 완결 주제글이 잇자수순으로 반환된다.
	 * session 확인 후 null일 경우 오류페이지로 보낸다.(오류페이지 미작성_수정요)
	 * @return
	 * @author daehyeop
	 */
	@RequestMapping("selectListCompleteMainArticleOrderByTotalLike.neon")
	public ModelAndView selectListCompleteMainArticleOrderByTotalLike() {
		List<MainArticleVO> completeMainArticleList = boardService
				.selectListCompleteMainArticleOrderByTotalLike();
		System.out.println(completeMainArticleList.get(0));
		ArrayList<MainArticleVO> mainArticleList = (ArrayList<MainArticleVO>) completeMainArticleList;
		System.out.println(mainArticleList.get(0));
		return new ModelAndView("completeMainArticleView", "mainArticleList",
				mainArticleList);
	}
	/**Cotroller8-2
	 * 완결 주제글이 게시일순으로 반환된다.
	 * @return
	 * @author daehyeop
	 */
	@RequestMapping("")
	public ModelAndView selectListCompleteMainArticleOrderByDate(){
		return null;
	}
	/**Cotroller9
	 * 미완결 주제글이날짜순으로 반환된다.
	 * @return
	 */
	public ModelAndView selectListNotCompleteMainArticleOrderByDate(){
		return null;
	}
	/**Cotroller10
	 * 미완결 주제글이 잇자수순으로 반환된다.
	 * @return
	 */
	public ModelAndView selectListNotCompleteMainArticleOrderByTotalLike(){
		return null;
	}
	/**Cotroller11
	 * 미완결 주제글이 잇자수순으로 반환된다.
	 * @return
	 */
	public ModelAndView selectListCompleteMainArticleByTagName(TagVO tagVO){
		return null;
	}
	
	//sub article 관련 메서드
	/**Controller12
	 * 잇자 글 등록
	 * @param subArticleVO
	 * @return
	 */
	public ModelAndView insertSubArticle(MainArticleVO mainArticleVO,SubArticleVO subArticleVO){
		return null;
	}
	/**Controller13
	 * 잇자글 잇자 버튼 클릭시 실행 메서드
	 * @param subArticleVO
	 * @return
	 */
	public ModelAndView updateLikeOfSubArticle(MainArticleVO mainArticleVO,SubArticleVO subArticleVO){
		return null;
	}
	/**Controller14
	 * 잇자글 블락
	 * @param subArticleVO
	 * @return
	 */
	public ModelAndView deleteSubArticle(MainArticleVO mainArticleVO,SubArticleVO subArticleVO){
		return null;
	}
	/**Controller15
	 * 10분 마다 실행되는 메서드로서 가장 많은 잇자수를 받은 댓글의 isEnd를 1로 바꿔준다.
	 * 그리고 새로운 잇자 글이 달릴 수 있도록 storyGrade를 +1한다.
	 * 나머지 잇는글은 모두 블락
	 * @param mainArticleVO
	 * @param subArticleVO
	 * @return
	 */
	public ModelAndView updateIsConnectOfSubArticle(MainArticleVO mainArticleVO,SubArticleVO subArticleVO){
		return null;
	}
}
