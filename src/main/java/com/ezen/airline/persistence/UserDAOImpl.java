package com.ezen.airline.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ezen.airline.domain.UserVO;

@Repository // UserDAO인터페이스를 구현한 UserDAOImpl클래스이다
public class UserDAOImpl implements UserDAO {

	@Inject // myBatis호출하는 어노테이션
	private SqlSession sql;

	// mapper
	private static String namespace = "com.ezen.airline.mappers.userMapper";

	// 회원가입한다
	@Override
	public void signup(UserVO uservo) throws Exception {
		sql.insert(namespace + ".signup", uservo);
	}

	//중복회원가입을 막기위해 유저리스트를 가져온다
	@Override
	public List<String> userList() throws Exception {
		return sql.selectList(namespace + ".userList");
	}

	// 로그인한다
	@Override
	public UserVO signin(UserVO vo) throws Exception {
		return sql.selectOne(namespace + ".signin", vo);
	}

	//회원정보 수정을 처리한다(POST)
	@Override
	public void updateUser(UserVO uservo) throws Exception {

		sql.update(namespace + ".updateUser", uservo);
	}

	//회원탈퇴처리한다
	@Override
	public void deleteUser(String userId) throws Exception {
		sql.delete(namespace + ".deleteUser", userId);
	}

} // end public class UserDAOImpl
