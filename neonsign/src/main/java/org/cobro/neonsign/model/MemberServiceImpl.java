package org.cobro.neonsign.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.cobro.neonsign.vo.MemberListVO;
import org.cobro.neonsign.vo.MemberVO;
import org.cobro.neonsign.vo.PagingBean;
import org.cobro.neonsign.vo.PickedVO;
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
	public MemberVO memberLogin(MemberVO memberVO) {
		return memberDAO.memberLogin(memberVO);
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
	public MemberListVO getMemberList(int pageNo) {
		// TODO Auto-generated method stub
		PagingBean pb=null;
		ArrayList<MemberVO> members=(ArrayList<MemberVO>)memberDAO.getMemberList(pageNo);
		int totalReports=memberDAO.allMembers();
		if(pageNo!=0){
		pb= new PagingBean(totalReports, pageNo);
		}else{
			pb= new PagingBean(totalReports);
		}
		MemberListVO memberList=new MemberListVO(members,pb);
		return memberList;
	}

	/**
	 * 불량 회원 리스트를 받아오는 메서드
	 * @author 장1솔
	 */
	public MemberListVO getBlockMemberList(int pageNo){
		PagingBean pb=null;
		ArrayList<MemberVO> blokcMembers=(ArrayList<MemberVO>)memberDAO.getBlockMemberList(pageNo);
		int totalReports=memberDAO.allBlockMembers();
		if(pageNo!=0){
		pb= new PagingBean(totalReports, pageNo);
		}else{
			pb= new PagingBean(totalReports);
		}
		MemberListVO blockMemberList=new MemberListVO(blokcMembers,pb);
		return blockMemberList;
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
	
	/**
	 * 찜 여부 확인 후 찜 등록 및 제거
	 * @author JeSeong Lee
	 */
	@Override
	public String updatePickedVO(PickedVO pvo) {
		System.out.println(memberDAO.selectPickedVO(pvo));
		if(memberDAO.selectPickedVO(pvo) == null){
			memberDAO.insertPickedVO(pvo);
			return "insert";
		} else{
			memberDAO.deletePickedVO(pvo);
			return "delete";
		}
	}
	
	/**
	 * email로 찜한글 리스트 받기
	 * @author JeSeong Lee
	 */
	@Override
	public List<PickedVO> getPickListByMemberEmail(String memberEmail) {
		return memberDAO.getPickListByMemberEmail(memberEmail);
	}
	
	@Override
	public MemberVO findByPassword(String checkPassComp) {
		// TODO Auto-generated method stub
		//System.out.println("Service:"+checkPassComp);
		return memberDAO.findByPassword(checkPassComp);
	}
	
	@Override
	public int memberUpdate(MemberVO memberVO) {
		
		return memberDAO.memberUpdate(memberVO);
	} 
	
	@Override
	public String memberDelete(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return memberDAO.memberDelete(memberVO);
	}
	
}
