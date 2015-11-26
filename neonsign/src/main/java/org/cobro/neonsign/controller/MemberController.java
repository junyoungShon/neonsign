package org.cobro.neonsign.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cobro.neonsign.model.MemberService;
import org.cobro.neonsign.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;

	
	public int findMemberByEmail(MemberVO mvo){
		memberService.findMemberByEmail(mvo);
		/**
		 * 		이메일 중복 확인 메소드
		 */
		return 0;
	}
	
	public int findMemberByNickName(MemberVO mvo){
		memberService.findMemberByNickName(mvo);
		/**
		 * 		닉네임 중복검사 메소드
		 */
		return 0;
	}
	
	@RequestMapping("memberLogin.neon")
	public ModelAndView memberLogin(HttpServletRequest request, MemberVO memberVO){
		System.out.println(memberVO);
		memberVO=memberService.memberLogin(memberVO);
		System.out.println(memberVO);
		if(memberVO!=null){
			request.getSession().setAttribute("memberVO",memberVO);		
		}
		/**
		 *  로그인 메서드 로그인성공시 세션적용(적용중)
		 */
		return new ModelAndView("home");
	}
	@RequestMapping("logout.do")
	public ModelAndView memberlogout(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		if (session != null)
			session.invalidate();
		return new ModelAndView("home");
	}
	
	/*회원가입 메소드*/
	@RequestMapping("memberJoinByEmail.neon")
	public ModelAndView memberRegister(MemberVO memberVO){
		memberService.memberRegister(memberVO);
		//회원 가입 성공시 index말고 로그인 된채로 main으로 보낸다.
		return new ModelAndView("index");
	}
	
	public ModelAndView memberUpdate(MemberVO mvo){
		memberService.memberUpdate(mvo);
		/**
		 * 		회원수정 메소드
		 */
		return null;
	}
	
	public ModelAndView memberDelete(MemberVO mvo){
		memberService.memberDelete(mvo);
		/**
		 * 		회원탈퇴 메소드
		 */
		return null;
	}
	
	public ModelAndView getMemberList(MemberVO mvo){
		memberService.findMemberByEmail(mvo);
		memberService.getMemberList();
		/** 	
		 * 		관리자인지를 email로 찾아 확인 후 리스트를 받아온다.
		 * 		관리자가 아닐경우 뻐큐 메세지를 날려준다.
		 * 		각각 분류별로 정렬할때 추가로 DAO를 구현한다.
		 */
		return null;
	}
}
