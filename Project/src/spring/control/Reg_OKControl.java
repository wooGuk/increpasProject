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
	
	
	@RequestMapping(value="/reg_ok.inc",method=RequestMethod.POST)
	public ModelAndView add(TestVO vo){
		
		ModelAndView mv = new ModelAndView();
		t_dao.addMember(vo);
		mv.setViewName("redirect:/join.inc");
		return mv;
	}
}
