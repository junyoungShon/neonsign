package org.cobro.neonsign.model;

import java.util.ArrayList;
import java.util.List;

import org.cobro.neonsign.vo.MemberVO;
import org.cobro.neonsign.vo.PickedVO;

public interface MemberDAO {
	public MemberVO findMemberByEmail(String emailComp);
	public MemberVO findMemberByNickName(String nameComp);
	public int memberRegister(MemberVO mvo);
	public int memberUpdate(MemberVO mvo);
	public MemberVO memberLogin(MemberVO mvo);
	public MemberVO memberDelete(MemberVO mvo);
	public ArrayList<MemberVO> getNotifyMemberList(MemberVO mvo);
	public List<MemberVO> getMemberList(int pageNo);
	public void memberBlock(String memberEmail);
	public List<MemberVO> getBlockMemberList(int pageNo);
	public void memberBlockRelease(String memberEmail);
	public PickedVO selectPickedVO(PickedVO pvo);
	public int insertPickedVO(PickedVO pvo);
	public int deletePickedVO(PickedVO pvo);
	public List<PickedVO> getPickListByMemberEmail(String memberEmail);
	public MemberVO defaultMemberLogin(MemberVO memberVO);
	public int allMembers();
	public int allBlockMembers();
}
