package org.cobro.neonsign.model;

import java.util.ArrayList;

import org.cobro.neonsign.vo.MemberVO;

public interface MemberDAO {
	public MemberVO findMemberByEmail(MemberVO mvo);
	public MemberVO findMemberByNickName(MemberVO mvo);
	public int memberRegister(MemberVO mvo);
	public int memberUpdate(MemberVO mvo);
	public MemberVO memberLogin(MemberVO mvo);
	public MemberVO memberDelete(MemberVO mvo);
	public ArrayList<MemberVO> getNotifyMemberList(MemberVO mvo);
	public ArrayList<MemberVO> getMemberList();
}
