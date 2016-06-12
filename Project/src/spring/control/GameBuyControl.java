	/*
	제 목 : GameBuyControl.java
	역 할 : 게임구매 탭의 기능을 수행할 컨트롤러
	로 그 : 1.프로그램 최초 생성,당일 경기 리스트 불러오기 구현 (오우석 2016/06/09)
			2.지난경기 불러오기 기능 추가(오우석 2016/06/10)
	*/
package spring.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MatchDAO;
import mybatis.vo.MatchVO;
import spring.include.Paging;

@Controller
public class GameBuyControl {
	
	@Autowired
	MatchDAO mDao;
	
	@Autowired
	HttpServletRequest request;
	
	//페이징 기법에 필요한 변수들
	public static final int BLOCK_LIST = 10; //한페이지당 게시물 수
	public static final int BLOCK_PAGE = 5;//한 블럭당 보여질 페이지 수
	int nowPage;//현제페이지
	int rowTotal;//총 게시물의 수
	String pageCode;//페이징 처리된 HTML코드
	//나중에 검색 기능에 필요한 변수들
	String searchType, searchValue;
	
	@RequestMapping("/todaylist.inc")
	public ModelAndView showList(){
		ModelAndView mv = new ModelAndView();
		MatchVO[] games = mDao.scheduleToday();
		
		mv.addObject("games", games);
		mv.setViewName("oppGameList");
		return mv;
	}
	
	//지난경기 불러오기(오우석 2016/06/10)
	@RequestMapping("/endlist.inc")
	public ModelAndView endShowList(){
		
		String c_page = request.getParameter("nowPage");
		if(c_page == null)
			nowPage = 1;
		else
			nowPage = Integer.parseInt(c_page);
		
		
		rowTotal = mDao.getToatalCount();
		
		//페이징 객체(page) 생성
		Paging page = new Paging(nowPage, rowTotal, BLOCK_LIST, BLOCK_LIST);
		int begin = page.getBegin();
		int end = page.getEnd();
		//페이징 HTML코드를 기억하고 있는 sb를 가져온다.
		pageCode = page.getSb().toString();
		
		if(end > rowTotal)
			end = rowTotal;
		// mybatis환경에 호출한 map구조를 생성한다.
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		
		
		ModelAndView mv = new ModelAndView();
		MatchVO[] games = mDao.scheduleEnd(map);
		
		mv.addObject("games", games);
		mv.addObject("nowPage", nowPage);
		mv.addObject("pageCode", pageCode);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("block_list", BLOCK_LIST);
		mv.setViewName("endGameList");
		return mv;
	}
}
