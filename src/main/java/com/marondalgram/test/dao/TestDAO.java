package com.marondalgram.test.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface TestDAO {

	List<Map<String, Object>> selectUserList();

}
