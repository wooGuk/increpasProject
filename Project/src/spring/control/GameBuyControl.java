	/*
	제 목 : GameBuyControl.java
	역 할 : 게임구매 탭의 기능을 수행할 컨트롤러
	로 그 : 1.프로그램 최초 생성,당일 경기 리스트 불러오기 구현 (오우석 2016/06/09)
			2.지난경기 불러오기 기능 추가(오우석 2016/06/10)
			3.모든경기 불러오기 기능 추가(오우석 2016/06/13)
			4.종료된 게임에서 세부사항을 보내주는 컨트롤러 오우석(2016/06/20)
			5.선발투수 값 넘기기 오우석(2016/06/21)
			6.코인체크 메소드 컨트롤러 추가 오우석(2016/06/24)
			7.분석글 불러오기(정성훈 2016.06.27)
			8.세션처리(정성훈 2016.06.27)
			9.팀정보 추가(오우석 2016.06.27)
			10.detail메소드 gamebuy와 동일한 로직으로 변경(분석글 제외) 오우석(2016/06/29)
			11.지난 게임과 게임 일정 페이징 기법으로 수정 오우석(2016/07/04)
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
import mybatis.dao.FreeBoardDAO;
import mybatis.dao.MatchDAO;
import mybatis.dao.MemberDAO;
import mybatis.dao.TeamDAO;
import mybatis.vo.BatVO;
import mybatis.vo.FreeBoardVO;
import mybatis.vo.MatchVO;
import mybatis.vo.MemberVO;
import mybatis.vo.TeamVO;
import spring.include.Paging;
import spring.include.Paging_board;
import spring.include.Paging_game;
import spring.include.Paging_gameScedule;

@Controller
public class GameBuyControl {
	
	@Autowired
	MatchDAO mDao;
	
	@Autowired
	MemberDAO memDao;
	
	@Autowired
	BatDAO bDao;
	//오우석 추가(2016.06.27)
	@Autowired
	TeamDAO tDao;
	//정성훈 추가(2016.06.27)
	@Autowired
	FreeBoardDAO fdao;
	
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
		String alert="";
		if(request.getAttribute("alert") != null){
			alert=(String)request.getAttribute("alert");
		}
		mv.addObject("games", games);
		mv.addObject("alert", alert);
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
		Paging_game page = new Paging_game(nowPage, rowTotal, BLOCK_LIST, BLOCK_LIST);
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
		Paging_gameScedule  page = new Paging_gameScedule(nowPage, rowTotal, BLOCK_LIST, BLOCK_LIST);
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
		MatchVO[] games = mDao.schedule(map);
		
		mv.addObject("games", games);
		mv.addObject("nowPage", nowPage);
		mv.addObject("pageCode", pageCode);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("block_list", BLOCK_LIST);
		mv.setViewName("gameSchedule");
		return mv;
	}
	
	// 종료된 게임에서 세부사항을 보내주는 컨트롤러 오우석(2016/06/20)
	// gamebuy와 동일한 로직으로 변경(분석글 제외) 오우석(2016/06/29)
	@RequestMapping("/detailGame.inc")
	public ModelAndView detail(){
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
		
		//team정보 받아오기
		TeamVO homeTeam,awayTeam;
		homeTeam = tDao.getTeamHA(vo.getHome_code());
		awayTeam = tDao.getTeamHA(vo.getAway_code());
		
		//승패 계산하기 위한 로직
		total = vsGames.length;
		for(int i=0;i<total;i++){
			if(vsGames[i].getResult()==vsGames[i].getHome_code()){
				win++;
			}else{
				lose++;
			}
		}
		
		
		//(정성훈 2016.06.27 추가시작)
		// 현재 페이지값 받기 *
//		String c_page = request.getParameter("nowPage");
//		System.out.println("fbc:"+c_page);
//		
//		if(c_page == null)
//			nowPage = 1;
//		else
//			nowPage = Integer.parseInt(c_page);
//		
//		// 게시판을 구별하는 문자열 
//		String bname = String.valueOf(vo.getMatch_code());
//		rowTotal = fdao.getTotalCount(bname);
//		//System.out.println(bname);
//		//System.out.println(rowTotal);
//		// 페이징 객체(Page) 생성
//		Paging_board page = new Paging_board(nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
//		 
//		// 페이징 HTML코드를 기억하는 있는 sb를 가져온다.
//		StringBuffer sb = page.getSb();
//		
//		// HTML코드를 가져온다.
//		pageCode = sb.toString();
//		
//		int begin = page.getBegin();
//		int end = page.getEnd();
//		
//		if(end > rowTotal)
//			end = rowTotal;
//		
//		// mybatis환경에 호출한 map구조를 생성한다.
//		Map<String, String> map2 = new HashMap<String,String>();
//		map2.put("bname", bname);
//		map2.put("begin", String.valueOf(begin));
//		map2.put("end", String.valueOf(end));
//		
//		FreeBoardVO[] ar = fdao.getList(map2);
//		session.setAttribute("anslist", ar);
//		
//		// JSP에서 표현할 수 있도록 반환객체 생성 한 후 그곳에서 표현할 값들을 저장한다.
//		mv.addObject("list", ar);
//		mv.addObject("nowPage", nowPage);
//		mv.addObject("pageCode", pageCode);
//		mv.addObject("rowTotal", rowTotal);
//		mv.addObject("blockList", BLOCK_LIST);
		//(정성훈 2016.06.27 추가종료)
		mv.addObject("game", vo);
		mv.addObject("vsGame",vsGames);
		mv.addObject("total", total);
		mv.addObject("win", win);
		mv.addObject("lose", lose);
		//팀정보 추가(오우석 2016.06.27)
		mv.addObject("homeTeam", homeTeam);
		mv.addObject("awayTeam", awayTeam);
		
		//세션에 추가(정성훈 2016.06.27)
//		session.setAttribute("game", vo);
//		session.setAttribute("vsGame",vsGames);
//		session.setAttribute("total", total);
//		session.setAttribute("win", win);
//		session.setAttribute("lose", lose);
//		session.setAttribute("list", ar);
//		session.setAttribute("nowPage", nowPage);
//		session.setAttribute("pageCode", pageCode);
//		session.setAttribute("rowTotal", rowTotal);
//		session.setAttribute("blockList", BLOCK_LIST);
		//세션에 팀정보 추가(오우석 2016.06.27)
		session.setAttribute("homeTeam", homeTeam);
		session.setAttribute("awayTeam", awayTeam);
		
		
		mv.setViewName("detailGame"); //상대전적시 필요한 배열
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
		
		//team정보 받아오기
		TeamVO homeTeam,awayTeam;
		homeTeam = tDao.getTeamHA(vo.getHome_code());
		awayTeam = tDao.getTeamHA(vo.getAway_code());
		
		//승패 계산하기 위한 로직
		total = vsGames.length;
		for(int i=0;i<total;i++){
			if(vsGames[i].getResult()==vsGames[i].getHome_code()){
				win++;
			}else{
				lose++;
			}
		}
		
		
		//(정성훈 2016.06.27 추가시작)
		// 현재 페이지값 받기 *
		String c_page = request.getParameter("nowPage");
		System.out.println("fbc:"+c_page);
		
		if(c_page == null)
			nowPage = 1;
		else
			nowPage = Integer.parseInt(c_page);
		
		// 게시판을 구별하는 문자열 
		String bname = String.valueOf(vo.getMatch_code());
		rowTotal = fdao.getTotalCount(bname);
		//System.out.println(bname);
		//System.out.println(rowTotal);
		// 페이징 객체(Page) 생성
		Paging_board page = new Paging_board(nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
		 
		// 페이징 HTML코드를 기억하는 있는 sb를 가져온다.
		StringBuffer sb = page.getSb();
		
		// HTML코드를 가져온다.
		pageCode = sb.toString();
		
		int begin = page.getBegin();
		int end = page.getEnd();
		
		if(end > rowTotal)
			end = rowTotal;
		
		// mybatis환경에 호출한 map구조를 생성한다.
		Map<String, String> map2 = new HashMap<String,String>();
		map2.put("bname", bname);
		map2.put("begin", String.valueOf(begin));
		map2.put("end", String.valueOf(end));
		
		FreeBoardVO[] ar = fdao.getList(map2);
		session.setAttribute("anslist", ar);
		
		// JSP에서 표현할 수 있도록 반환객체 생성 한 후 그곳에서 표현할 값들을 저장한다.
		mv.addObject("list", ar);
		mv.addObject("nowPage", nowPage);
		mv.addObject("pageCode", pageCode);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		//(정성훈 2016.06.27 추가종료)
		
		
		
		
		System.out.println(vsGames.length);
		mv.addObject("game", vo);
		mv.addObject("vsGame",vsGames);
		mv.addObject("total", total);
		mv.addObject("win", win);
		mv.addObject("lose", lose);
		//팀정보 추가(오우석 2016.06.27)
		mv.addObject("homeTeam", homeTeam);
		mv.addObject("awayTeam", awayTeam);
		
		//세션에 추가(정성훈 2016.06.27)
		session.setAttribute("game", vo);
		session.setAttribute("vsGame",vsGames);
		session.setAttribute("total", total);
		session.setAttribute("win", win);
		session.setAttribute("lose", lose);
		session.setAttribute("list", ar);
		session.setAttribute("nowPage", nowPage);
		session.setAttribute("pageCode", pageCode);
		session.setAttribute("rowTotal", rowTotal);
		session.setAttribute("blockList", BLOCK_LIST);
		//세션에 팀정보 추가(오우석 2016.06.27)
		session.setAttribute("homeTeam", homeTeam);
		session.setAttribute("awayTeam", awayTeam);
		
		
		mv.setViewName("gamebuy"); //상대전적시 필요한 배열
		return mv;
	}
	@RequestMapping("/buy.inc")
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
		
//		boolean doublecheck = bDao.checkBat(map);
//		if(!doublecheck){
//			MemberVO vo=(MemberVO)session.getAttribute("vo");
//			vo.setCoin(vo.getCoin()-Integer.parseInt(request.getParameter("coin")));
//			session.setAttribute("vo", vo);
//			mv.addObject("alert", "이미 거래한 게임입니다");
//		}else{
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
//		}
		
		//경고창 띄워야됨
		mv.setViewName("redirect:/todaylist.inc");
		return mv;
	}
	
	@RequestMapping("/checkCoin.inc")
	public ModelAndView checkCoin(){
		String id = request.getParameter("id");
		int coin = Integer.parseInt(request.getParameter("coin"));
		String msg;
		if(coin < 1000){
			msg = "1000원이상구매가능";
		}else{
			System.out.println("여기는 들어옴??");
			Map<String, Object> map = new HashMap<>();
			map.put("id", id);
			map.put("coin", coin);
			boolean check = bDao.checkCoin(map);
	
			msg = "소지코인부족";
			if (check)
				msg = "구매가능합니다.";
			System.out.println(msg);
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.setViewName("/include/view");
		return mv;
	}
}
