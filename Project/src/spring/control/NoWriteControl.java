 
		/*제 목 : NoWriteControl.java

		역 할 : 공지사항 게시판컨트롤러
		로 그 :  1.프로그램 최초 생성 (박상원 2016/06/22)
			   -> 공지사항 게시글 작성!
			   2. 파일첨부기능 추가 (박상원 2016/06/23)
			
		*/

package spring.control;

import java.io.File;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import mybatis.dao.NoticeDAO;
import mybatis.vo.NoticeVO;
import spring.util.FileSaveUtil;

@Controller
public class NoWriteControl {
	
	@Autowired
	private NoticeDAO ndao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ServletContext servletContext;
	
	private String uploadPath; 
							   
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	
	@RequestMapping(value="/wnotice.inc",method=RequestMethod.POST)
	public ModelAndView write(NoticeVO vo)throws Exception{
		
		String title = request.getParameter("title");
		
		if(vo.getUpload().getSize() > 0){
			
			String path = servletContext.getRealPath(uploadPath);
			
			
			MultipartFile upload = vo.getUpload();
			String f_name = upload.getOriginalFilename();
			
			// 이미 같은 이름이 있을 경우 파일명을 변경한다.
			f_name = FileSaveUtil.checkSameFileName(f_name, path);
			
			// 파일저장
			upload.transferTo(new File(path,f_name));
			
			// 파일명 저장
			vo.setUploadFileName(f_name);
			
		}else
			vo.setUploadFileName("");
		
		
		vo.setIp(request.getRemoteAddr());
		vo.setBname("NOTICE");
		
	
		ndao.writenotice(vo);
		
	
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/notice.inc");
 		
		return mv;
		
	}

}
