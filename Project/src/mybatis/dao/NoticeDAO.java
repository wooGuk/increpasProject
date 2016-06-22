package mybatis.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.sun.org.apache.xalan.internal.xsltc.compiler.Template;

import mybatis.vo.NoticeVO;
/*
제 목 : NoticeDAO
역 할 : 공지사항
로 그 : 프로그램 최초 생성 (박상원 2016/06/22)
		1.  6/22 현재 공지사항 게시판 글쓰기와 리스트보기만 가능~
*/


public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	/*비니지스 로직들*/
	
	// 전체게시물의 수를 반환하는 메서드
	public int getTotalCount(String n){
		// 인자인 n은 게시판의 종류를 판단하는 인자다. /"notice"
		return template.selectOne("notice.totalCount",n);
	}
	
	// 리스트 화면을 위한 목록화 메서드 (ListControl에서 호출)
	public NoticeVO[] getList(Map<String, String> map){
		
		List<NoticeVO> list = template.selectList("notice.list",map);
		
		// 받은 list구조를 다시 배열로 변환
		NoticeVO[] ar = null;
		if(list != null && list.size() > 0){
			ar = new NoticeVO[list.size()];
			
			// list구조에 있는 요소들을 그대로 ar이라는 배열에 복사하기
			list.toArray(ar);
		}
		return ar;
	}
	
	// 원글 저장 메서드
	public boolean writenotice(NoticeVO vo){
		
		
		int cnt = template.insert("notice.write",vo);
		if(cnt > 0)
			return true;
		else
			return false;
	}
	
	// 기본키로 게시물을 보는 메서드
	public NoticeVO getnotice(String seq){
		
		NoticeVO vo = template.selectOne("notice.getnotice",seq);

		return vo;
	}
	
	public void editnotice(NoticeVO vo){
		
		template.update("notice.edit", vo);
	
	}
	
	// 답변저장시 lev를 조정하는 기능
	public void updateLev(Map<String, String> map){
		template.update("notice.updateLev",map);
	};
	
	// 답변 저장
	public void addAns(NoticeVO vo){
		template.insert("notice.addAns",vo);
	}
	
	// 삭제
	public void delnotice(NoticeVO vo){
		template.update("notice.delnotice",vo);
	}
		
	
}
