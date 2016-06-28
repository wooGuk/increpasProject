	/*
	제 목 : 로그인 인터셉터
	역 할 : 로그인이 필요한 작업들의 경우 거쳐가게 설정(applicationContext.xml에서)
	로 그 : 1.로그인 필요한 작업들 인터셉터 역할(정성훈 2016.06.28)
	*/

package spring.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import mybatis.vo.MemberVO;

public class LoginIntercepter extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//로그인이 되어 있는지를 알아본다.
		//우선 세션정보 가져온다.
		HttpSession session = request.getSession(false);
		if(session != null){
			//세션에 저장된 원하는 객체를 가져온다.
			Object obj = session.getAttribute("vo");
			if(obj == null){
				//로그인이 되어 있지 않은 상태
				//세션에 저장된 값이 있는지 체크
				String flag = "3";
				response.sendRedirect("/Project/main.inc?flag="+flag);
			}else{
				
				
			}
		}
		return true; //viewResolver에 적용안됨
	}
	
}
