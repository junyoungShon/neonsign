package org.cobro.neonsign.controller;


import javax.annotation.Resource;

import org.cobro.neonsign.model.MemberService;
import org.cobro.neonsign.vo.MemberVO;
import org.springframework.stereotype.Controller;
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
	
	public ModelAndView memberLogin(MemberVO mvo){
		memberService.memberLogin(mvo);
		/**
		 * 		회원 인증 메소드
		 */
		return null;
	}
	
	public ModelAndView memberRegister(MemberVO mvo){
		memberService.memberRegister(mvo);
		/**
		 * 		회원가입 메소드
		 */
		return null;
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
