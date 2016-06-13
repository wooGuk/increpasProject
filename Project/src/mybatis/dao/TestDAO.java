package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.sun.org.apache.xalan.internal.xsltc.compiler.Template;

import mybatis.vo.MemberVO;
import mybatis.vo.TestVO;

public class TestDAO {

	@Autowired
	SqlSessionTemplate template;
	

	/* 비니지스 로직들 */

	public TestVO addMember(TestVO vo) {
		template.insert("test.add", vo);
		return vo;

	}

	public TestVO loginMember(TestVO vo){
		TestVO v = template.selectOne("test.login", vo);
		return v;
	}
	
	public MemberVO loginMember2(MemberVO vo){
		MemberVO v = template.selectOne("test.login2", vo);
		if(v !=null){
			System.out.println("일치하는 정보가 있습니다.");
		}else{
			System.out.println("일치하는 정보가 없습니다.");
		}
		return v;
	}

}
