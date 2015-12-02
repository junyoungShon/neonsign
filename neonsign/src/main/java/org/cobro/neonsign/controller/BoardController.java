package org.cobro.neonsign.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cobro.neonsign.model.BoardService;
import org.cobro.neonsign.vo.ItjaMemberVO;
import org.cobro.neonsign.vo.MainArticleVO;
import org.cobro.neonsign.vo.MemberVO;
import org.cobro.neonsign.vo.ReportVO;
import org.cobro.neonsign.vo.ReporterVO;
import org.cobro.neonsign.vo.SubArticleVO;
import org.cobro.neonsign.vo.TagBoardVO;
import org.cobro.neonsign.vo.TagVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	 * main.jsp에 베스트, 새로운주제글, Tag리스트 출력
	 * @author JeSeongLee
	 */
	@RequestMapping("getMainList.neon")
	public ModelAndView getMainList(){
		ModelAndView mav = new ModelAndView();
		// 새로운 주제글 날짜순 + Tag
		int pageNo = 1;
		List<MainArticleVO> newMainArticleVOListOrderByDate
			= boardService.selectListNotCompleteMainArticleOrderByDate(pageNo);
		// System.out.println("con잇자수 10개이하 주제글 : " + newMainArticleVOListOrderByDate);
		mav.addObject("newMainArticleVOListOrderByDate", newMainArticleVOListOrderByDate);
		// 베스트 주제글 날짜순 + Tag
		List<MainArticleVO> bestMainArticleVOListOrderByDate = boardService.getBestMainArticleVOListOrderByDate();
		// System.out.println("con잇자수 10개 이상 주제글 : " + bestMainArticleVOListOrderByDate);
		mav.addObject("bestMainArticleVOListOrderByDate", bestMainArticleVOListOrderByDate);
		// 전체 태그
		List<TagVO> tagVOList = boardService.getTagVOList();
		// System.out.println("conmain 전체 Tag : " + tagVOList);
		mav.addObject("tagVOList", tagVOList);
		mav.setViewName("home");
		return mav;
	}
	
	/**Controller9
	 * 무한스크롤을 위한 완결 주제글 메소드
	 * @author daehyeop
	 */
	@RequestMapping("getNewMainArticle.neon")
	@ResponseBody
	public HashMap<String, Object> getNewMainArticle(HttpServletRequest request,int pageNo){
		HashMap<String, Object> map= memberBoardInfo(request);
		//List<MainArticleVO> newMainArticleVOListOrderByDate = boardService.selectListNotCompleteMainArticleOrderByDate(pageNo);
		//ArrayList<MainArticleVO> newMainArticleArrayList = (ArrayList<MainArticleVO>) newMainArticleVOListOrderByDate;
		map.put("newMainArticleArrayList", boardService.selectListNotCompleteMainArticleOrderByDate(pageNo));
 		return map;
	}
	//main article 관련 메서드
	/**Controller1
	 * 사용자가 주제글을 작성할 때 사용한다.
	 * 태그와 주제글 테이블 동시에 적용
	 * @param mainArticleVO
	 * @param tagAndArticleVO
	 * @return
	 */
	@RequestMapping("auth_insertNewMainArticle.neon")
	public ModelAndView insertMainArticle(MainArticleVO mainArticleVO,HttpServletRequest request,TagBoardVO tagBoardVO){
		String[] tagNameList = request.getParameterValues("tagName") ;
		ArrayList<String> list = new ArrayList<String>();
		System.out.println(tagBoardVO);
		System.out.println(tagNameList.toString());
		for(int i=0;i<tagNameList.length;i++){
			list.add(tagNameList[i]);
		}
		boardService.insertMainArticle(mainArticleVO,list,tagBoardVO);
		return new ModelAndView("redirect:getMainList.neon");
	}
	/**
	 * 사용자가 주제글 작성을 위해 모달창을 열 때 태그들을 불러오는 메서드
	 */
	@RequestMapping("auth_openMainArticleModal.neon")
	@ResponseBody
	public List<TagVO> selectListTagNameOrderBySearchCount(){
		List<TagVO> list = boardService.selectListTagNameOrderBySearchCount();
		return list;
	}
	/**
	 * 해당 글의 itja 수와, 요청한 아이디가 itja를 눌렀는지 여부를 판단해준다.
	 * 이미 itjaClick했다면 세션과 DB에서 삭제
	 * 새로 itjaClick한것이라 세션과 db에 삽입
	 * @author junyoung
	 */
	@RequestMapping("auth_itjaClick.neon")
	@ResponseBody
	public HashMap<String,Integer> itjaClick(HttpServletRequest request,ItjaMemberVO itjaMemberVO){
		HttpSession session = request.getSession(false);
		System.out.println(itjaMemberVO);
		if(session!=null){
			MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
			boolean flag = false;
			if(memberVO!=null){
				List <ItjaMemberVO> list = memberVO.getItjaMemberList();
				if(list.size()==0){
					list.add(itjaMemberVO);
				}else{
					for(int i =0;i<list.size();i++){
						if(itjaMemberVO.getMainArticleNo()==list.get(i).getMainArticleNo()
								&&itjaMemberVO.getSubArticleNo()==list.get(i).getSubArticleNo()
								&&itjaMemberVO.getMemberEmail().equals(list.get(i).getMemberEmail())){
								list.remove(i);
								flag = false;
								break;
						}else{
							flag= true;
						}
					}
					if(flag){
						list.add(itjaMemberVO);
					}
					memberVO.setItjaMemberList(list);
				}
			}
			session.setAttribute("memberVO",memberVO);
		}
		return boardService.selectItjaState(itjaMemberVO);
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
	 * 관리자 페이지 진입시 신고글 내용 및 작성자의 정보 출력,신고자 정보 출력을 위한 컨트롤러
	 * @param mainArticleVO
	 * @param subArticleVO
	 * @param reportVO
	 * @return
	 */
	@RequestMapping("adminPageView.neon")
	public ModelAndView adminPageNotifyArticleList(HttpServletRequest request){
		Map<String, ArrayList<MemberVO>> memberMap=(Map<String, ArrayList<MemberVO>>)request.getAttribute("memberMap");
		List<ReportVO> mainReportList=boardService.mainArticleReportList();//주제글 신고 리스트를 받아온다
		List<ReportVO> subReportList=boardService.subArticleReportList();//잇는글 신고 리스트를 받아온다
		HashMap<String,Object> map=new HashMap<String, Object>();//회원관리 리스트, 게시물 신고 리스트 를 map에 put 해준다
		map.put("mainReportList", mainReportList); map.put("subReportList", subReportList);
		 map.put("memberList",(ArrayList<MemberVO>)memberMap.get("memberList"));  map.put("blokcMemberList",(ArrayList<MemberVO>)memberMap.get("blokcMemberList"));
		return new ModelAndView("adminPageView","adminList",map);
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
	@RequestMapping("adminPageDeleteArticle.neon")
	public ModelAndView adminPageDeleteArticle(String reportNO, String articleNO, String subArticleNO
			, String command){
		int articleNumber=Integer.parseInt(articleNO);
		int reportNumber=Integer.parseInt(reportNO);	
		try{			
			/* try문은 subArticleNO이 문자열 상태가 아니라면 catch문으로 넘어가지 않으므로
			 * 잇는글을 Block하거나 반려한다*/
			int subArticleNumber=Integer.parseInt(subArticleNO);//만약에 형변환중 Exception이 발생하면 Catch문 수행
		if(command.equals("report")){
			System.out.println("서브아티클 신고 접수");
			boardService.subArticleBlock(subArticleNumber,articleNumber,reportNumber);
			//report에 성공하면 신고한 회원들에게 포인트 지급
			boardService.memberPointUpdate(reportNumber);
		}else{
			System.out.println("subArticle 신고 목록에서 반려");
			ReportVO reportVO=new ReportVO();		
			reportVO.setReportNo(reportNumber);
			boardService.reportListDelete(reportVO);
		}
		 // 만약에 reportNumber을 int로 형변환 할 수 없다면
		 // catch문에서 mainArticle 을 Block하거나 mainArticle 을 반려처리 한다 	 		
		}catch(NumberFormatException e){
			/* * Catch문은 주제글을 Block하거나 주제글의 신고를 반려처리하는데
			 * 쓰인다*/	 
			if(command.equals("report")){
				System.out.println("메인아티클 신고접수");
				MainArticleVO mainArticleVO= new MainArticleVO();
				mainArticleVO.setMainArticleNo(articleNumber);
				boardService.articleBlock(mainArticleVO,reportNumber);
				//report에 성공하면 신고한 회원들에게 포인트 지급
				boardService.memberPointUpdate(reportNumber);
			}else{
				System.out.println("메인아티클 신고 반려");
				ReportVO reportVO=new ReportVO();		
				reportVO=new ReportVO();
				reportVO.setReportNo(reportNumber);
				boardService.reportListDelete(reportVO);
			}
		}
		
		return new ModelAndView("redirect:getMemberList.neon");
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
	 * 	미완결 글의 디테일을 리턴해준다
	 * @param mainArticleVO
	 * @author 전윤택
	 */
	/**Controller6
	 * 미완결 글보기를 클릭하면 해당 메서드가 실행된다.
	 * 	미완결 글의 디테일을 리턴해준다
	 * @param mainArticleVO
	 * @author 전윤택
	 */
	@RequestMapping("selectOneNotCompleteMainArticleByMainArticleNo.neon")
	@ResponseBody
	public HashMap<String, Object> selectOneNotCompleteMainArticleByMainArticleNo(HttpServletRequest request,MainArticleVO mainArticleVO){
		System.out.println(mainArticleVO);
		HashMap<String, Object> map= memberBoardInfo(request);
		if (mainArticleVO!=null) {
			Map<String,Object> mainArticle=boardService.selectOneNotCompleteMainArticleByMainArticleNo(mainArticleVO);
			map.put("mainArticle", mainArticle.get("mainArticleVO"));
			map.put("likingSubArticle", mainArticle.get("likingSubArticle"));
			map.put("subArticleVO", mainArticle.get("subArticleVO"));
		}
		return map;
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
		int pageNo=1;
		List<MainArticleVO> completeMainArticleList = boardService
				.selectListCompleteMainArticleOrderByTotalLike(pageNo);
		ArrayList<MainArticleVO> mainArticleList = (ArrayList<MainArticleVO>) completeMainArticleList;
		return new ModelAndView("completeMainArticleView", "mainArticleList",
				mainArticleList);
	}
	/**Controller9
	 * 무한스크롤을 위한 완결 주제글 메소드
	 * @author daehyeop
	 */
	@RequestMapping("getCompleteMainArticle.neon")
	@ResponseBody
	public HashMap<String, Object> getCompleteMainArticle(HttpServletRequest request,int pageNo){
		HashMap<String, Object> map= memberBoardInfo(request);
		map.put("mainArticleArrayList", boardService.selectListCompleteMainArticleOrderByTotalLike(pageNo));
		//List<MainArticleVO> mainArticleList = boardService.selectListCompleteMainArticleOrderByTotalLike(pageNo);
		//ArrayList<MainArticleVO> mainArticleArrayList = (ArrayList<MainArticleVO>) mainArticleList;
 		return map;
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
	/**
	 * 사용자가 찜한 게시물과, 잇자를 누른 게시물 정보를 담아주는 메서드
	 * @author junyoung
	 */
	public HashMap<String,Object> memberBoardInfo(HttpServletRequest request){
		HashMap<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession(false);
		if(session!=null){
			MemberVO memberVO =  (MemberVO) session.getAttribute("memberVO");
			if(memberVO!=null){
				map.put("itjaMemberList", memberVO.getItjaMemberList());
			}
		}
		return map;
	}
}
