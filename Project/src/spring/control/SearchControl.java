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
	
	
	@RequestMapping(value="/search.inc", method = RequestMethod.POST)
	public ModelAndView search(MemberVO vo){
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		MemberVO mvo = mdao.idsearch(vo);
		System.out.println(vo.getId());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", mvo);
		mv.setViewName("/idsearch");
		return mv;
	}
}
