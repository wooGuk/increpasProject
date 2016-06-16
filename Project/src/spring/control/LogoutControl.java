package spring.control;
/*
제 목 : LogoutControl
역 할 : 로그아웃 컨트롤러
로 그 : 1. 삭제는 되지만 이게 맞는지 확실치 못함 (2016/06/14장준수)
*/
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MemberDAO;
import mybatis.vo.MemberVO;

@Controller
public class LogoutControl {

	@Autowired
	MemberDAO t_dao;
	
	@Autowired
	HttpSession session;
	
	

