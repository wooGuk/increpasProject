package spring.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.TestDAO;
import mybatis.vo.TestVO;

@Controller
public class LogoutControl {

	@Autowired
	TestDAO t_dao;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/logout.inc")
	public ModelAndView logout(TestVO vo){
		
		session.removeAttribute("vo");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main");
		
		return mv;
	}
}
