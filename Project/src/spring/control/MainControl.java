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

import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MatchDAO;
import mybatis.dao.MemberDAO;
import mybatis.dao.TeamDAO;
import mybatis.vo.MatchVO;
import mybatis.vo.MemberVO;
import mybatis.vo.TeamVO;

@Controller
public class MainControl {
	
	@Autowired
	MatchDAO matchDao;
	@Autowired
	MemberDAO memberDao;
	@Autowired
	TeamDAO teamDao;
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	
	@RequestMapping("/main.inc")
	public ModelAndView main(MemberVO vo){
		
		String flag = request.getParameter("flag");
		
		//오늘 날짜 경기일정 가져오기
		MatchVO[] games= matchDao.scheduleToday();
		
		ModelAndView mv = new ModelAndView();
		//경기일정, flag저장
		mv.addObject("games", games);
		if(flag == null || flag.equals("0")){
			//처음이동 || 정상로그인
			//main.jsp로 이동
			mv.setViewName("/main");
		}
		else{
			//로그인오류
			//login.jsp로 이동
			mv.setViewName("/login");
		}
		return mv;
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
		mv.setViewName("/gameInfo");
	
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
	
	//경기일정 보여주기 (정성훈 2016.06.20)
	@RequestMapping("/viewMatch.inc")
	public ModelAndView viewMatch(){
		
		String day = request.getParameter("day");
		System.out.println(day);
		ModelAndView mv = new ModelAndView();
		//모든경기일정 가져오기
		MatchVO[] allGames = matchDao.schedule();
		//파라미터로 받은 day로 구분하여 경기정보를 리턴해주는 함수 호출
		MatchVO[] games = recentDayMatch(allGames, day, mv);
		
		mv.addObject("games", games);
		mv.addObject("infoFlag", "viewMatch");
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
		
		//DB 모든경기일정 가져오기
		MatchVO[] allGames = matchDao.schedule();
		
		//선택된 날짜의 경기를 담을 리스트
		ArrayList<MatchVO> list = new ArrayList<>();
		
		//모든경기일정을 돌면서
		for(int i=0; i<allGames.length; i++){
			//선택된 날짜와 같은 날짜 경기만 뽑는다.
			if(allGames[i].getMatch_year() == yyyy && allGames[i].getMatch_month()== mm && allGames[i].getMatch_day()==dd){
				//리스트에 추가시킨다.
				list.add(allGames[i]);
			}
		}//for()
		
		//리스트 크기만큼 배열을 만들어 복사한다.
		MatchVO[] games = null;
		if(list != null || !(list.isEmpty())){
			games = new MatchVO[list.size()];
			list.toArray(games);
		}
		//games배열에는 선택된 날짜의 경기가 들어가게 된다.
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("games", games);
		mv.addObject("infoFlag", "viewMatch");
		//선택한 날짜 파라미터에 담기
		mv.addObject("yyyy", yyyy);
		mv.addObject("mm", mm);
		mv.addObject("dd", dd);
		mv.setViewName("/gameInfo");
		
		return mv;
	}
	
	//어제, 오늘, 내일 경기보기 클릭시 
	//어제, 오늘, 내일을 구분해서 해당 경기정보 리턴해주는 함수
	private MatchVO[] recentDayMatch(MatchVO[] allGames, String day, ModelAndView mv){
		ArrayList<MatchVO> list = new ArrayList<>(); // 경기정보를 담을 리스트
		
		Calendar cal = Calendar.getInstance();

		cal.add(Calendar.DATE,-1); // 어제(오늘에서 -1)
		int preYear=cal.get(Calendar.YEAR);
		int preMonth=cal.get(Calendar.MONTH)+1;
		int preDay=cal.get(Calendar.DAY_OF_MONTH);

		cal.add(Calendar.DATE,1); // 오늘(어제에서 +1)
		int nowYear=cal.get(Calendar.YEAR);
		int nowMonth=cal.get(Calendar.MONTH)+1;
		int nowDay=cal.get(Calendar.DAY_OF_MONTH);

		cal.add(Calendar.DATE,1); // 내일(오늘에서 +1)
		int nextYear=cal.get(Calendar.YEAR);
		int nextMonth=cal.get(Calendar.MONTH)+1;
		int nextDay=cal.get(Calendar.DAY_OF_MONTH);
		
		switch(day){
		case "yesterday":
			for(int i=0; i<allGames.length; i++){
				MatchVO vo = allGames[i];
				if(preYear == vo.getMatch_year() && preMonth == vo.getMatch_month() && preDay == vo.getMatch_day()){
					list.add(vo);
					//어제 날짜 파라미터로 설정
					mv.addObject("yyyy", preYear);
					mv.addObject("mm", preMonth);
					mv.addObject("dd", preDay);
				}
			}
			break;
		case "today":
			for(int i=0; i<allGames.length; i++){
				MatchVO vo = allGames[i];
				if(nowYear == vo.getMatch_year() && nowMonth == vo.getMatch_month() && nowDay == vo.getMatch_day()){
					list.add(vo);
					//오늘 날짜 파라미터로 설정
					mv.addObject("yyyy", nowYear);
					mv.addObject("mm", nowMonth);
					mv.addObject("dd", nowDay);
				}
			}
			break;
		case "tomorrow":
			for(int i=0; i<allGames.length; i++){
				MatchVO vo = allGames[i];
				if(nextYear == vo.getMatch_year() && nextMonth == vo.getMatch_month() && nextDay == vo.getMatch_day()){
					list.add(vo);
					//내일 날짜 파라미터로 설정
					mv.addObject("yyyy", nextYear);
					mv.addObject("mm", nextMonth);
					mv.addObject("dd", nextDay);
				}
			}
			break;
		}//switch()
		
		//리스트 사이즈만큼의 배열에 경기정보를 담는다.
		MatchVO[] games = null;
		if(list != null || !(list.isEmpty())){
			games = new MatchVO[list.size()];
			list.toArray(games);
		}
		return games;
	}
}
