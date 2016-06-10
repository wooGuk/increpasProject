	/*
	제 목 : MainControl.java
	역 할 : 첫 시작시 메인화면 컨트롤러
	로 그 : 1.첫 시작시 메인화면으로 이동 (정성훈 2016/06/09)
			2.회원가입 페이지로 이동 (정성훈 2016/06/10) 
	*/

package spring.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainControl {
	
	//회원가입 페이지로 이동 (정성훈 2016/06/10) 
	@RequestMapping(value="/go_join.inc")
	public ModelAndView mainPage(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/join");
		return mv;
	}
}
