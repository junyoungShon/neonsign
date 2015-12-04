package org.cobro.neonsign.model;

import java.util.ArrayList;
import java.util.List;

import org.cobro.neonsign.vo.MemberVO;
import org.cobro.neonsign.vo.PickedVO;

public interface MemberDAO {
	public MemberVO findMemberByEmail(String emailComp);
	public MemberVO findMemberByNickName(String nameComp);
	public int memberRegister(MemberVO mvo);
	public int memberUpdate(MemberVO memberVO);
	public MemberVO memberLogin(MemberVO mvo);
	public String memberDelete(MemberVO memberVO);
	public ArrayList<MemberVO> getNotifyMemberList(MemberVO mvo);
	public List<MemberVO> getMemberList();
	public void memberBlock(String memberEmail);
	public List<MemberVO> getBlockMemberList();
	public void memberBlockRelease(String memberEmail);
	public PickedVO selectPickedVO(PickedVO pvo);
	public int insertPickedVO(PickedVO pvo);
	public int deletePickedVO(PickedVO pvo);
	public List<PickedVO> getPickListByMemberEmail(String memberEmail);
	public MemberVO defaultMemberLogin(MemberVO memberVO);
	public MemberVO findByPassword(String checkPassComp);
}
