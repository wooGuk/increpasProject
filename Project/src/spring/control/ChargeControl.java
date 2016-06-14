package spring.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemberDAO;
import mybatis.vo.MemberVO;

@Controller
public class ChargeControl {
// day
	@Autowired
	MemberDAO mdao;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/charge.inc")
	public ModelAndView charge(MemberVO vo){
		
		String a = request.getParameter("coin"); // 충전 코인
		String d = request.getParameter("usercoin"); // 유저가 가지고 있는 코인
		String id = request.getParameter("id");
		
	
		System.out.println(a);
		System.out.println(id);
		System.out.println(vo.getName());

		
		int coin1 = Integer.parseInt(a);  // 충전 코인
		int usercoin = Integer.parseInt(d); // 유저가 가지고 있는 코인
		int coin = coin1 + usercoin; // 충전한 코인+ 유저 코인 합
		
		vo.setCoin(coin);
		//vo.setId(id);
		
		
		MemberVO mvo = mdao.addCoin(vo);
	
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", mvo);
		mv.addObject("vo1", vo);
		mv.setViewName("/mypage");
		
		return mv;
	}
}
