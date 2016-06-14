package spring.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemberDAO;
import mybatis.vo.MemberVO;

@Controller
public class LoginControl {
	
	/*
	제 목 : LoginControl
	역 할 : 로그인을 하는 역활
	로 그 : 프로그램 최초 생성 (장준수 2016/06/09)
	*/
	
	
	@Autowired
	MemberDAO tdao;
	
	@RequestMapping("/login.inc")
	public ModelAndView resMember(MemberVO vo){
		
		MemberVO res = tdao.loginMember(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", res);
		mv.addObject("mvo", vo);
		mv.setViewName("/main");
		
		return mv;
	}
}
