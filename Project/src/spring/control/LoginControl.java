package spring.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.TestDAO;
import mybatis.vo.MemberVO;
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
	
	@RequestMapping("/login2.inc")
	public ModelAndView resMember2(MemberVO vo){
		System.out.println(vo.getId());
		System.out.println(vo.getPassword());
		MemberVO res = tdao.loginMember2(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", res);
		mv.addObject("mvo", vo);
		mv.setViewName("/main");
		
		return mv;
	}
}
