package spring.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownload
 */
@WebServlet("/FileDownload")
public class FileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public FileDownload() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터값 받기(dir, filename)
		String dir = request.getParameter("dir");
		String fname = request.getParameter("filename");
		String docName = URLEncoder.encode(fname,"UTF-8");
	
		// dir을 절대경로로 만든다.
		String path = getServletContext().getRealPath(dir);
		
		// 전체 경로
		String fullPath = path+System.getProperty("file.separator")+fname;
		
		// 전체 경로로 file객체 생성
		File f = new File(fullPath);
		
		// 바구니 역활
		byte[] buf = new byte[2048];
		
		// 전송할 데이터가 Stream처리될 때 문자셋 지정
		response.setContentType("application/octet-stream;charset=8859-1");
		
		// 다운로드 대화상자 처리
		response.setHeader("Content-Disposition",
				"attachment;filename="+ docName +
				new String(fname.getBytes(),"ISO8859_1")+";");
		
		// 전송타입이 이진데이터(binary)
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		if(f.isFile()){
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
			
			// 요청한 곳으로 보내기 위해 스트림을 요청객체(response)로 부터 얻어낸다.
			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
			
			int size = -1; // 기본값
			
			try {
				while((size = bis.read(buf)) != -1){
					bos.write(buf,0,size);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(bos != null)
					bos.close();
				if(bis != null)
					bis.close();
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
