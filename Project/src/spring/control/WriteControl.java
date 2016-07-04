/*package spring.control;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.FreeBoardDAO;
import mybatis.dao.MemberDAO;
import mybatis.vo.FreeBoardVO;
import mybatis.vo.FreeCommVO;
import mybatis.vo.MemberVO;
import spring.include.Paging_board;
import spring.util.FileSaveUtil;
	

	제 목 : WriteControl
	역 할 : 글쓰기, 글수정, 글삭제 이동하는 컨트롤러 
	로 그 :  1.프로그램 최초 생성 (장준수 2016/06/23)
	
	
	*****************************************
			불필요(장준수 2016/07/04)
	*****************************************

	
@Controller
public class WriteControl {
	
	@Autowired
	private FreeBoardDAO fdao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	HttpSession session;
	

	private String uploadPath; 
							   
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	
	// 글쓰기 (장준수 2016/06/21)
	@RequestMapping(value="/write.inc",method=RequestMethod.POST)
	public ModelAndView writerr(FreeBoardVO vo1)throws Exception{
	
		if(vo1.getUpload().getSize() > 0){
			
			String path = servletContext.getRealPath(uploadPath);
			
			
			MultipartFile upload = vo1.getUpload();
			String f_name = upload.getOriginalFilename();
			
			// 이미 같은 이름이 있을 경우 파일명을 변경한다.
			f_name = FileSaveUtil.checkSameFileName(f_name, path);
			
			// 파일저장
			upload.transferTo(new File(path,f_name));
			
			// 파일명 저장
			vo1.setUploadFileName(f_name);
			
		}else
			vo1.setUploadFileName("");
		
		MemberVO mvo = (MemberVO) request.getAttribute("vo");
		vo.setId(mvo.getId());
		vo1.setIp(request.getRemoteAddr());
		vo1.setBname("BBS");
		
	
		fdao.writeBbs(vo1);
	
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/freeBoard.inc");
		
		return mv;
	}
	
	// 글삭제 (장준수 2016/06/22)
	@RequestMapping(value = "/del.inc", method = RequestMethod.POST)
	public ModelAndView del(FreeBoardVO vo1) {
		System.out.println(vo1.getId());
		System.out.println(vo1.getPassword());
		fdao.delBbs(vo1);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/freeBoard.inc");

		return mv;
	}
	
	// 글수정 이동(장준수 20160/06/23)
	@RequestMapping("/edit.inc")
	public ModelAndView edit(String nowPage) throws Exception {
		
		// seq라는 파라미터는 유실된다. 그래도 괜찮은 것이 우리가 표현할 vo가 이미 ViewControl에서 session에
		// "vo"라는 이름으로 저장했으므로 연결되는 페이지 이동에서는 session에 있는 정보를 계속 사용할 수 있다.
		ModelAndView mv = new ModelAndView();
		mv.addObject("nowPage", nowPage);
		mv.setViewName("/edit");

		return mv;
	}
	

	// 글수정 (장준수 2016/06/23)
	@RequestMapping(value = "/edit.inc", method = RequestMethod.POST)
	public ModelAndView edit(FreeBoardVO vo1) throws Exception {
		if (vo1.getUpload().getSize() > 0) {
			// 파일첨부를 하지 않아도 null을 받지 않는다. 다만 사이즈가 0이다.

			// 사이즈가 0보다 크다는 것은 파일이 첨부되었다는 것이고, upload의 절대경로를 얻어내야한다.
			String path = servletContext.getRealPath(uploadPath);

			// 첨부파일 가져오기
			MultipartFile upload = vo1.getUpload();
			String f_name = upload.getOriginalFilename();

			// 이미 같은 이름이 있을 경우 파일명을 변경한다.
			f_name = FileSaveUtil.checkSameFileName(f_name, path);

			// 파일저장!
			upload.transferTo(new File(path, f_name));

			// 파일명 저장
			vo1.setUploadFileName(f_name);

		} else
			vo1.setUploadFileName("");
		System.out.println(vo1.getNowPage());
		vo1.setIp(request.getRemoteAddr());
		fdao.editBbs(vo1);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/view.inc?seq=" + vo1.getSeq() + "&nowPage=" + vo1.getNowPage());

		return mv;
	}
	
	// 댓글저장(장준수 20160/06/27)
	@RequestMapping(value="/ans_write.inc",method=RequestMethod.POST)
	public ModelAndView ansWrite(FreeCommVO vo){
		String nowPage = request.getParameter("nowPage");
		String seq = request.getParameter("seq");

		fdao.addAns(vo);
		session.setAttribute("ans", vo);
		 
		ModelAndView mv = new ModelAndView();
		mv.addObject("nowPage",nowPage );
		mv.addObject("seq", seq);
		mv.setViewName("redirect:/view.inc");
		return mv;
	}
	
	// 댓글삭제(장준수 20160/06/27)
	@RequestMapping("/comdel.inc")
	public ModelAndView ansDel(FreeCommVO vo){
		String seq_com = request.getParameter("seq_com");
		String nowPage = request.getParameter("nowPage");
		String seq = request.getParameter("seq");
		System.out.println(seq);
		System.out.println(seq_com);
		System.out.println(nowPage);
		
		fdao.comDel(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("nowPage",nowPage );
		mv.addObject("seq", seq);
		mv.setViewName("redirect:/view.inc");
		return mv;
	}
	
}
*/