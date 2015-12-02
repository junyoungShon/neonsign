package org.cobro.neonsign.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cobro.neonsign.model.ItjaMemberBean;
import org.cobro.neonsign.model.MemberService;
import org.cobro.neonsign.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	@Resource
	private ItjaMemberBean itjaMemberBean;
	
	/**
	 *  ajax 이메일 중복확인 
	 *  @author 한솔
	 */
	@RequestMapping("findMemberByEmail.neon")
	@ResponseBody
	public boolean findMemberByEmail(String emailComp){
		//System.out.println(emailComp);
		MemberVO memberVO= memberService.findMemberByEmail(emailComp);
		//System.out.println(emailComp);
		boolean check=true;
		if(memberVO!=null){
		check=false;
		//System.out.println(check);
		}else{
		check=true;
		//System.out.println(check);
		}
		return check;	
	}
	/**
	 *  ajax 닉네임 중복확인 
	 *  @author 한솔
	 */
	@RequestMapping("findMemberByNickName.neon")
	@ResponseBody
	public boolean findMemberByNickName(String nameComp){
		//System.out.println(nameComp);
		MemberVO memberVO= memberService.findMemberByNickName(nameComp);
		//System.out.println(memberVO);
		boolean check=true;
		if(memberVO!=null){
			check=false;
			//System.out.println(check);
		}else{
			check=true;
			//System.out.println(check);
		}
		return check;	
	}

	@RequestMapping("memberLogin.neon")
	public ModelAndView memberLogin(HttpServletRequest request, MemberVO memberVO){
		memberVO=memberService.memberLogin(memberVO);
		memberVO.setItjaMemberList(itjaMemberBean.getItjaListByMemberEmail(memberVO));
		if(memberVO!=null){
			request.getSession().setAttribute("memberVO",memberVO);		
		}
		System.out.println(memberVO);
		return new ModelAndView("redirect:getMainList.neon");
	}
	@RequestMapping("memberLogout.neon")
	public ModelAndView memberlogout(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		if (session != null)
			session.invalidate();
		return new ModelAndView("redirect:getMainList.neon");
	}
	
	/**
	 *  가입후 바로 로그인 가능하도록함 
	 *  @author 한솔
	 */
	@RequestMapping("memberJoinByEmail.neon")
	public ModelAndView memberRegister(HttpServletRequest request,MemberVO memberVO){
		memberService.memberRegister(memberVO);
		request.getSession().setAttribute("memberVO",memberVO);
		return new ModelAndView("home");
	}
/*	
	public ModelAndView memberUpdate(HttpServletRequest request){
	
	}*/
	
	public ModelAndView memberDelete(MemberVO mvo){
		memberService.memberDelete(mvo);
		/**
		 * 		회원탈퇴 메소드
		 */
		return null;
	}
	
	/**
	 * 관리자 페이지에서 회원가입멤버들 리스트를 출력
	 * @author 한솔
	 */
	@RequestMapping("getMemberList.neon")
	public ModelAndView getMemberList(HttpServletRequest request,MemberVO mvo){
		ModelAndView mv = new ModelAndView();
		List<MemberVO> list=memberService.getMemberList();
		mv.addObject("list", list);
		mv.setViewName("forward:adminPageView.neon");
		return mv;
	}
	/**
	 * 회원 이메일을 받아 그 회원을 블락 시키는 메서드
	 * @author 윤택
	 */
	@RequestMapping("memberBlock.neon")
	public ModelAndView memberBlock(HttpServletRequest request){
		String memberEmail=request.getParameter("memberEmail");
		memberService.memberBlock(memberEmail);
		return new ModelAndView("redirect:getMemberList.neon");
	}
}
