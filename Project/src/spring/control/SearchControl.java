/* 	제 목 : SearchControl.jsp
	역 할 : search.jsp에서 이동하는 컨트롤러 페이지
	로 그 : 1.최초 개발(문제없이 컨트롤러 기능 수행 확인)
					
	(박상원 2016/06/14)*/
			



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
public class SearchControl {

	
	@Autowired
	MemberDAO mdao;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/search.inc")
	public String eee(){
		return "/search";
	}
	
	//ID Search 눌렀을시 이동한 컨트롤러
	@RequestMapping(value="/idsearch.inc", method = RequestMethod.POST)
	public ModelAndView idsearch(MemberVO vo){
		
		
	
		MemberVO mvo = mdao.idsearch(vo);
		System.out.println(vo.getId());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", mvo);
		mv.setViewName("/idsearch");
		return mv;
	}

	//PWD Search 눌렀을시 이동한 컨트롤러
	@RequestMapping(value="/pwsearch.inc", method = RequestMethod.POST)
	public ModelAndView pwsearch(MemberVO vo){
		
		
		
		
		MemberVO mvo = mdao.pwdsearch(vo);
		/*System.out.println(vo.getId()); <- 06/28 제거*/
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", mvo);
		mv.setViewName("/pwsearch");
		return mv;
	}
	
}
