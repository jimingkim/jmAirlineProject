package com.ezen.airline.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.airline.domain.AircraftVO;
import com.ezen.airline.domain.AirportVO;
import com.ezen.airline.domain.FlightVO;
import com.ezen.airline.domain.ItineraryVO;
import com.ezen.airline.domain.SeatVO;
import com.ezen.airline.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	AdminService service;

	// ******************** airport 취항지관리 ********************

	// 공항목록을 불러온다
	@RequestMapping(value = "/airport/airport_list", method = RequestMethod.GET)
	public void getAirportList(Model model) throws Exception {
		logger.info("get airport list");

		List<AirportVO> airportList = service.airportList();
		model.addAttribute("airportList", airportList);

		// int count = service.airportCount();
		// CriteriaVO pageMake = new CriteriaVO(cri, count);
		// model.addAttribute("pageMaker", pageMake);
	}

	// 공항(취항지)을 등록하는 form을 불러온다 (get)
	@RequestMapping(value = "/airport/airport_register", method = RequestMethod.GET)
	public void getAirport_register(Model model) throws Exception {
		logger.info("get register airport");

		// 기존의 공항목록을 airport_register.jsp로 갖다준다
		List<AirportVO> airportList = service.airportList();
		model.addAttribute("airportList", airportList);
	}

	// 공항(취항지)을 등록한다 (post)
	@RequestMapping(value = "/airport/airport_register", method = RequestMethod.POST)
	public String postAirportRegi(AirportVO airportVO) throws Exception {
		logger.info("post register airport");

		// insert문 사용해서 db에 공항등록
		service.airport_register(airportVO);
		return "redirect:/admin/airport/airport_list";
	}

	// 공항에 대한 정보를 수정한다(get)
	@RequestMapping(value = "/airport/airport_modify", method = RequestMethod.GET)
	public void getAirportModify(@RequestParam String aptCode, Model model) throws Exception {
		model.addAttribute("aptCode", aptCode);
	}

	// 공항에 대한 정보를 수정한다(post)
	@RequestMapping(value = "/airport/airport_modify", method = RequestMethod.POST)
	public String postAirportModify(AirportVO vo) throws Exception {
		System.out.println("갑" + vo);// logger.info("값"+vo);
		service.airport_modify(vo);

		return "redirect:/admin/airport/airport_list";
	}
	// 공항에 대한 정보를 수정한다(ajax)
	// @ResponseBody
	// @RequestMapping(value="/airport/airport_modify",method=RequestMethod.POST)
	// public int postAirportModify(AirportVO vo) throws Exception{
	// int result = service.airport_modify(vo);

	// System.out.println(result);
	// return result;
	// }

	// 공항을 삭제한다 (AJAX)
	@ResponseBody
	@RequestMapping(value = "/airport/airport_delete", method = RequestMethod.POST)
	public int postAirportDel(AirportVO vo) throws Exception {

		int result = service.airportDel(vo.getAptCode());
		System.out.println(result);
		logger.info("가져온공항코드" + vo.getAptCode());
		return result;
	}

	// ******************** aircraft ********************

	// 항공기 목록을 불러온다
	@RequestMapping(value = "/aircraft/aircraft_list", method = RequestMethod.GET)
	public void getAircraftList(Model model) throws Exception {
		logger.info("get aircraft_list");

		List<AircraftVO> aircraftVO = service.aircraftList();
		model.addAttribute("aircraftVO", aircraftVO);
	}

	// 항공기를 등록하는 form을 가져온다 (get)
	@RequestMapping(value = "/aircraft/aircraft_register", method = RequestMethod.GET)
	public void getAircraftRegister() throws Exception {
		logger.info("get register aircraft");
	}

	// 항공기를 등록한다 (post)
	@RequestMapping(value = "/aircraft/aircraft_register", method = RequestMethod.POST)
	public String postAircraftRegister(AircraftVO aircraftVO) throws Exception {
		logger.info("post regist aircraft");

		service.aircraft_register(aircraftVO);

		return "redirect:/admin/aircraft/aircraft_list";
	}

	// 항공기를 삭제한다
	@RequestMapping(value = "/aircraft/aircraft_list", method = RequestMethod.POST)
	public String postAircraftDel(String acftName) throws Exception {

		service.aircraftDel(acftName);

		return "redirect:/admin/aircraft/aircraft_list"; // get방식 url로 연결

	}

	// ******************** flight ********************

	// 항공편명 목록을 가져온다
	@RequestMapping(value = "/flight/flight_list", method = RequestMethod.GET)
	public void getFlightList(Model model) throws Exception {
		logger.info("get flight list");

		List<FlightVO> flightList = service.flightList();
		model.addAttribute("flightList", flightList);
	}

	// 항공편명을 등록하는 form을 가져온다(get)
	@RequestMapping(value = "/flight/flight_register", method = RequestMethod.GET)
	public void getFlightRegi(Model model) throws Exception {
		logger.info("get regist flight");

		List<FlightVO> flightList = service.flightList();
		model.addAttribute("flightList", flightList);
		List<AirportVO> airportList = service.airportList();
		model.addAttribute("airportList", airportList);
	}

	// 항공편명을 등록한다 (post)
	@RequestMapping(value = "/flight/flight_register", method = RequestMethod.POST)
	public String postFlightRegi(FlightVO vo) throws Exception {
		logger.info("post regist flight");

		service.flightRegi(vo);

		return "redirect:/admin/flight/flight_list";
	}

	// 항공편명을 삭제한다
	@RequestMapping(value = "/flight/flight_list", method = RequestMethod.POST)
	public String postFlightDel(FlightVO vo) throws Exception {
		logger.info("post flight delete");

		service.flightDel(vo.getFlgtName());
		return "redirect:/admin/flight/flight_list";
	}

	// 항공편명 수정양식으로 이동한다(get)
	@RequestMapping(value = "/flight/flight_modify", method = RequestMethod.GET)
	public void flight_modify(@RequestParam String flgtName, Model model) throws Exception {

		List<AirportVO> airportList = service.airportList();
		model.addAttribute("airportList", airportList);

		// 특정flgtName에 해당하는 항공편 정보를가져온다
		FlightVO flightVO = service.flightListByFlgtName(flgtName);
		model.addAttribute("flightVO", flightVO);
		logger.info("과연" + flightVO);
	}

	// 항공편명 수정한다(POST)
	@RequestMapping(value = "/flight/flight_modify", method = RequestMethod.POST)
	public String flight_modify(FlightVO flightVO, Model model) throws Exception {

		service.flight_modify(flightVO);

		return "redirect:/admin/flight/flight_list";
	}

	// ******************** itinerary ********************

	// 비행일정 목록을 뿌려준다
	@RequestMapping(value = "/itinerary/itinerary_list", method = RequestMethod.GET)
	public void getItineraryList(Model model) throws Exception {
		List<ItineraryVO> itineraryList = service.itineraryList();
		model.addAttribute("itineraryList", itineraryList);

		List<FlightVO> flightList = service.flightList();
		model.addAttribute("flightList", flightList);
	}

	// 비행일정 등록페이지로 이동한다
	@RequestMapping(value = "/itinerary/itinerary_register", method = RequestMethod.GET)
	public void getItineraryRegi(Model model) throws Exception {
		logger.info("get regist itinerary");

		List<FlightVO> flightList = service.flightList();
		model.addAttribute("flightList", flightList);
		logger.info("flightList값" + flightList);

		List<AircraftVO> aircraftList = service.aircraftList();
		model.addAttribute("aircraftList", aircraftList);
	}

	// 비행일정 등록을 처리해준다
	@RequestMapping(value = "/itinerary/itinerary_register", method = RequestMethod.POST)
	public String postItineraryRegi(ItineraryVO vo) throws Exception {

		service.itineraryRegi(vo);
		return "redirect:/admin/itinerary/itinerary_list";
	}

	// 비행일정을 수정하는 양식으로 이동한다
	@RequestMapping(value = "/itinerary/itinerary_modify", method = RequestMethod.GET)
	public void itinerary_modify(@RequestParam("itnyName") String itnyName, Model model) throws Exception {

		ItineraryVO itineraryVO = service.findItinerary(itnyName);
		logger.info(itineraryVO + "가져온비행일정");
		model.addAttribute("itineraryVO", itineraryVO);

		List<FlightVO> flightList = service.flightList();
		model.addAttribute("flightList", flightList);

		List<AircraftVO> aircraftList = service.aircraftList();
		model.addAttribute("aircraftList", aircraftList);
	}

	// 비행일정을 수정한다
	@RequestMapping(value = "/itinerary/itinerary_modify", method = RequestMethod.POST)
	public String itinerary_modify(ItineraryVO vo) throws Exception {

		service.itinerary_modify(vo);

		return "redirect:/admin/itinerary/itinerary_list";
	}

	// 비행일정을 삭제한다
	@RequestMapping(value = "/itinerary/itinerary_list")
	public String postItineraryDel(@RequestParam("itnyName") String itnyName) throws Exception {
		service.itineraryDel(itnyName);
		return "redirect:/admin/itinerary/itinerary_list";
	}

	// *********************seat*********************

	// header에서 좌석현황 클릭 시 a태그를 이용해서 아래 url로 이동함
	// a태그의 method는 기본이 get이라서 method에 post를주면 못넘어옴 아예주지말던가 GET으로주던가해야함
	@RequestMapping(value = "/seat/seat_list", method = RequestMethod.GET)
	public void seat_list(Model model) throws Exception {

		List<ItineraryVO> itineraryList = service.itineraryList();
		model.addAttribute("itineraryList", itineraryList);
	}

	// 좌석현황버튼을 클릭 시 좌석세부사항을 보여준다 항상
	@RequestMapping(value = "/seat/detail_seat_list", method = RequestMethod.GET)
	public String seat_list(Model model, ItineraryVO itineraryVO) throws Exception {
		String itnyName = itineraryVO.getItnyName();
		model.addAttribute("itnyName", itnyName);

		//itnyName에 해당하는 항공편명,출발지,도착지 가져온다
		FlightVO flightVO = service.flightByItnyName(itnyName);
		model.addAttribute("flightVO", flightVO);
		// itnyName에 해당하는 좌석목록들을 가져온다
		List<SeatVO> seatList = service.seat_list(itnyName);
		model.addAttribute("seatList", seatList);
		return "admin/seat/detail_seat_list";
	}

} // end public class AdminController
