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

public class MatchDAO {

	@Autowired
	SqlSessionTemplate template;
	

	/* 비니지스 로직들 */

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

}
