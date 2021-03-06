package org.cobro.neonsign.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.cobro.neonsign.vo.MemberListVO;
import org.cobro.neonsign.vo.MemberVO;
import org.cobro.neonsign.vo.PickedVO;

public interface MemberService {
	public MemberVO findMemberByEmail(String emailComp);
	public MemberVO findMemberByNickName(String nameComp);
	public int memberRegister(MemberVO mvo);
	public int memberUpdate(MemberVO memberVO);
	public MemberVO memberLogin(MemberVO mvo);
	public String memberDelete(MemberVO mvo);
	public ArrayList<MemberVO> getNotifyMemberList(MemberVO mvo);
	public void memberBlock(String memberEmail);
	public void memberBlockRelease(String memberEmail);
	public String updatePickedVO(PickedVO pvo);
	public List<PickedVO> getPickListByMemberEmail(String memberEmail);
	public MemberVO defaultMemberLogin(MemberVO memberVO);
	public MemberListVO getBlockMemberList(int i);
	public MemberListVO getMemberList(int i);
	public MemberVO findByPassword(String mailComp);

}
