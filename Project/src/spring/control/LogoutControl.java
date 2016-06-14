package spring.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemberDAO;
import mybatis.vo.MemberVO;

@Controller
public class LogoutControl {

	@Autowired
	MemberDAO t_dao;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/logout.inc")
	public ModelAndView logout(MemberVO vo){
		
		session.removeAttribute("vo");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main");
		
		return mv;
	}
}
