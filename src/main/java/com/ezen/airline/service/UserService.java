package com.ezen.airline.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.ezen.airline.domain.UserVO;

public interface UserService {

	// 회원가입한다
	public void signup(UserVO uservo) throws Exception;

	//중복회원가입을 막기위해 유저리스트를 가져온다
	public List<String> userList() throws Exception;

	// 로그인한다 session:사용자 인증정보 처리하는 클래스
	public UserVO signin(UserVO vo) throws Exception;

	// 로그아웃한다
	public void signout(HttpSession session) throws Exception;

	//회원정보 수정을 처리한다(POST)
	public void updateUser(UserVO uservo) throws Exception;

	//회원탈퇴처리한다
	public void deleteUser(String userId) throws Exception;

} // end public interface UserService
