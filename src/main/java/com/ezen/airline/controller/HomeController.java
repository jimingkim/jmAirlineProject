package com.ezen.airline.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.airline.domain.AirportVO;
import com.ezen.airline.service.AdminService;

@Controller
@RequestMapping("/*")
public class HomeController {

	@Inject
	AdminService adminservice;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 첫화면으로가기(홈)
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getHome(Model model) throws Exception {
		logger.info("get home");
		List<AirportVO> airportList = adminservice.airportList();
		model.addAttribute("airportList", airportList);
		return "home"; // home.jsp로 간다
	}

	//매니저 첫화면으로가기(admin_home)
	@RequestMapping(value = "admin_home")
	public String admin_home() throws Exception {

		logger.info("매니저 홈");
		return "admin/admin_home";
	}

} // end public class HomeController
