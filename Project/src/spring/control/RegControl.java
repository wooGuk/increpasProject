package spring.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.TestDAO;
import mybatis.vo.TestVO;


@Controller
public class RegControl {

	
	@RequestMapping("/reg.inc")
	public String main(){
		return "/join";
	}
}
