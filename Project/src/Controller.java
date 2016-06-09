

import javax.servlet.annotation.WebServlet;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

/**
 * Servlet implementation class Controller
 */

// "/"메핑추가 정성훈 16/06/09
@WebServlet({"/","*.inc"})
public class Controller extends DispatcherServlet {
	private static final long serialVersionUID = 1L;

}
