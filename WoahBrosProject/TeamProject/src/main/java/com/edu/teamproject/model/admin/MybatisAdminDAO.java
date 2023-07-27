package com.edu.teamproject.model.admin;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.teamproject.domain.Admin;

@Repository
public class MybatisAdminDAO implements AdminDAO {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	/*
	 @Autowired 
	 private SqlSessionTemplate SqlSessionTemplate;
	 */
	
/*
	@Override
	public Admin select(Admin admin) throws AdminException {
		Admin obj = SqlSessionTemplate.selectOne("Admin.select", admin);
		logger.info("obj is" + obj);

		if (obj == null) {
			throw new AdminException("올바르지 않은 정보입니다.");
		}
		return obj;
	}
*/
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Admin select(Admin admin) {
	return sqlSession.selectOne("admin.login_check", admin);
	 }
	
}
