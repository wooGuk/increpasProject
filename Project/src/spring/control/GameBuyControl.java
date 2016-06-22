	/*
	제 목 : GameBuyControl.java
	역 할 : 게임구매 탭의 기능을 수행할 컨트롤러
	로 그 : 1.프로그램 최초 생성,당일 경기 리스트 불러오기 구현 (오우석 2016/06/09)
			2.지난경기 불러오기 기능 추가(오우석 2016/06/10)
			3.모든경기 불러오기 기능 추가(오우석 2016/06/13)
			4.종료된 게임에서 세부사항을 보내주는 컨트롤러 오우석(2016/06/20)
			5.선발투수 값 넘기기 오우석(2016/06/21)
	*/
package spring.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.BatDAO;
import mybatis.dao.MatchDAO;
import mybatis.dao.MemberDAO;
import mybatis.vo.BatVO;
import mybatis.vo.MatchVO;
import mybatis.vo.MemberVO;
import spring.include.Paging;

@Controller
public class GameBuyControl {
	
	@Autowired
	MatchDAO mDao;
	
	@Autowired
	MemberDAO memDao;
	
	@Autowired
	BatDAO bDao;
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	
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
		MatchVO[] games = mDao.matchPos();
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
		
		
		rowTotal = mDao.getRoundCount();
		
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
	
	//모든경기 불러오기 오우석 2016/06/13
	@RequestMapping("/gamescedule.inc")
	public ModelAndView scheduleList(){

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
		MatchVO[] games = mDao.schedule();
		
		mv.addObject("games", games);
		mv.addObject("nowPage", nowPage);
		mv.addObject("pageCode", pageCode);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("block_list", BLOCK_LIST);
		mv.setViewName("gameSchedule");
		return mv;
	}
	
	// 종료된 게임에서 세부사항을 보내주는 컨트롤러 오우석(2016/06/20)
	@RequestMapping("/detailGame.inc")
	public ModelAndView detail(){
		ModelAndView mv = new ModelAndView();
		MatchVO vo = new MatchVO();
		vo.setMatch_code(Integer.parseInt(request.getParameter("match_code")));
		vo.setHome_code(Integer.parseInt(request.getParameter("home_code")));
		vo.setAway_code(Integer.parseInt(request.getParameter("away_code")));
		vo.setResult(Integer.parseInt(request.getParameter("result")));
		vo.setMatch_year(Integer.parseInt(request.getParameter("match_year")));
		vo.setMatch_month(Integer.parseInt(request.getParameter("match_month")));
		vo.setMatch_day(Integer.parseInt(request.getParameter("match_day")));
		vo.setMatch_hour(Integer.parseInt(request.getParameter("match_hour")));
		
		mv.addObject("game", vo);
		mv.setViewName("detailGame");
		return mv;
	}
	
	// 게임구매 클릭시 나오는 세부사항 세팅 컨트롤러 오우석(2016/06/20)
	// 상대전적을 구하기위한 과정 추가 오우석 (2016/06/22)
	@RequestMapping("/buyGame.inc")
	public ModelAndView gameBuy(){
		int win=0,lose=0,total=0;
		ModelAndView mv = new ModelAndView();
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("home_code", Integer.parseInt(request.getParameter("home_code")));
		map.put("away_code", Integer.parseInt(request.getParameter("away_code")));
		MatchVO[] vsGames=mDao.vsMatch(map);
		
		MatchVO vo = new MatchVO();
		vo.setMatch_code(Integer.parseInt(request.getParameter("match_code")));
		vo.setHome_code(Integer.parseInt(request.getParameter("home_code")));
		vo.setAway_code(Integer.parseInt(request.getParameter("away_code")));
		vo.setResult(Integer.parseInt(request.getParameter("result")));
		vo.setMatch_year(Integer.parseInt(request.getParameter("match_year")));
		vo.setMatch_month(Integer.parseInt(request.getParameter("match_month")));
		vo.setMatch_day(Integer.parseInt(request.getParameter("match_day")));
		vo.setMatch_hour(Integer.parseInt(request.getParameter("match_hour")));
		vo.setHome_pitcher(request.getParameter("home_pitcher"));
		vo.setAway_pitcher(request.getParameter("away_pitcher"));
		
		
		//승패 계산하기 위한 로직
		total = vsGames.length;
		for(int i=0;i<total;i++){
			if(vsGames[i].getResult()==vsGames[i].getHome_code()){
				win++;
			}else{
				lose++;
			}
		}
		System.out.println(vsGames.length);
		mv.addObject("game", vo);
		mv.addObject("vsGame",vsGames);
		mv.addObject("total", total);
		mv.addObject("win", win);
		mv.addObject("lose", lose);
		mv.setViewName("gamebuy"); //상대전적시 필요한 배열
		return mv;
	}
	@RequestMapping("/buy")
	public ModelAndView buy(){
		ModelAndView mv = new ModelAndView();
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("match_code"));
		System.out.println(request.getParameter("result"));
		System.out.println(request.getParameter("coin"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ID", (String)request.getParameter("id"));
		map.put("MATCH_CODE", Integer.parseInt(request.getParameter("match_code")));
		map.put("RE_RESULT", Integer.parseInt(request.getParameter("result")));
		map.put("BAT_COST", Integer.parseInt(request.getParameter("coin")));
		
		boolean check = bDao.insertBat(map);
		if(check){
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("id", (String)request.getParameter("id"));
			map2.put("coin", Integer.parseInt(request.getParameter("coin")));
			memDao.delCoin(map2);
			MemberVO vo=(MemberVO)session.getAttribute("vo");
			vo.setCoin(vo.getCoin()-Integer.parseInt(request.getParameter("coin")));
			session.setAttribute("vo", vo);
		}
		
		
		//경고창 띄워야됨
		mv.setViewName("redirect:/main.inc");
		return mv;
	}
}
