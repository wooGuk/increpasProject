package spring.control;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemberDAO;
import mybatis.vo.MemberVO;


	/*
	제 목 : RegControl
	역 할 : 회원가입 및 메인화면으로 이동하는 컨트롤러 
	로 그 :  1.프로그램 최초 생성 (장준수 2016/06/14)
				2.main.inc 매핑 MainControl로 이동시킴 (정성훈 2016/06/16)
	 */


@Controller
public class RegControl {

	@Autowired
	private MemberDAO tdao;
	
	@Autowired
	HttpServletRequest request;
		
	
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
