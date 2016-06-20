	/*
	제 목 : MainControl.java
	역 할 : 첫 시작시 메인화면 컨트롤러
	로 그 : 1.첫 시작시 메인화면으로 이동 (정성훈 2016/06/09)
			2.회원가입 페이지로 이동 (정성훈 2016/06/10) 
			3.오늘의 경기일정 보여주기 (정성훈 20161616)
			4.LoginControl, LogoutControl 기능 합침 (정성훈 20160616)
			5.아이디/비밀번호 찾기 페이지 이동 (정성훈 20160616)
			6.마이페이지 이동시 로그인 유무 체크 (정성훈 20160616)
			7.공지사항,자유게시판 페이지 이동 (정성훈 2016.06.20)
	*/

package spring.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MatchDAO;
import mybatis.dao.MemberDAO;
import mybatis.vo.MatchVO;
import mybatis.vo.MemberVO;

@Controller
public class MainControl {
	
	@Autowired
	MatchDAO matchDao;
	@Autowired
	MemberDAO memberDao;
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
	
	//공지사항 페이지로 이동하기 (정성훈 2016.06.20)
	@RequestMapping("/noticeBoard.inc")
	public ModelAndView goToNoticeBoard(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/noticeBoard");
		return mv;
	}
	
	//자유게시판 페이지로 이동하기 (정성훈 2016.06.20)
	@RequestMapping("/freeBoard.inc")
	public ModelAndView goToFreeBoard(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/freeBoard");
		return mv;
	}
}
