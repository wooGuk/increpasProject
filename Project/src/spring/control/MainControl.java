	/*
	제 목 : MainControl.java
	역 할 : 첫 시작시 메인화면 컨트롤러
	로 그 : 1.첫 시작시 메인화면으로 이동 (정성훈 2016/06/09)
			2.회원가입 페이지로 이동 (정성훈 2016/06/10) 
			3.오늘의 경기일정 보여주기 (정성훈 20161616)
			4.LoginControl, LogoutControl 기능 합침 (정성훈 20160616)
			5.아이디/비밀번호 찾기 페이지 이동 (정성훈 20160616)
			6.마이페이지 이동시 로그인 유무 체크 (정성훈 20160616)
			7.게임정보 페이지로 이동하기 (정성훈 2016.06.20)
			8.팀순위보기(정성훈2016.06.20)
			9.경기일정보기(정성훈2016.06.20)
			10.어제경기,오늘경기,내일경기보기 (정성훈 2016.06.21)
			11.선발투수, 장소 추가 (정성훈 2016.06.21)
			12.경기날짜 선택 기능 추가(정성훈 2016.06.22)
	*/

package spring.control;

import java.io.Console;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.FreeBoardDAO;
import mybatis.dao.MatchDAO;
import mybatis.dao.MemberDAO;
import mybatis.dao.NoticeDAO;
import mybatis.dao.TeamDAO;
import mybatis.vo.FreeBoardVO;
import mybatis.vo.MatchVO;
import mybatis.vo.MemberVO;
import mybatis.vo.NoticeVO;
import mybatis.vo.TeamVO;
import spring.include.Paging_board;

@Controller
public class MainControl {
	
	@Autowired
	MatchDAO matchDao;
	@Autowired
	MemberDAO memberDao;
	@Autowired
	TeamDAO teamDao;
	@Autowired
	FreeBoardDAO freeDao;
	@Autowired
	NoticeDAO noticeDao;
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	
	public static final int BLOCK_LIST = 10; // 한페이지당 보여질 게시물 수(10개)
	public static final int BLOCK_PAGE = 5; // 한블럭당 보여질 페이지 수(5장)
	
	@RequestMapping("/main.inc")
	public ModelAndView main(MemberVO vo){
		
		String flag = request.getParameter("flag");
		
		ModelAndView mv = new ModelAndView();
		if(flag == null || flag.equals("0")){
			//처음이동 || 정상로그인
			//main.jsp로 이동
			
			//오늘 날짜 경기일정 가져오기
			MatchVO[] games= matchDao.scheduleToday();
			//공지사항 최근 10개 가져오기
			NoticeVO[] nList = getNlist();
			//자유게시판 최근 10개 가져오기
			FreeBoardVO[] fList = getFlist();
			
			//경기일정, flag저장
			mv.addObject("games", games);
			//공지사항,자유게시판 저장
			mv.addObject("nList", nList);
			mv.addObject("fList", fList);
			mv.setViewName("/main");
		}
		else{
			//로그인오류
			//login.jsp로 이동
			mv.setViewName("/login");
		}
		return mv;
	}
	
	private FreeBoardVO[] getFlist() {
		// 게시판을 구별하는 문자열 
		String bname = "BBS";
		int rowTotal = freeDao.getTotalCount(bname);
		// 페이징 객체(Page) 생성
		Paging_board page = new Paging_board(1, rowTotal, BLOCK_LIST, BLOCK_PAGE);
		 
		int begin = page.getBegin();
		int end = page.getEnd();
		
		if(end > rowTotal)
			end = rowTotal;
		
		// mybatis환경에 호출한 map구조를 생성한다.
		Map<String, String> map = new HashMap<String,String>();
		map.put("bname", bname);
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		
		FreeBoardVO[] ar = freeDao.getList(map);
		return ar;
	}

	private NoticeVO[] getNlist() {
		// 게시판을 구별하는 문자열 
		String bname = "NOTICE";
		int rowTotal = noticeDao.getTotalCount(bname);
		// 페이징 객체(Page) 생성
		Paging_board page = new Paging_board(1, rowTotal, BLOCK_LIST, BLOCK_PAGE);
		 
		int begin = page.getBegin();
		int end = page.getEnd();
		
		if(end > rowTotal)
			end = rowTotal;
		
		// mybatis환경에 호출한 map구조를 생성한다.
		Map<String, String> map = new HashMap<String,String>();
		map.put("bname", bname);
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		
		NoticeVO[] ar = noticeDao.getList(map);
		return ar;
	}

