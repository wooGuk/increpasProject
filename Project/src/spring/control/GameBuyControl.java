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
}
