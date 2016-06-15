	/*
	제 목 : MainControl.java
	역 할 : 첫 시작시 메인화면 컨트롤러
	로 그 : 1.첫 시작시 메인화면으로 이동 (정성훈 2016/06/09)
			2.회원가입 페이지로 이동 (정성훈 2016/06/10) 
			3.오늘의 경기일정 보여주기 (정성훈 20161616)
	*/

package spring.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MatchDAO;
import mybatis.vo.MatchVO;
import mybatis.vo.MemberVO;

@Controller
public class MainControl {
	
	@Autowired
	MatchDAO matchDao;
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/main.inc")
	public ModelAndView main(MemberVO vo){
		//오늘 날짜 경기일정 가져오기
		MatchVO[] games= matchDao.scheduleToday();
		
		ModelAndView mv = new ModelAndView();
		//request에 경기일정 저장
		request.setAttribute("games", games);
		//main.jsp로 이동
		mv.setViewName("/main");
		return mv;
	}
	
	//회원가입 페이지로 이동 (정성훈 2016/06/10) 
	@RequestMapping(value="/go_join.inc")
	public ModelAndView mainPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/join");
		return mv;
	}
}