	//회원가입 페이지로 이동 (정성훈 2016/06/10) 
	@RequestMapping("/goJoin.inc")
	public ModelAndView mainPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/join");
		return mv;
	}
	
	//로그인
	@RequestMapping("/login.inc")
	public ModelAndView resMember(MemberVO vo){
		
		ModelAndView mv = new ModelAndView();
		
		//입력한 아이디,비밀번호로 검색
		/*
		 * flag == 0 정상로그인
		 * flag == 1 아이디 오류
		 * flag == 2 비밀번호 오류
		*/
		String flag;
		MemberVO res = memberDao.loginMember(vo);
		
		if(res == null){
			//입력한 아이디,비밀번호에 해당하는 회원이 없을 경우
			//아이디는 존재하는지 검색
			res = memberDao.idCheck(vo.getId());
			if(res == null){
				//아이디조차 없는경우
				flag = "1";
			}else{
				//아이디는 존재하지만 비빌번호가 틀린경우
				flag = "2";
			}
		}
		else{
			//입력한 아이디,비밀번호에 해당하는 회원이 있을 경우
			//세션에저장
			session.setAttribute("vo", res);
			flag = "0";
		}
		
		//main.inc로 flag값을 가지고 redirect
		mv.setViewName("redirect:/main.inc?flag="+flag);
		
		return mv;
	}
	
	//로그아웃
	@RequestMapping("/logout.inc")
	public ModelAndView logout(MemberVO vo){
		
		//세션에 저장된 vo삭제(로그아웃)
		session.removeAttribute("vo");
		
		ModelAndView mv = new ModelAndView();
		// redirect로 수정 (2016/06/16 장준수)
		mv.setViewName("redirect:/main.inc");
		
		return mv;
	}
	
	//아이디/비밀번호 찾기 페이지 이동 (정성훈 20160616)
	@RequestMapping("/searchIdPwd.inc")
	public ModelAndView searchIdPwd(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/search");
		return mv;
	}
	
	//마이페이지로 이동하기 (정성훈 20160616)
	@RequestMapping("/mypageCheck.inc")
	public ModelAndView mypageCheck(){
		
		ModelAndView mv = new ModelAndView();
		
		//세션에 저장된 값이 있는지 체크
		MemberVO vo = (MemberVO)session.getAttribute("vo");
		if(vo == null){
			//로그인 후 사용해야하는 flag표시
			String flag = "3";
			//로그인 후 사용하라는 flag와 함께 main페이지로 이동
			mv.setViewName("redirect:/main.inc?flag="+flag);
		}else{
			//로그인이 되어 있으므로 mypage로 이동
			mv.setViewName("/mypage");
		}
		
		return mv;
	}
	
	//게임정보 페이지로 이동하기 (정성훈 2016.06.20)
	@RequestMapping("/gameInfo.inc")
	public ModelAndView gameInfo(){
		
		ModelAndView mv = new ModelAndView();
		//오늘 경기일정보여주기로 바로 이동
		mv.setViewName("redirect:/viewMatch.inc?");
	
		return mv;
	}
	
	//팀 순위 보여주기 (정성훈 2016.06.20)
	@RequestMapping("/viewRank.inc")
	public ModelAndView viewRank(){
		
		ModelAndView mv = new ModelAndView();
		TeamVO[] teams = teamDao.getTeamInfo();
		mv.addObject("teams", teams);
		mv.addObject("infoFlag", "viewRank");
		mv.setViewName("/gameInfo");
	
		return mv;
	}
	
	//오늘경기일정 보여주기 (정성훈 2016.06.20)
	@RequestMapping("/viewMatch.inc")
	public ModelAndView viewMatch(){
		
		//오늘 날짜 구하기
		Calendar cal = Calendar.getInstance();
		int yyyy=cal.get(Calendar.YEAR);
		int mm=cal.get(Calendar.MONTH)+1;
		int dd=cal.get(Calendar.DAY_OF_MONTH);
		//월의 날짜 수
		int countDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

		//오늘날짜 경기 구하기
		MatchVO[] games = findMatches(yyyy, mm, dd);
		
		//파라미터 저장
		ModelAndView mv = new ModelAndView();
		mv.addObject("games", games);
		mv.addObject("infoFlag", "viewMatch");
		mv.addObject("yyyy", yyyy); // 년
		mv.addObject("mm", mm); // 월
		mv.addObject("dd", dd); // 일
		mv.addObject("day", findDay(yyyy, mm, dd)); // 요일
		mv.addObject("countDay", countDay); // 월의 날짜 수
		mv.setViewName("/gameInfo");
		
		return mv;
	}
	
	//선택된 날짜 경기 보여주기 (정성훈 2016.06.22)
	@RequestMapping("/viewSelectDateMatch.inc")
	public ModelAndView viewSelectDateMatch(){
		
		//선택된 날짜를 파라미터로 받는다.
		int yyyy = Integer.parseInt(request.getParameter("yyyy"));
		int mm = Integer.parseInt(request.getParameter("mm"));
		int dd = Integer.parseInt(request.getParameter("dd"));
		//day는 이전, 다음 클릭시에만 넘어온다.
		String day = request.getParameter("day");
		
		Calendar cal = Calendar.getInstance();
		//이전, 다음 클릭시 day는 null이 아님
		if(day != null){
			//선택한 날짜로 세팅
			//월에서 -1을 해야 정상처리됨
			cal.set(yyyy, mm-1, dd);
			switch(day){
			case "pre":
				//선택된 날짜의 이전 날짜로
				cal.add(Calendar.DATE, -1);
				break;
			case "next":
				//선택된 날짜의 다음 날짜로
				cal.add(Calendar.DATE, +1);
				break;
			}
			
			//이전 or 다음 날짜로 세팅
			yyyy=cal.get(Calendar.YEAR);
			mm =cal.get(Calendar.MONTH)+1;
			dd =cal.get(Calendar.DAY_OF_MONTH);
		}
		//월의 날짜 수
		int countDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		//선택된 날짜 경기 구하기
		MatchVO[] games = findMatches(yyyy, mm, dd);
		
		//파라미터 저장
		ModelAndView mv = new ModelAndView();
		mv.addObject("games", games);
		mv.addObject("infoFlag", "viewMatch");
		mv.addObject("yyyy", yyyy); // 년
		mv.addObject("mm", mm); // 월
		mv.addObject("dd", dd); // 일
		mv.addObject("day", findDay(yyyy, mm, dd)); // 요일
		mv.addObject("countDay", countDay); // 월의 날짜 수
		mv.setViewName("/gameInfo");
			
		return mv;
	}
	
	
	
	//날짜 정보를 받아 해당 날짜의 요일을 리턴해주는 함수
	private String findDay(int yyyy, int mm, int dd){
		String[] week = {"일","월","화","수","목","금","토"};
		int wod;
		//월에서 -1을 해야 정상처리됨
		GregorianCalendar gcalendar = 
		new GregorianCalendar(yyyy, mm-1, dd);
		wod = gcalendar.get(Calendar.DAY_OF_WEEK);
		String dayOfWeek = week[wod-1];
		return dayOfWeek;
	}
	
	//날짜 정보를 받아 해당 날짜의 경기들을 리턴해주는 함수
	private MatchVO[] findMatches(int yyyy, int mm, int dd) {
		
		//모든경기 불러오기
		MatchVO[] allGames = matchDao.schedule();
		
		// 경기정보를 담을 리스트
		ArrayList<MatchVO> list = new ArrayList<>();
		
		//모든경기를 돌면서 해당 날짜 경기만 리스트에 담는다.
		for (int i = 0; i < allGames.length; i++) {
			MatchVO vo = allGames[i];
			if (yyyy == vo.getMatch_year() && mm == vo.getMatch_month() && dd == vo.getMatch_day()) {
				list.add(vo);
			}
		}
		// 리스트를 배열에 복사
		MatchVO[] games = null;
		if (list != null && list.size()>0) {
			games = new MatchVO[list.size()];
			list.toArray(games);
		}
		return games;
	}
}
