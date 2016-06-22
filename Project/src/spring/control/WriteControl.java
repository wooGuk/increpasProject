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

import mybatis.dao.FreeBoardDAO;
import mybatis.dao.MemberDAO;
import mybatis.vo.FreeBoardVO;
import mybatis.vo.MemberVO;
import spring.util.FileSaveUtil;

@Controller
public class WriteControl {
	
	@Autowired
	private FreeBoardDAO fdao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ServletContext servletContext;
	

	private String uploadPath; 
							   
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	
	@RequestMapping(value="/write.inc",method=RequestMethod.POST)
	public ModelAndView writerr(FreeBoardVO vo)throws Exception{
	
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
		
		/*MemberVO mvo = (MemberVO) request.getAttribute("vo");
		vo.setId(mvo.getId());*/
		vo.setIp(request.getRemoteAddr());
		vo.setBname("BBS");
		
	
		fdao.writeBbs(vo);
	
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/freeBoard.inc");
		
		return mv;
	
		
		
	}

}
