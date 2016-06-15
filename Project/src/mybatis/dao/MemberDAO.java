package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.sun.org.apache.xalan.internal.xsltc.compiler.Template;

import mybatis.vo.MemberVO;

	/*
	제 목 : TestDAO
	역 할 : id검색, 로그인, 회원가입 등등을 한다.
	로 그 : 프로그램 최초 생성 (장준수 2016/06/08)
	*/
public class MemberDAO {

	@Autowired
	SqlSessionTemplate template;
	

	/* 비니지스 로직들 */
	
	// 회원가입(장준수 2016/06/08)
	public MemberVO addMember(MemberVO vo) {
		template.insert("test.add", vo);
		return vo;

	}
	
	
	// 로그인	(장준수 2016/06/09)
	public MemberVO loginMember(MemberVO vo){
		MemberVO v = template.selectOne("test.login", vo);
		return v;
	}
	
	// id검색(장준수 2016/06/13)
	public MemberVO idCheck(String n){
		MemberVO vo = template.selectOne("test.check", n);
		return vo;
	}
	
	// 코인 충전(장준수 2016/06/14)
	public MemberVO addCoin(MemberVO vo){
		template.update("test.addCoin",vo);
		return vo;
		
	}
	
	// iD/PW찾기(박상원 2016/06/15)
		public MemberVO idsearch(MemberVO vo){
			MemberVO vo1 = template.selectOne("test.idsearch",vo);
			return vo1;
		}
		
		// iD/PW찾기(박상원 2016/06/15)
		public MemberVO pwdsearch(MemberVO vo){
			MemberVO vo1 = template.selectOne("test.pwdsearch",vo);
			return vo1;
			}
		
	}


