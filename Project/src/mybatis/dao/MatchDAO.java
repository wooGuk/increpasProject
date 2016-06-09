package mybatis.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.sun.org.apache.xalan.internal.xsltc.compiler.Template;

import mybatis.vo.MatchVO;
import mybatis.vo.TestVO;
/*
	제 목 : MatchDAO
	역 할 : Match DB에서 경기 일정을 가져오는 역할을 한다.
	로 그 : 1.프로그램 최초 생성 (오우석 2016/06/09)
			2.당일 경기, 지난 경기일자 불러오기(오우석 2016/06/09)
*/
public class MatchDAO {

	@Autowired
	SqlSessionTemplate template;
	

	/* 비니지스 로직들 */
	//오늘일자 경기 불러오기 오우석 2016/06/09
	public MatchVO[] scheduleToday(){
		
		List<MatchVO> list = new ArrayList<MatchVO>();
		MatchVO[] games = null;
		
		list = template.selectList("match.matchToday");
		if(list != null || !(list.isEmpty())){
			games = new MatchVO[list.size()];
			list.toArray(games);
		}
		return games;
	}
	//지난경기일자 불러오기 오우석 2016/06/09
	public MatchVO[] scheduleEnd(){
		
		List<MatchVO> list = new ArrayList<MatchVO>();
		MatchVO[] games = null;
		
		list = template.selectList("match.matchEnd");
		if(list != null || !(list.isEmpty())){
			games = new MatchVO[list.size()];
			list.toArray(games);
		}
		return games;
	}

}
