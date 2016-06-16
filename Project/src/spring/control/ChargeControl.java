package spring.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemberDAO;
import mybatis.vo.MemberVO;

	/*
	제 목 : ChargeControl
	역 할 : 마이페이지에서 잔액 충전 
	로 그 :  1.프로그램 최초 생성 (장준수 2016/06/14)
				2. 충전시 메인이나 마이페이지 다시 클릭시 전에 있든 금액으로 나타난것을
					충전시 그 금액으로 나타남.(장준수 2016/06/16)
	 */	

@Controller
public class ChargeControl {

	@Autowired
	MemberDAO mdao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/charge.inc")
	public ModelAndView charge(MemberVO vo){
		
		String a = request.getParameter("coin"); // 충전 코인
		String d = request.getParameter("usercoin"); // 유저가 가지고 있는 코인
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		
	
		System.out.println(a);
		System.out.println(d);
		System.out.println(id);
		System.out.println("PW:"+password);
		System.out.println("이름:"+name);

		MemberVO v1 = (MemberVO) session.getAttribute("vo");
		
		int coin1 = Integer.parseInt(a);  // 충전 코인
		int usercoin = Integer.parseInt(d); // 유저가 가지고 있는 코인
		int coin = coin1 + usercoin; // 충전한 코인 + 유저 코인 합
		System.out.println("합"+coin);
		/*vo.setCoin(coin);*/
		v1.setCoin(coin);
		//vo.setId(id);
			
		MemberVO mvo = mdao.addCoin(vo);
	
		ModelAndView mv = new ModelAndView();
		/*mv.addObject("vo", mvo);*/
		/*mv.addObject("vo1", vo);*/
		mv.setViewName("/mypage");
		
		return mv;
	}
}
