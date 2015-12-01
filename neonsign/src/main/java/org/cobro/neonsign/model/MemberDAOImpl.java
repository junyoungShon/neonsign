package org.cobro.neonsign.model;

import java.util.ArrayList;
import java.util.List;

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
	
}
