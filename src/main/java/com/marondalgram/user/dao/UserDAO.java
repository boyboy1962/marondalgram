package com.marondalgram.user.dao;

import org.springframework.stereotype.Repository;

import com.marondalgram.user.model.User;

@Repository
public interface UserDAO {

	public boolean existLoginId(String loginId);

	public void insertUser(User user);

}
