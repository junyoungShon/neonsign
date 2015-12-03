package org.cobro.neonsign.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.cobro.neonsign.vo.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Resource
	private MemberDAO memberDAO;
	@Resource
	private UtilService utilService;
	
	@Override
	public MemberVO findMemberByEmail(String emailComp) {
		// TODO Auto-generated method stub
		return memberDAO.findMemberByEmail(emailComp);
	}
	@Override
	public MemberVO findMemberByNickName(String nameComp) {
		// TODO Auto-generated method stub
		return memberDAO.findMemberByNickName(nameComp);
	}
	@Override
	public int memberRegister(MemberVO memberVO) {
		return memberDAO.memberRegister(memberVO);
	}
	@Override
	public int memberUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public MemberVO memberLogin(MemberVO memberVO) {
		return memberDAO.memberLogin(memberVO);
	}
	@Override
	public MemberVO memberDelete(MemberVO mvo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public ArrayList<MemberVO> getNotifyMemberList(MemberVO mvo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	/**
	 * 회원 리스트를 받아오는 메서드
	 * @author 장1솔
	 */
	public Map<String, ArrayList<MemberVO>> getMemberList() {
		// TODO Auto-generated method stub
		ArrayList<MemberVO> memberList=(ArrayList<MemberVO>)memberDAO.getMemberList();
		ArrayList<MemberVO> blokcMemberList=(ArrayList<MemberVO>)memberDAO.getBlockMemberList();
		Map<String,ArrayList<MemberVO>> map= new HashMap<String, ArrayList<MemberVO>>();
		map.put("memberList", memberList); map.put("blokcMemberList", blokcMemberList);
		return map;
	}
	@Override
	/**
	 * 회원 이메일을 받아 그 회원을 블락 시키는 메서드
	 * @author 윤택
	 */
	public void memberBlock(String memberEmail) {
		// TODO Auto-generated method stub
		memberDAO.memberBlock(memberEmail);
	}
	/**
	 * 회원 이메일을 받아 그 회원을 블락해제 시키는 메서드
	 * @author 윤택
	 */
	@Override
	public void memberBlockRelease(String memberEmail) {
		// TODO Auto-generated method stub
		memberDAO.memberBlockRelease(memberEmail);
	}
	/**
	 * pickedVO가 없는 초기 회원의 로그인을 위한 디폴트 로그인
	 * @author junyoung
	 */
	@Override
	public MemberVO defaultMemberLogin(MemberVO memberVO) {
		return memberDAO.defaultMemberLogin(memberVO);
	}
	
	
}
