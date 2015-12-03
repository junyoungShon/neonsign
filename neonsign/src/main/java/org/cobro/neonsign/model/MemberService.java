package org.cobro.neonsign.model;

import java.util.ArrayList;
import java.util.Map;

import org.cobro.neonsign.vo.MemberVO;

public interface MemberService {
	public MemberVO findMemberByEmail(String emailComp);
	public MemberVO findMemberByNickName(String nameComp);
	public int memberRegister(MemberVO mvo);
	public int memberUpdate(MemberVO mvo);
	public MemberVO memberLogin(MemberVO mvo);
	public MemberVO memberDelete(MemberVO mvo);
	public ArrayList<MemberVO> getNotifyMemberList(MemberVO mvo);
	public Map<String, ArrayList<MemberVO>> getMemberList();
	public void memberBlock(String memberEmail);
	public void memberBlockRelease(String memberEmail);
	public MemberVO defaultMemberLogin(MemberVO memberVO);
}
