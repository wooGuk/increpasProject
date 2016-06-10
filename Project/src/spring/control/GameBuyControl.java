	/*
	제 목 : GameBuyControl.java
	역 할 : 게임구매 탭의 기능을 수행할 컨트롤러
	로 그 : 1.프로그램 최초 생성,당일 경기 리스트 불러오기 구현 (오우석 2016/06/09)
			2.지난경기 불러오기 기능 추가(오우석 2016/06/10)
	*/
package spring.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.MatchDAO;
import mybatis.vo.MatchVO;

@Controller
public class GameBuyControl {
	
	@Autowired
	MatchDAO mDao;
	
	@Autowired
	HttpServletRequest request;
	
	
	@RequestMapping("/todaylist.inc")
	public ModelAndView showList(){
		ModelAndView mv = new ModelAndView();
		MatchVO[] games = mDao.scheduleToday();
		
		mv.addObject("games", games);
		mv.setViewName("oppGameList");
		return mv;
	}
	
	//지난경기 불러오기(오우석 2016/06/10)
	@RequestMapping("/endlist.inc")
	public ModelAndView endShowList(){
		ModelAndView mv = new ModelAndView();
		MatchVO[] games = mDao.scheduleToday();
		
		mv.addObject("games", games);
		mv.setViewName("oppGameList");
		return mv;
	}
}
