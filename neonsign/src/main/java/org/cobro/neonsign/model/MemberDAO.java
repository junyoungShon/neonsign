package org.cobro.neonsign.model;

import java.util.ArrayList;
import java.util.List;

import org.cobro.neonsign.vo.MemberVO;

public interface MemberDAO {
	public MemberVO findMemberByEmail(String emailComp);
	public MemberVO findMemberByNickName(String nameComp);
	public int memberRegister(MemberVO mvo);
	public int memberUpdate(MemberVO mvo);
	public MemberVO memberLogin(MemberVO mvo);
	public MemberVO memberDelete(MemberVO mvo);
	public ArrayList<MemberVO> getNotifyMemberList(MemberVO mvo);
	public List<MemberVO> getMemberList();
	public void memberBlock(String memberEmail);
	public List<MemberVO> getBlockMemberList();
	public void memberBlockRelease(String memberEmail);
}
