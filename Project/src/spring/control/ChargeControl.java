package spring.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemberDAO;
import mybatis.vo.BatVO;
import mybatis.vo.MemberVO;

	/*
	제 목 : ChargeControl
	역 할 : 마이페이지에서 잔액 충전 
	로 그 :  1.프로그램 최초 생성 (장준수 2016/06/14)
				2. 충전시 메인이나 마이페이지 다시 클릭시 전에 있든 금액으로 나타난것을
					충전시 그 금액으로 나타남 ㅡㅡ> 수정 (장준수 2016/06/16)
					3. 회원수정 (장준수 2016/06/20) 
					4. 회원탈퇴 추가 (박상원 2016/06/21)
					5. 구매 취소 및 반환금 받기 (장준수 2016/06/29) 
	 */	

@Controller
public class ChargeControl {

	@Autowired
	MemberDAO mdao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	
	// 코인충전
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
		mv.setViewName("redirect:/mypageCheck.inc");
		
		return mv;
	}
	
	// 회원 수정
	@RequestMapping("/memedit.inc")
	public ModelAndView mem(){
		
		MemberVO vo = (MemberVO) session.getAttribute("vo");
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("edit", vo);
		mv.setViewName("/memEdit");
		return mv;
	}
	
	
	// 회원수정
	@RequestMapping(value="memedit.inc",method=RequestMethod.POST)
	public ModelAndView memdit(MemberVO vo){
		
		MemberVO vo1 = (MemberVO) session.getAttribute("vo");
		
		vo1.setPassword(vo.getPassword());
		vo1.setPhone(vo.getPhone());
		vo1.setAddress(vo.getAddress());
		
		mdao.memEdit(vo1);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/logout.inc");
		return mv;
	}
	
	//회원탈퇴
		@RequestMapping("/memdel.inc")
		public ModelAndView memDel(){
			
			MemberVO vo1 = (MemberVO) session.getAttribute("vo");
			
			mdao.memDel(vo1);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/logout.inc");
			return mv;
			
		}
	
		// 구매 취소 및 반환금 받기 
		@RequestMapping("/batcancel.inc")
		public ModelAndView batcancel(){
			
			MemberVO vo = (MemberVO) session.getAttribute("vo");
			String c = request.getParameter("pk");
			String n = request.getParameter("batcoin");
			String id = request.getParameter("id");
		
			int code = Integer.parseInt(c);
			int coin = Integer.parseInt(n);
			System.out.println(coin);
			
			int a = vo.getCoin();
			int s = a+coin;
			
			vo.setId(id);
			vo.setCoin(s);
			
			mdao.returnCoin(vo);
			mdao.delBat(code);
			
			ModelAndView mv = new ModelAndView();
			
			mv.setViewName("redirect:/mypageCheck.inc");
			return mv;
			
		}
	
}
