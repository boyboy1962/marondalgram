package com.marondalgram.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.marondalgram.common.EncryptUtils;
import com.marondalgram.user.bo.UserBO;
import com.marondalgram.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@PostMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
				@RequestParam("loginId") String loginId
			){
		// 아이디 중복 여부 DB 조회
		boolean existLoginId = userBO.existLoginId(loginId);
		
		// 중복 여부에 대한 결과 Map 생성
		Map<String, Object> result = new HashMap<>();
		result.put("result", existLoginId);
		
		// return map
		return result;
	}
	
	@PostMapping("/sign_up")
	public Map<String, String> sign_up(
				@ModelAttribute User user
			){
		// 비밀번호 MD5 해싱
		String encryptPassword = EncryptUtils.md5(user.getPassword());
		user.setPassword(encryptPassword);
		// 정보 DB로 보내서 저장하기
		userBO.addUser(user);
		// 성공 여부에 대한 결과 Map 생성
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		// 결과 보내기
		return result;
		
	}
	
	
}
