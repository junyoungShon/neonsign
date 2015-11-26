package org.cobro.neonsign.model;

import java.util.ArrayList;

import org.cobro.neonsign.vo.MemberVO;

public interface MemberService {
	public MemberVO findMemberByEmail(String emailComp);
	public MemberVO findMemberByNickName(String nameComp);
	public int memberRegister(MemberVO mvo);
	public int memberUpdate(MemberVO mvo);
	public MemberVO memberLogin(MemberVO mvo);
	public MemberVO memberDelete(MemberVO mvo);
	public ArrayList<MemberVO> getNotifyMemberList(MemberVO mvo);
	public ArrayList<MemberVO> getMemberList();
}
