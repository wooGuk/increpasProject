package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.sun.org.apache.xalan.internal.xsltc.compiler.Template;

import mybatis.vo.FreeBoardVO;

public class FreeBoardDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	/*비니지스 로직들*/
	
	// 전체게시물의 수를 반환하는 메서드
	public int getTotalCount(String n){
		// 인자인 n은 게시판의 종류를 판단하는 인자다. /"BBS"
		return template.selectOne("board.totalCount",n);
	}
	
	// 리스트 화면을 위한 목록화 메서드 (ListControl에서 호출)
	public FreeBoardVO[] getList(Map<String, String> map){
		
		List<FreeBoardVO> list = template.selectList("board.list",map);
		
		// 받은 list구조를 다시 배열로 변환
		FreeBoardVO[] ar = null;
		if(list != null && list.size() > 0){
			ar = new FreeBoardVO[list.size()];
			
			// list구조에 있는 요소들을 그대로 ar이라는 배열에 복사하기
			list.toArray(ar);
		}
		return ar;
	}
	
	// 원글 저장 메서드
	public boolean wirteBbs(FreeBoardVO vo){
		
		
		int cnt = template.insert("board.write",vo);
		if(cnt > 0)
			return true;
		else
			return false;
	}
	
	// 기본키로 게시물을 보는 메서드
	public FreeBoardVO getBbs(String seq){
		
		FreeBoardVO vo = template.selectOne("board.getBbs",seq);

		return vo;
	}
	
	public void editBbs(FreeBoardVO vo){
		
		template.update("board.edit", vo);
	
	}
	
	// 답변저장시 lev를 조정하는 기능
	public void updateLev(Map<String, String> map){
		template.update("board.updateLev",map);
	};
	
	// 답변 저장
	public void addAns(FreeBoardVO vo){
		template.insert("board.addAns",vo);
	}
	
	// 삭제
	public void delBbs(FreeBoardVO vo){
		template.update("board.delBbs",vo);
	}
		
	
}
