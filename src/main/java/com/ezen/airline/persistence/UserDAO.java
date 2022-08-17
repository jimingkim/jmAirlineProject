package com.ezen.airline.persistence;

import java.util.List;

import com.ezen.airline.domain.UserVO;

//이 인터페이스를 구현하는 클래스를 만들러 UserDAOImpl을만들자
public interface UserDAO {

	// 회원가입한다
	public void signup(UserVO uservo) throws Exception;

	//중복회원가입을 막기위해 유저리스트를 가져온다
	public List<String> userList() throws Exception;

	// 로그인한다
	public UserVO signin(UserVO vo) throws Exception;

	//회원정보 수정을 처리한다(POST)

	public void updateUser(UserVO uservo) throws Exception;

	//회원탈퇴처리한다
	public void deleteUser(String userId) throws Exception;
}
// end public interface UserVO
