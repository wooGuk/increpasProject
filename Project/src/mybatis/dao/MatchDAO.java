package mybatis.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.sun.org.apache.xalan.internal.xsltc.compiler.Template;

import mybatis.vo.MatchVO;
import mybatis.vo.MemberVO;
/*
	제 목 : MatchDAO
	역 할 : Match DB에서 경기 일정을 가져오는 역할을 한다.
	로 그 : 1.프로그램 최초 생성 (오우석 2016/06/09)
			2.당일 경기, 지난 경기일자 불러오기(오우석 2016/06/09)
			3.getToatalCount() 메소드 추가, scheduleEnd() 메소드 수정(오우석 2016/06/12)
			  1)getToatalCount() 은 지난 경기 데이터의 수가 총 몇인지 확인하려는 데이터
			  2)scheduleEnd() 정해진 갯수 만큼 가져 와야 되기 때문 map구조를 이용
		    4.schedule() 메소드 추가(경기일정 모두 가져오기)(오우석 2016/06/13)
*/
public class MatchDAO {

	@Autowired
	SqlSessionTemplate template;
	

	/* 비니지스 로직들 */
	public int getRoundCount() {
		// 인자값은 게시판의 종류이다. 게시판의 값은 "BBS"라고 정한다.
		return template.selectOne("match.roundCount");
	}
	
	// 전체게신물의 수를 반환하는 메소드 오우석 2016/06/12
	public int getToatalCount() {
		// 인자값은 게시판의 종류이다. 게시판의 값은 "BBS"라고 정한다.
		return template.selectOne("match.totalCount");
	}
	
	
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
	public MatchVO[] scheduleEnd(Map<String, String> map){
		//페이징을 위한 begin과 end가 있어야 함으로 map구조를 이용하는 것으로 변경 오우석 2016/06/12
		List<MatchVO> list = template.selectList("match.matchEnd",map);
		MatchVO[] games = null;
		
		if(list != null || !(list.isEmpty())){
			games = new MatchVO[list.size()];
			list.toArray(games);
		}
		System.out.println(list.size());
		return games;
	}
	//경기일정 모두 가져오기 오우석 2016/06/13
	public MatchVO[] schedule(){
		List<MatchVO> list = template.selectList("match.schedule");
		MatchVO[] games = null;
		
		if(list != null || !(list.isEmpty())){
			games = new MatchVO[list.size()];
			list.toArray(games);
		}
		System.out.println(list.size());
		return games;
	}

}
