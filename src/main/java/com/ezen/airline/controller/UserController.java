package com.ezen.airline.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.airline.domain.UserVO;
import com.ezen.airline.service.AdminService;
import com.ezen.airline.service.UserService;

@Controller
@RequestMapping("/user/*") // 공통적인 url 매핑
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	UserService userservice;

	@Inject
	AdminService adminservice;

	// 회원등록하는 페이지로 이동한다(GET)
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void getSignup() throws Exception {
		logger.info("get signup");
	}

	// 회원등록 처리한다 (POST)
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(UserVO uservo) throws Exception {
		logger.info("post signup");
		userservice.signup(uservo);

		return "redirect:/user/signin";
	}
	//@Autowired
	//BCryptPasswordEncoder passEncoder;
	//String inputPass = uservo.getPasswd();
	//String pass = passEncoder.encode(inputPass);
	//uservo.setPasswd(inputPass);

	//중복회원을 방지한다 AJAX
	@ResponseBody
	@RequestMapping(value = "blockSignup")
	public int blockSignup(String userId) throws Exception {
		logger.info("넘어온아이디" + userId);
		List<String> userList = new ArrayList<String>();
		userList.addAll(userservice.userList());

		int result = 0;
		for (int i = 0; i < userList.size(); i++) {
			if (userList.get(i).equals(userId)) {
				result = 1;
			}
		}
		return result;
	}

	// 로그인하는 화면으로 간다 (GET)
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception {
		logger.info("get signin");
	}

	//로그인처리한다 (POST)

	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String postSignin(UserVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {

		HttpSession session = req.getSession(); //

		//넘겨받은 회원정보를 가지고 userservice로 간다
		UserVO user = userservice.signin(vo);

		if (user != null) { // 이값이 NULL이면 다시 실행한다!! 
			logger.info("유저값" + user);
			session.setAttribute("user", user);
			if (user.getVerify() == 1) {//관리자라는 뜻이므로 관리자 홈으로 이동 
				return "redirect:/admin_home";
			}
		} else {
			logger.info("user값이 없다면?!" + user);
			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg2", false);
			return "redirect:/user/signin";

		}
		return "redirect:/"; // home으로가는 메소드실행
	}

	//		//boolean passMatch = passEncoder.matches(vo.getPasswd(), user.getPasswd());
	//		String passwd = user.getPasswd();
	//		String inputpasswd = vo.getPasswd();
	//		if (user != null && passwd == inputpasswd) { // 이값이 null이 아니기도하고 비밀번호도 일치한다?! 그러면
	//			session.setAttribute("user", user);
	//			if (user.getVerify() == 1) {//관리자라는 뜻이므로 관리자 홈으로 이동 
	//				return "redirect:/admin_home";
	//			}
	//		} else {
	//			session.setAttribute("user", null);
	//			rttr.addFlashAttribute("msg2", false);
	//			return "redirect:/user/signin";
	//		}

	// 로그아웃한다
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {
		logger.info("get sign out");
		userservice.signout(session);
		return "redirect:/";
	}

	//회원정보 수정하는 페이지로 이동한다(GET)
	@RequestMapping(value = "/updateUser")
	public String updateUser(HttpSession session, Model model) throws Exception {
		//session에 user라는 키값의 value값을 가져온다
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:/user/signin";
		}
		model.addAttribute("user", user);
		logger.info("수정할 유저 정보" + user);
		return "board/myPage/updateUser";
	}

	//회원정보 수정을 처리한다(POST)
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String updateUser(UserVO uservo) throws Exception {
		logger.info("수정 할 회원정보" + uservo);

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		uservo.setUp_Date(sdf.format(timestamp));
		userservice.updateUser(uservo);

		return "redirect:/";
	}

	//LocalTime now = LocalTime.now();
	//LocalDateTime datetime = LocalDateTime.now();
	//DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(datetime);
	//DateTimeFormatter formatter = DateTimeFormatter.ofLocalizedDateTime(FormatStyle.SHORT).withLocale(Locale.KOREA) .withZone(ZoneId.systemDefault());
	//	Instant instant = Instant.now();
	//DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(instant);
	//	String output = formatter.format(instant);

	//회원탈퇴처리한다 
	@RequestMapping(value = "/deleteUser")
	public String deleteUser(@RequestParam("userId") String userId, HttpSession session) throws Exception {
		logger.info("탈퇴처리할아이디" + userId);
		userservice.deleteUser(userId);
		session.invalidate();
		return "redirect:/";
	}

} // end public class UserController
