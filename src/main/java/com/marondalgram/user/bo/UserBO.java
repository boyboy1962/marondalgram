package com.marondalgram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondalgram.user.dao.UserDAO;
import com.marondalgram.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public boolean existLoginId(String loginId) {
		return userDAO.existLoginId(loginId);
	}

	public void addUser(User user) {
		userDAO.insertUser(user);
	}

	public User getUserInfoByUserInput_LoginIdAndPassword_(User userInput) {
		return userDAO.selectUserInfoByUserInput_LoginIdAndPassword_(userInput);
	}

}
