package mybatis.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
/*
제 목 : MatchDAO
역 할 : batting DB에서 경기 일정을 가져오는 역할을 한다.
로 그 : 1.프로그램 최초 생성 (오우석 2016/06/21)
		
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
}
