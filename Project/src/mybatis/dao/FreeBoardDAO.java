package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.sun.org.apache.xalan.internal.xsltc.compiler.Template;

import mybatis.vo.FreeBoardVO;
import mybatis.vo.FreeCommVO;
/*
	제 목 : FreeBoardDAO
	역 할 : 글리스트, 글쓰기 ,글보기, 글삭제 등등
	로 그 : 자유게시판 (장준수 2016/06/22)
		
*/
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
	public FreeBoardVO writeBbs(FreeBoardVO vo){
		template.insert("board.write", vo);
		return vo;
	}

	
	//댓글 저장 메서드
	public FreeCommVO addAns(FreeCommVO vo){
		template.insert("board.addAns", vo);
		return vo;
	}
	
	// 기본키로 게시물을 보는 메서드
	public FreeBoardVO getBbs(String seq){
		FreeBoardVO vo = template.selectOne("board.getBbs",seq);
		return vo;
	}
	
	// 원글삭제
	public void delBbs(FreeBoardVO vo){
		template.update("board.delBbs",vo);
	}
	
	// 댓글 삭제
	public void comDel(FreeCommVO vo){
		template.update("board.comDel",vo);
	}
	
	// 원글 수정
	public void editBbs(FreeBoardVO vo1){
		
		template.update("board.edit", vo1);
	
	}
	/*
	// 답변저장시 lev를 조정하는 기능
	public void updateLev(Map<String, String> map){
		template.update("board.updateLev",map);
	};
	
	// 답변 저장
	public void addAns(FreeBoardVO vo){
		template.insert("board.addAns",vo);
	}
	
		*/
	
}
