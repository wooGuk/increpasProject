package mybatis.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.MemberVO;
/*
제 목 : MatchDAO
역 할 : batting DB에서 경기 일정을 가져오는 역할을 한다.
로 그 : 1.프로그램 최초 생성 (오우석 2016/06/21)
		2.코인체크 메소드 추가 오우석(2016/06/24)
		
*/
public class BatDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public boolean insertBat(Map<String, Object> map){
		int cnt = template.insert("batting.add",map);
		if(cnt==0)
			return false;
		else
			return true;
	}
	//코인체크 메소드 추가 오우석(2016/06/24)
	public boolean checkCoin(Map<String, Object> map){
		MemberVO vo = template.selectOne("batting.checkCoin", map);
		
		if(vo != null){
			return true;
		}else{
			return false;
		}
	}
}
