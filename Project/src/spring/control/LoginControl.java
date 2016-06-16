package spring.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemberDAO;
import mybatis.vo.MemberVO;

@Controller
public class LoginControl {
	
	/*
	제 목 : LoginControl
	역 할 : 로그인을 하는 역활
	로 그 : 1. 프로그램 최초 생성 (장준수 2016/06/09)
	 		2. session추가 (정성훈 2016/06/15)
	 		3. flag를 통해 로그인 오류 판별 (정성훈 2016/06/15)
	*/
	
	@Autowired
	HttpSession session;
	
	@Autowired
	MemberDAO mDao;
	
	@RequestMapping("/login.inc")
	public ModelAndView resMember(MemberVO vo){
		
		ModelAndView mv = new ModelAndView();
		
		//입력한 아이디,비밀번호로 검색
		/*
		 * flag == 1 아이디 오류
		 * flag == 2 비밀번호 오류
		 * flag == 3 정상로그인
		*/
		String flag;
		MemberVO res = mDao.loginMember(vo);
		
		if(res == null){
			//입력한 아이디,비밀번호에 해당하는 회원이 없을 경우
			//아이디는 존재하는지 검색
			res = mDao.idCheck(vo.getId());
			if(res == null){
				//아이디조차 없는경우
				flag = "1";
			}else{
				//아이디는 존재하지만 비빌번호가 틀린경우
				flag = "2";
			}
		}
		else{
			//입력한 아이디,비밀번호에 해당하는 회원이 있을 경우
			//세션에저장
			session.setAttribute("vo", res);
			flag = "3";
		}
		
		//view페이지 저장
		
		//mv.setViewName("/main");
		mv.setViewName("redirect:/main.inc?flag="+flag);
		
		return mv;
	}
}
