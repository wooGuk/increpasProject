/*package spring.control;

/*import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.BatDAO;
import mybatis.dao.MemberDAO;
import mybatis.vo.BatVO;
import mybatis.vo.MemberVO;

	
	제 목 : MypageControl
	역 할 : 마이페이지로 이동하여 수행하는 컨트롤러 
	로 그 :  1.프로그램 최초 생성 (장준수 2016/06/14)
			2. 필요없음(2016/06/28)
	
@Controller
public class MyPageControl {

	@Autowired
	MemberDAO tdao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	BatDAO bdao;

	
	@RequestMapping("/mypage.inc")
	public ModelAndView mypage(){
		
		//mv.addObject("batlist1",bat);
		mv.setViewName("/mypage");
		return mv;
	}
	
	
}
*/