	/*
	제 목 : TeamDAO
	역 할 : team db 테이블 접근 클래스
	로 그 : 프로그램 최초 생성 (정성훈 2016/06/20)
	       2.홈 vs 원정 팀정보 가져오기(오우석 2016/06/27)
	       3.선수정보 가져오기(오우석 2016/07/05)
	*/

package mybatis.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.MatchVO;
import mybatis.vo.PlayerVO;
import mybatis.vo.TeamVO;

public class TeamDAO {
	@Autowired
	SqlSessionTemplate template;
	
	//비지니스 로직들
	
	//팀정보 가져오기
	public TeamVO[] getTeamInfo(){
		List<TeamVO> list = new ArrayList<TeamVO>();
		TeamVO[] teams = null;
		
		list = template.selectList("team.all");
		if(list != null || !(list.isEmpty())){
			teams = new TeamVO[list.size()];
			list.toArray(teams);
		}
		return teams;
	}
	
	//홈 vs 원정 팀정보 가져오기(오우석 2016/06/27)
	public TeamVO getTeamHA(int team_code){
		TeamVO vo = template.selectOne("team.teamHA", team_code);
		return vo;
	}
	//선수정보 가져오기(오우석 2016/07/05)
	public PlayerVO choosePlayer(int index){
		PlayerVO vo = template.selectOne("team.choosePlayer",index);
		return vo;
	}
}
