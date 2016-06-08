package spring.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.TestDAO;
import mybatis.vo.TestVO;

@Controller
public class Reg_OKControl {

	@Autowired
	private TestDAO t_dao;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping(value="/reg_ok.inc",method=RequestMethod.POST)
	public ModelAndView add(TestVO vo){
	
		
		t_dao.addMember(vo);
		

		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/main");
		return mv;
	}
}
