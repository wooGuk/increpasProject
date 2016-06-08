package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.sun.org.apache.xalan.internal.xsltc.compiler.Template;

import mybatis.vo.TestVO;

public class TestDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	/*비니지스 로직들*/
	
	public void addMember(TestVO vo){
		template.insert("test.add",vo);
		
		}
	
}
