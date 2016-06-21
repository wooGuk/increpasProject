package spring.control;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.FreeBoardDAO;
import mybatis.vo.FreeBoardVO;
import mybatis.vo.MemberVO;
import spring.include.Paging;
import spring.util.FileSaveUtil;

@Controller
public class FreeBoardControl {

	@Autowired
	FreeBoardDAO fdao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private String uploadPath;
	
	// 페이징 기법에 필요한 변수들
		public static final int BLOCK_LIST = 10; // 한페이지당 보여질 게시물 수(10개)
		public static final int BLOCK_PAGE = 5; // 한블럭당 보여질 페이지 수(5장)
		
		int nowPage; // 현재 페이지
		int rowTotal; // 총 게시물의 수
		String PageCode; // 페이징 처리된 HTML코드
		
		String searchType, searchValue; // 나중에 검색 기능에 필요한 변수들
		
		
		// 자유게시판 이동 (장준수 2016/06/21)
		@RequestMapping("/freeBoard.inc")
		public ModelAndView list(){
			// 사용자가 브러우저에서 list.inc로 요청했을 때 수행하는 곳
			
			// 현재 페이지값 받기 *
			String c_page = request.getParameter("nowPage");
			
			if(c_page == null)
				nowPage = 1;
			else
				nowPage = Integer.parseInt(c_page);
			
			// 게시판을 구별하는 문자열 
			String bname = "BBS";
			rowTotal = fdao.getTotalCount(bname);
//			System.out.println(bname);
			
			// 페이징 객체(Page) 생성
			Paging page = new Paging(nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
			 
			// 페이징 HTML코드를 기억하는 있는 sb를 가져온다.
			StringBuffer sb = page.getSb();
			
			// HTML코드를 가져온다.
			PageCode = sb.toString();
			
			int begin = page.getBegin();
			int end = page.getEnd();
			
			if(end > rowTotal)
				end = rowTotal;
			
			// mybatis환경에 호출한 map구조를 생성한다.
			Map<String, String> map = new HashMap<String,String>();
			map.put("bname", bname);
			map.put("begin", String.valueOf(begin));
			map.put("end", String.valueOf(end));
			
			FreeBoardVO[] ar = fdao.getList(map);
			
			// JSP에서 표현할 수 있도록 반환객체 생성 한 후
			// 그곳에서 표현할 값들을 저장한다.
			ModelAndView mv = new ModelAndView();
			mv.addObject("list", ar);
			mv.addObject("nowPage", nowPage);
			mv.addObject("pageCode", PageCode);
			mv.addObject("rowTotal", rowTotal);
			mv.addObject("blockList", BLOCK_LIST);
			
			mv.setViewName("/freeBoard");
			
			return mv;
		}
		
		
		// 글쓰기폼 이동 (장준수 2016/06/21)
		@RequestMapping("/writeForm.inc")
		public ModelAndView writeForm(){

			MemberVO vo = (MemberVO) session.getAttribute("vo");
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("vo", vo);
			mv.setViewName("/write");
			
			return mv;
		}
		
		// 글 저장(장준수 2016/06/21)
		@RequestMapping(value="/write.inc",method=RequestMethod.POST)
		public ModelAndView write(FreeBoardVO vo) throws Exception{
			if(vo.getUpload().getSize() > 0){
				// 파일첨부를 하지 않아도 null을 받지 않는다. 다만 사이즈가 0이다.
				
				// 사이즈가 0보다 크다는 것은 파일이 첨부되었다는 것이고, upload의 절대경로를 얻어내야한다.
				String path = servletContext.getRealPath(uploadPath);
				
				// 첨부파일 가져오기
				MultipartFile upload = vo.getUpload();
				String f_name = upload.getOriginalFilename();
				
				// 이미 같은 이름이 있을 경우 파일명을 변경한다.
				f_name = FileSaveUtil.checkSameFileName(f_name, path);
				
				// 파일저장!
				//upload.transferTo(new File(path,f_name));
				upload.transferTo(new File(path,f_name));
				
				// 파일명 저장
				vo.setUploadFileName(f_name);
				
			}else
				vo.setUploadFileName("");
			
			// ip지정
			vo.setIp(request.getRemoteAddr());
			vo.setBname("BBS");
			
			// DB저장
			fdao.wirteBbs(vo);
			
			// 반환객체 생성
			ModelAndView mv = new ModelAndView();
			
			// ReDirect개념으로 list.inc를 뷰지정 
			mv.setViewName("redirect:/freeBoard.inc");
	 		
			
			return mv;
		}
			
	
}
