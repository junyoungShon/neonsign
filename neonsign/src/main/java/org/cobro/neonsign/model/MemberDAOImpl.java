package org.cobro.neonsign.model;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.cobro.neonsign.vo.MemberVO;
import org.cobro.neonsign.vo.PickedVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class MemberDAOImpl implements MemberDAO{
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public MemberVO findMemberByEmail(String emailComp) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("member.findMemberByEmail", emailComp);
	}

	@Override
	public MemberVO findMemberByNickName(String nameComp) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("member.findMemberByNickName", nameComp);
	}

	@Override
	public int memberRegister(MemberVO memberVO) {
		return sqlSessionTemplate.insert("member.memberRegister",memberVO);
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberVO memberLogin(MemberVO memberVO) {
		return sqlSessionTemplate.selectOne("member.memberLogin",memberVO);
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
	public List<MemberVO> getMemberList() {
		System.out.println("getMemberList 실행");
		List<MemberVO> list=null;
		try{
		list=sqlSessionTemplate.selectList("member.RegisterMemberList");
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void memberBlock(String memberEmail) {
		// TODO Auto-generated method stub
		try{
			sqlSessionTemplate.update("member.memberBlock",memberEmail);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	@Override
	/**
	 * 불량회원 리스트를 받아오는 메서드
	 */
	public List<MemberVO> getBlockMemberList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member.blockMemberList");
	}

	@Override
	public void memberBlockRelease(String memberEmail) {
		// TODO Auto-generated method stub
		System.out.println(memberEmail);
		sqlSessionTemplate.update("member.memberBlockRelease",memberEmail);
	}


	/**
	 * pickedVO가 없는 초기 회원의 로그인을 위한 디폴트 로그인
	 * @author junyoung
	 */
	@Override
	public MemberVO defaultMemberLogin(MemberVO memberVO) {
		System.out.println(memberVO);
		return sqlSessionTemplate.selectOne("member.defaultMemberLogin", memberVO);
	}
	
	/**
	 * 찜 여부 확인
	 * @author JeSeong Lee
	 */
	@Override
	public PickedVO selectPickedVO(PickedVO pvo) {
		return sqlSessionTemplate.selectOne("member.selectPickedVO", pvo);
	}
	
	/**
	 * 찜 여부 확인 후 찜 등록
	 * @author JeSeong Lee
	 */
	@Override
	public int insertPickedVO(PickedVO pvo) {
		return sqlSessionTemplate.insert("member.insertPickedVO", pvo);
	}
	/**
	 * 찜 여부 확인 후 찜 삭제
	 * @author JeSeong Lee
	 */
	@Override
	public int deletePickedVO(PickedVO pvo) {
		return sqlSessionTemplate.delete("member.deletePickedVO", pvo);
	}
	/**
	 * email로 찜리스트 받아옴
	 * @author JeSeong Lee
	 */
	@Override
	public List<PickedVO> getPickListByMemberEmail(String memberEmail) {
		return sqlSessionTemplate.selectList("member.getPickListByMemberEmail", memberEmail);
	}
}
