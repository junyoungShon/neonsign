package org.cobro.neonsign.model;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.cobro.neonsign.vo.MemberVO;
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
	public ArrayList<MemberVO> getMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

	
}
