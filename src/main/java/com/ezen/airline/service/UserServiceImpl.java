package com.ezen.airline.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.ezen.airline.domain.UserVO;
import com.ezen.airline.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Inject // dao를 주입시킨다
	private UserDAO userdao;

	// 회원가입한다
	@Override
	public void signup(UserVO uservo) throws Exception {
		userdao.signup(uservo);
	}

	//중복회원가입을 막기위해 유저리스트를 가져온다
	@Override
	public List<String> userList() throws Exception {
		return userdao.userList();
	}

	// 로그인한다
	@Override
	public UserVO signin(UserVO vo) throws Exception {

		// 사용자가 입력한 정보가 UserVO타입의 vo에 담겨왓고
		// 그 정보는 dao에서 myBastis로 보내서 체크한 후
		// service로 돌아온다
		// 이때 맞으면 모든 사용자 정보가 넘어오고 틀리면 null이 넘어온다
		//UserVO user = userdao.signin(vo);

		//if (user != null) { // 즉, 사용자정보가 넘어왔다면
		//session.setAttribute("userId", vo.getUserId());
		// "세션변수명", 값 =>기본 15분동안 로그인상태
		//session.setAttribute("user", user);
		// 모든 user정보를 user라는 세션변수명에 담아서 세팅한다
		return userdao.signin(vo);

		// -> user의 값이 null일수도있고 값이 세팅되었을수도있고...
		// return dao.signin(vo);
	}

	// 로그아웃한다
	@Override
	public void signout(HttpSession session) throws Exception {
		session.invalidate();
	}

	//회원정보 수정을 처리한다(POST)
	@Override
	public void updateUser(UserVO uservo) throws Exception {
		userdao.updateUser(uservo);
	}

	//회원탈퇴처리한다
	@Override
	public void deleteUser(String userId) throws Exception {
		userdao.deleteUser(userId);
	}

} // end public class UserServiceImpl
