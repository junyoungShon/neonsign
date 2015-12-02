package org.cobro.neonsign.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cobro.neonsign.model.ItjaMemberBean;
import org.cobro.neonsign.model.MemberService;
import org.cobro.neonsign.vo.ItjaMemberVO;
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
		System.out.println("회원 정보 : "+ memberVO.getMemberCategory());
		if(memberVO!=null){
			List<ItjaMemberVO> list = itjaMemberBean.getItjaListByMemberEmail(memberVO);
			//0,0번째 글은 존재하지 않는다. 잇자를 누른 글이 하나도 없어도 사용자의 이메일을 얻기 위함이다.
			list.add(new ItjaMemberVO(0,0,memberVO.getMemberEmail()));
			if(list!=null){
				memberVO.setItjaMemberList(list);
			}
			request.getSession().setAttribute("memberVO",memberVO);		
		}
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
		request.setAttribute("memberVO", memberVO);
		return new ModelAndView("forward:memberLogin.neon");
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
	 * 관리자 페이지에서 일반&블락 회원멤버들 리스트를 출력
	 * @author 한솔
	 */
	@RequestMapping("getMemberList.neon")
	public ModelAndView getMemberList(HttpServletRequest request,MemberVO mvo){
		ModelAndView mv = new ModelAndView();
		Map<String, ArrayList<MemberVO>> memberMap=memberService.getMemberList();//일반회원 리스트를 받아온다
		mv.addObject("memberMap", memberMap);
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
	/**
	 * 회원 이메일을 받아 그 회원을 블락해제 시키는 메서드
	 * @author 윤택
	 */
	@RequestMapping("memberBlockRelease.neon")
	public ModelAndView memberBlockRelease(HttpServletRequest request){
		String memberEmail=request.getParameter("memberEmail");
		memberService.memberBlockRelease(memberEmail);
		return new ModelAndView("redirect:getMemberList.neon");
	}
}
