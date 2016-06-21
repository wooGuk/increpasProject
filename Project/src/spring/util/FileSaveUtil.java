package spring.util;

import java.io.File;

public class FileSaveUtil {
	
	public static String checkSameFileName(String filename, String path){
		
		int period = filename.lastIndexOf(".");
		String f_name = filename.substring(0,period); // test
		String suffix = filename.substring(period); // .txt
		
		// 전체경로 만들기
		String savaFileName = path+
				System.getProperty("file.separator")+filename;
		
		// 전체경로로 file객체 생성
		File f = new File(savaFileName);
		int idx = 1;
		while(f != null && f.exists()){
			// 동일한 파일이 있는 경우
			
			// 파일명 변경
			StringBuffer sbuf = new StringBuffer();
			sbuf.append(f_name);
			sbuf.append(idx++);
			sbuf.append(suffix);
			
			filename = sbuf.toString(); // 파일명 변경
			
			// 전체경로 다시 만들기
			savaFileName = path+System.getProperty("file.separator")+filename;
			
			// 변경된 전체경로로 File객체 다시 생성
			f = new File(savaFileName);
		} // while문의 끝
		
		return filename;
	}
}
