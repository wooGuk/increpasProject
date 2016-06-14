package spring.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemberDAO;
import mybatis.vo.MemberVO;

@Controller
public class MyPageControl {

	@Autowired
	MemberDAO tdao;
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/mypage.inc")
	public ModelAndView mypage(){
		String id= (String) request.getParameter("id");
		//System.out.println(id);
		MemberVO vo = tdao.idCheck(id);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("/mypage");
		return mv;
	}
	
	
}
