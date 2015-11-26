package org.cobro.neonsign.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		System.out.println(memberVO);
		memberVO=memberService.memberLogin(memberVO);
		System.out.println(memberVO);
		if(memberVO!=null){
			request.getSession().setAttribute("memberVO",memberVO);		
		}
		
		return new ModelAndView("home");
	}
	@RequestMapping("logout.do")
	public ModelAndView memberlogout(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		if (session != null)
			session.invalidate();
		return new ModelAndView("home");
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
	
	/*public ModelAndView getMemberList(MemberVO mvo){
		memberService.findMemberByEmail(mvo);
		memberService.getMemberList();
		*//** 	
		 * 		관리자인지를 email로 찾아 확인 후 리스트를 받아온다.
		 * 		관리자가 아닐경우 뻐큐 메세지를 날려준다.
		 * 		각각 분류별로 정렬할때 추가로 DAO를 구현한다.
		 *//*
		return null;
	}*/
}
