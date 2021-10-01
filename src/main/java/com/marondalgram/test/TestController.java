package com.marondalgram.test;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.marondalgram.test.bo.TestBO;

@Controller
public class TestController {

	@Autowired
	private TestBO testBO;
	
	@ResponseBody
	@RequestMapping("/test1")
	public String test () {
		return "!!hello masterJ!!";
	}
	
	//DB ���� �׽�Ʈ
	@ResponseBody
	@RequestMapping("/testDB")
	public List<Map<String, Object>> testBD () {
		return testBO.getUserList();
	}
	
	//JSP 페이지 테스트
	@RequestMapping("/testJSP")
	public String testJSP () {
		return "test/test";
	}
}

