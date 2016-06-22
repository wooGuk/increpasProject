 
		/*제 목 : NoticeControl.java
		역 할 : 공지사항 게시판컨트롤러
		로 그 :  1.프로그램 최초 생성 (박상원 2016/06/22)
			-> 페이징기법 적용해주고, 공지사항을 쓰는 jsp페이지로 이동시켜주는 역할
			
		*/
package spring.control;

import java.util.HashMap;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.NoticeDAO;
import mybatis.vo.MemberVO;
import mybatis.vo.NoticeVO;
import spring.include.Paging;

@Controller
public class NoticeControl {

	@Autowired
	private NoticeDAO noti_dao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpServletResponse response;
	
	@Autowired
	HttpSession session;
	
	
	// 페이징 기법에 필요한 변수들
	public static final int BLOCK_LIST = 10; // 한페이지당 보여질 게시물 수(10개)
	public static final int BLOCK_PAGE = 5; // 한블럭당 보여질 페이지 수(5장)
	
	int nowPage; // 현재 페이지
	int rowTotal; // 총 게시물의 수
	String PageCode; // 페이징 처리된 HTML코드
	
	String searchType, searchValue; // 나중에 검색 기능에 필요한 변수들
	
	
	@RequestMapping("/notice.inc")
	public ModelAndView notice(){
		// 사용자가 브러우저에서 notice.inc로 요청했을 때 수행하는 곳
		
		
		
		// 현재 페이지값 받기 *
		String c_page = request.getParameter("nowPage");
		
		if(c_page == null)
			nowPage = 1;
		else
			nowPage = Integer.parseInt(c_page);
		
		// 게시판을 구별하는 문자열 
		
		String bname = "NOTICE";
		rowTotal = noti_dao.getTotalCount(bname);
		
		
		// 페이징 객체(Page) 생성
		Paging page = new Paging(nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
		 
		// 페이징 HTML코드를 기억하는 있는 sb를 가져온다.
		StringBuffer sb = page.getSb();
		
		// HTML코드를 가져온다.
		PageCode = sb.toString();
		
		int begin = page.getBegin();
		int end = page.getEnd();
		
		if(end > rowTotal)
			end = rowTotal;
		
		// mybatis환경에 호출한 map구조를 생성한다.
		Map<String, String> map = new HashMap<String,String>();
		map.put("bname", bname);
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		
		NoticeVO[] ar = noti_dao.getList(map);
		
		// JSP에서 표현할 수 있도록 반환객체 생성 한 후
		// 그곳에서 표현할 값들을 저장한다.
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ar);
		mv.addObject("nowPage", nowPage);
		mv.addObject("pageCode", PageCode);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		
		mv.setViewName("/notice");
		
		return mv;
	}
	
	
			@RequestMapping("/writenotice.inc")
			public ModelAndView writeForm(){

				MemberVO vo = (MemberVO) session.getAttribute("vo");
				
				ModelAndView mv = new ModelAndView();
				mv.addObject("vo", vo);
				mv.setViewName("/NoWrite");
				
				return mv;
			}

}
