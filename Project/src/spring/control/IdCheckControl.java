package spring.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.TestDAO;
import mybatis.vo.TestVO;

	/*
	제 목 : IdCheckControl
	역 할 : 아이디 중복확인을 하는 역할입니다.
	로 그 : 프로그램 최초 생성 (박상원 2016/06/13)
	*/
@Controller
public class IdCheckControl {
	
	@Autowired
	TestDAO tdao;

	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/idCheck.inc")
	public ModelAndView idcheck(String id){
		
		TestVO vo = tdao.idCheck(id);
	
		ModelAndView mv = new ModelAndView();
		if(vo == null)
			mv.addObject("chk", "0"); //사용할 수 있는 ID
		else
			mv.addObject("chk", "1");//사용할 수 없는 ID
		
		mv.setViewName("/idCheck");
		
		return mv;
	}
	
}
