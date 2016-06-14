package spring.control;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemberDAO;
import mybatis.vo.MemberVO;

@Controller
public class RegControl {

	@Autowired
	private MemberDAO tdao;
	
	@Autowired
	HttpServletRequest request;
	
	
	// 메인
	@RequestMapping("/main.inc")
	public String main(){
		return "/main";
	}
	
	
	// 회원가입
	@RequestMapping(value="/reg_ok.inc",method=RequestMethod.POST)
	public ModelAndView add(MemberVO vo){
	
		
		MemberVO vo1 = tdao.addMember(vo);	
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo1);
		mv.setViewName("/main");
		return mv;
	}
	
}
