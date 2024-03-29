package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.sun.org.apache.xalan.internal.xsltc.compiler.Template;

import mybatis.vo.BatVO;
import mybatis.vo.MemberVO;

	/*
	제 목 : MemberDAO
	역 할 : id검색, 로그인, 회원가입 등등을 한다.
	로 그 : 프로그램 최초 생성 (장준수 2016/06/08)
			2.코인삭감(오우석 2016/06/21)
			3. 베팅목록 수정 (장준수 2016/06/27)
	*/
public class MemberDAO {

	@Autowired
	SqlSessionTemplate template;
	

	/* 비니지스 로직들 */
	
	// 회원가입(장준수 2016/06/08)
	public MemberVO addMember(MemberVO vo) {
		template.insert("mem.add", vo);
		return vo;

	}
	
	
	// 로그인	(장준수 2016/06/09)
	public MemberVO loginMember(MemberVO vo){
		MemberVO v = template.selectOne("mem.login", vo);
		return v;
	}
	
	// id검색(장준수 2016/06/13)
	public MemberVO idCheck(String n){
		MemberVO vo = template.selectOne("mem.check", n);
		return vo;
	}
	
	// 코인 충전(장준수 2016/06/14)
	public MemberVO addCoin(MemberVO vo){
		template.update("mem.addCoin",vo);
		return vo;
		
	}
	
	// iD/PW찾기(박상원 2016/06/15)
		public MemberVO idsearch(MemberVO vo){
			MemberVO vo1 = template.selectOne("mem.idsearch",vo);
			return vo1;
		}
		
		// iD/PW찾기(박상원 2016/06/15)
		public MemberVO pwdsearch(MemberVO vo){
			MemberVO vo1 = template.selectOne("mem.pwdsearch",vo);
			return vo1;
			}
		
		
		
		// 회원수정(장준수 2016/06/21)
		public MemberVO memEdit(MemberVO vo){
			template.update("mem.memEdit",vo);
			return vo;
		}
		
		// 회원탈퇴(장준수 2016/06/21)
		public MemberVO memDel(MemberVO vo){
			template.update("mem.memDel",vo);
			return vo;
		}
		
		// 코인삭감(오우석 2016/06/21)
		public void delCoin(Map<String, Object> map){
			template.update("mem.delcoin", map);
		}
		
		// 베팅목록 가져오기(장준수 2016/06/27)
		public BatVO[] batList(Map<String, String> map) {
			List<BatVO> list = template.selectList("mem.batList", map);
			BatVO[] v1 = null;
			if (!list.isEmpty()) {
				v1 = new BatVO[list.size()];
				list.toArray(v1);
			}
			return v1;
		}
		
		// 유저가 베팅한 목록 
		public int getBat(String id){
			return template.selectOne("mem.batCount",id);
		}
		
		// 구매 취소(2016/06/29 장준수)
		public void delBat(int code){
			template.update("mem.delBat",code);
		}
		
		// 경기취소  금액 받기 (2016/06/29 장준수)
		public MemberVO returnCoin(MemberVO vo){
			template.update("mem.returnCoin",vo);
			return vo;
		}
		
		// 베팅금 중복체크(2016/07/06 장준수)
		public void checkBat(int code){
			template.update("mem.checkBat",code);
		}
		
		// 베팅금액 받기 (2016/07/06 장준수)
		public MemberVO BatCost(MemberVO vo){
			template.update("mem.costCoin",vo);
			return vo;
		}

	}


