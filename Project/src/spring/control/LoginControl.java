package spring.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.TestDAO;
import mybatis.vo.TestVO;

@Controller
public class LoginControl {

	@Autowired
	TestDAO tdao;
	
	@RequestMapping("/login.inc")
	public ModelAndView resMember(TestVO vo){
		
		TestVO res = tdao.loginMember(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", res);
		mv.addObject("mvo", vo);
		mv.setViewName("/main");
		
		return mv;
	}
}
