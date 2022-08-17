package com.ezen.airline.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
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

import com.ezen.airline.domain.AirportVO;
import com.ezen.airline.domain.CriteriaVO;
import com.ezen.airline.domain.FlightVO;
import com.ezen.airline.domain.ItineraryVO;
import com.ezen.airline.domain.ReservationVO;
import com.ezen.airline.domain.SeatVO;
import com.ezen.airline.domain.UserVO;
import com.ezen.airline.service.AdminService;
import com.ezen.airline.service.AirlineService;

@Controller
@RequestMapping("/airline/*")
public class AirlineController {

	private static final Logger logger = LoggerFactory.getLogger(AirlineController.class);

	@Inject
	AirlineService airlineservice;

	@Inject
	AdminService service;

	// ******************** 항공권 예매 ********************

	// 항공권예매위해 search화면으로 이동한다
	@RequestMapping(value = "/reservation/search")
	public void search(Model model) throws Exception {

		List<AirportVO> airportList = service.airportList();
		model.addAttribute("airportList", airportList);

	}

	// search화면에서 비행스케줄 지정 시 조건에 맞는 항공편만 보여준다
	@RequestMapping("/reservation/avail_list")
	public String listbySchedule(HttpSession session, ItineraryVO itineraryVO, int carrierd, Model model) throws Exception {

		//로그인안되어있으면 user값에 null , 되어있으면 user값에 UserVO타입의 로그인값들
		UserVO user = (UserVO) session.getAttribute("user");
		model.addAttribute("user", user);
		//logger.info("유저값" + user);
		//int jimin = user.getUserNum();
		//logger.info("아아아아ㅏ아아" + jimin);
		// 가는 여정에 해당하는 depCode와 arrCode의 flight값을 가져온다
		// (avail_list.jsp에 ICN->PEC 을 표시하기 위함)
		FlightVO goFlight = airlineservice.goFlight(itineraryVO);
		model.addAttribute("goFlight", goFlight);

		// depTime에 가는날꺼,오는날꺼 2개이고
		// depTime은 String타입이니까 String타입의 배열에 담아서 ','를 기준으로 스플릿한다
		String depTime = itineraryVO.getDepTime();
		//logger.info("나누기 전 depTime값" + depTime);
		String[] array = depTime.split(",");
		model.addAttribute("depTimeOfreturn", array[1]);
		//array[1]의 초기 value는 '오는날 선택'임

		//for (int i = 0; i < array.length; i++) {
		//	System.out.println("depTime값" + array[i]);
		//}
		String depCode = itineraryVO.getDepCode();
		String arrCode = itineraryVO.getArrCode();

		// search페이지에서 선택한 조건에따른 스케줄을 가져온다
		// 첫번째List는 가는날, 두번째List는 오는날
		List<ItineraryVO> itineraryList = airlineservice.listBySchedule(array[0], depCode, arrCode);
		logger.info("가는날목록" + itineraryList);
		model.addAttribute("itineraryList", itineraryList);

		List<ItineraryVO> itineraryList2 = airlineservice.listBySchedule2(array[1], depCode, arrCode);
		logger.info("오는날목록" + itineraryList2);
		model.addAttribute("itineraryList2", itineraryList2);

		// depCode와 arrCode와 depTime을 조건으로 줬을 때 여정갯수
		int itineraryCount1 = airlineservice.getCountItinerary(array[0], depCode, arrCode);
		model.addAttribute("itineraryCount1", itineraryCount1);

		int itineraryCount2 = airlineservice.getCountItinerary2(array[1], depCode, arrCode);
		model.addAttribute("itineraryCount2", itineraryCount2);
		logger.info(itineraryCount2 + "2");

		model.addAttribute("carrierd", carrierd);
		logger.info("캐리어드" + carrierd);
		return "/airline/reservation/avail_list";
	}

	// 기종번호에 맞춰서 최대인원수 초과 못하게 막기
	@ResponseBody
	@RequestMapping("/reservation/maxCarrierd_count")
	public int maxCarrierd_count(SeatVO seatVO) throws Exception {
		logger.info("싯브이오" + seatVO);

		//해당하는 itnyName에 등록된 최대 탑승객 수 와 예약된 booked의 수도 가져온다
		ItineraryVO itineraryVO = airlineservice.getAcftCarrd(seatVO.getItnyName());
		logger.info("기종에 해당하는 최대인원 수" + itineraryVO); //여기에는 acftCarrd와 booked 

		//seatVO의 carrierd(선택한인원수)의 값이랑 itneraryVO의 booked값을 더해서 acftCarrd넘으면 
		int result = 1;
		if ((itineraryVO.getBooked() + seatVO.getCarrierd()) > itineraryVO.getAcftCarrd()) {
			result = 0;
		}
		return result;
	}

	// 좌석선택하러가기 (get)
	@RequestMapping(value = "/reservation/selectSeat", method = RequestMethod.GET)
	public String getReservRegi(SeatVO seatVO, int carrierd, Model model, CriteriaVO cri, HttpSession session) throws Exception {

		//UserVO user = (UserVO) session.getAttribute("user");
		//model.addAttribute("user", user);

		//user값이 없다면 로그인화면으로 보내자
		//if (user == null) {
		//	return "redirect:/user/signin";
		//}

		//avail_lisg.jsp에서 itnyName,carrierd,goPrice,comePrice
		//이렇게 넘겨받음 이중에 db컬럼은 itnyName뿐..!!
		logger.info("seatVO타입으로 넘어온값들" + seatVO);

		//참고로 avail_list.jsp에서 itnyName이라는 name속성으로 itnyName이 두개왔다...
		//편도면 itnyName2라는 id값에 "" 값을 넣어줌.. 안넣어주면 400오류
		//왜? itnyName2라는 값자체가 이 메소드에 없으면 안돼..밑에 스플릿메소드써야되거등
		String[] array = seatVO.getItnyName().split(",");

		//itnyName에 해당하는 항공편명,출발지,도착지 가져온다
		FlightVO flightVO0 = service.flightByItnyName(array[0]);
		model.addAttribute("flightVO0", flightVO0);

		FlightVO flightVO1 = service.flightByItnyName(array[1]);
		model.addAttribute("flightVO1", flightVO1);

		//넘어온 가는여정번호와 오는여정번호를 사용해서 좌석목록을 뿌려줄것
		List<SeatVO> seatList0 = airlineservice.seatList0(array[0]);
		logger.info("시트리스트0" + seatList0);
		model.addAttribute("seatList0", seatList0);

		List<SeatVO> seatList1 = airlineservice.seatList1(array[1]);
		logger.info("시트리스트1" + seatList1);
		model.addAttribute("seatList1", seatList1);

		//goPrice,comePrice에는 인원 수가 곱해진 항공권이있어서 인원수를 나눠줄꺼임
		int goPriceper1 = seatVO.getGoPrice() / carrierd;
		logger.info("가능항공권 1인 가격" + goPriceper1);
		model.addAttribute("goPriceper1", goPriceper1);

		int comePriceper1 = seatVO.getComePrice() / carrierd;
		logger.info("오는항공권 1인 가격" + comePriceper1);
		model.addAttribute("comePriceper1", comePriceper1);

		//seatList0에서뽑아쓸수없어서따로보내줌...
		//뽑아쓸수없는이유는 저 값은 List타입이라서 c:forEach안에 들어가있어야만 사용ok
		model.addAttribute("itnyName0", array[0]);
		model.addAttribute("itnyName1", array[1]);

		//인원 수도 seatVO에 주입할수는있는데 그냥 그렇게 안하고 따로보내야지
		model.addAttribute("carrierd", carrierd);

		return "airline/reservation/selectSeat";
	}

	//선택한 좌석들 목록을 보여주자..
	@ResponseBody //REQUESTBODY는 반드시 POST방식
	@RequestMapping("/reservation/airline/reservation/seatCheck")
	public SeatVO[] seatCheck(SeatVO seatVO, HttpSession session) throws Exception {
		//selectSeat.jsp의 자바스크립트에서 받아온 값들을 넘겨줘서 가져온다
		//seatNum,seatClass,itnyName만 받아옴
		logger.info("선택한시트리스트값" + seatVO);

		String[] array_seatNum = seatVO.getSeatNum().split(",");
		String[] array_seatClass = seatVO.getSeatClass().split(",");

		//체크박스 누름과 동시에 왔다가서 체크박스에 체크한 갯수만큼 왔다갔다함
		String itnyName = seatVO.getItnyName();
		logger.info(itnyName + "무슨 여정번호?");

		//결국 array_seatNum 마지막엔 선택한 수만큼인..2명이면 2겠지
		int count = array_seatNum.length;
		SeatVO[] arr = new SeatVO[count]; //Seat타입이면서 count크기 선언 및 할당
		logger.info("갯수" + count);

		SeatVO seatList = null;
		for (int i = 0; i < count; i++) {
			seatList = airlineservice.seatCheck(array_seatNum[i], array_seatClass[i], itnyName);
			arr[i] = seatList;
		}
		return arr;
	}

	// 결제하기 버튼 누른 후 이동하는 예약확인 페이지
	@ResponseBody
	@RequestMapping("/reservation/confirm_reservation")
	public String confirm_reservation(ReservationVO reservationVO, HttpServletRequest request, RedirectAttributes rttr, Model model,
			HttpSession session) throws Exception {
		// RedirectAttributes rttr객체.addFlashAttribute라는 메소드는
		// 데이터를 전달할수있는데 String이랑 map,list,object즉 참조형타입도 전달가능

		//매퍼에서 가져온값을 ReservationVO에 프로퍼티에 넣어준다. 없는 값들은 NULL처리해서 온다
		logger.info("결제하기 클릭 시 레저베이션브이오=>" + reservationVO);
		//지금 이 reservationVO에는 Ajax로 넣어준 값 밖에없음..

		//session객체에 로그인한 값 가져와서 가져온 레저베이션브비오에 userNum을 넣어준다

		UserVO user = (UserVO) session.getAttribute("user");

		if (user != null) { //로그인했으면
			reservationVO.setUserNum(user.getUserNum());
		}

		//없는 resrvNum을 생성해준다
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String resrvNum = ymd + "_" + subNum;

		//가져온 레저베이션브이오에 생성resrvNum을 넣어준다
		reservationVO.setResrvNum(resrvNum);

		//userNum에 해당하는 id를 가져와서 보내준다.
		//String id = airlineservice.getUserId(reservationVO.getUserNum());
		//model.addAttribute("id", id);

		//이제 넣은 값을 가지고 등록하러간다
		logger.info("예약할 레저베이션브이오값" + reservationVO);
		airlineservice.reservRegi(reservationVO);

		//rttr.addFlashAttribute("vo", reservationVO);
		/*
		 * String[] array_seatNum_go = request.getParameterValues("seatNum_go"); //3a 5a
		 * String[] array_seatNum_come = request.getParameterValues("seatNum_come");
		 * String seatNum_go = Arrays.toString(array_seatNum_go);
		 * 
		 * String account = request.getParameter("account"); String itnyName_go =
		 * request.getParameter("itnyName_go"); String itnyName_come =
		 * request.getParameter("itnyName_come");
		 */
		return reservationVO.getResrvNum();
	}

	// ******************** 예약조회 ********************

	// 결제하기가 확정되면 예약한 내용을 보여준다
	@RequestMapping(value = "/reservation/confirmReservation", method = RequestMethod.GET)
	public String confirm_reservation(@RequestParam String resrvNum, HttpServletRequest request, Model model) throws Exception {

		//Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		//if (flashMap != null) {
		//	vo = (ReservationVO) flashMap.get("vo");
		//}

		//seatNum_go에있는 값이랑 seatNum_come에있는값들 , 기준으로 스플릿하기 위해 필요
		ReservationVO reservationVO = airlineservice.seatNum_split(resrvNum);
		logger.info("쪼개기전값들" + reservationVO);

		// 내가 지금예약한 예약번호에 맞는 예약편(가는거랑오는거)
		ReservationVO reserveList0 = airlineservice.reserveList0(resrvNum);
		model.addAttribute("reserveList0", reserveList0);

		ReservationVO reserveList1 = airlineservice.reserveList1(resrvNum);
		model.addAttribute("reserveList1", reserveList1);

		String[] seatNum_go_array = reservationVO.getSeatNum_go().split(",");

		for (int i = 0; i < seatNum_go_array.length; i++) {
			airlineservice.occupySeat(seatNum_go_array[i], reserveList0.getItnyName_go());
		}

		if (reservationVO.getSeatNum_come() != null) { //왕복일 때 실행
			String[] seatNum_come_array = reservationVO.getSeatNum_come().split(",");
			for (int i = 0; i < seatNum_go_array.length; i++) {
				airlineservice.occupySeat(seatNum_come_array[i], reserveList1.getItnyName_come());
			}
			int count2 = airlineservice.count_N(reserveList1.getItnyName_come());
			airlineservice.updateBooked(count2, reserveList1.getItnyName_come());
		}

		//예약을 한 후 itnyName에 해당하는 seatNum중에 avail컬럼이 'N'인것의 갯수를 센다
		int count1 = airlineservice.count_N(reserveList0.getItnyName_go());

		//count를 tbl_itinerary의 booked에 업뎃한다..
		airlineservice.updateBooked(count1, reserveList0.getItnyName_go());

		logger.info("가는리저브리스트=>" + reserveList0);
		logger.info("오는리저브리스트=>" + reserveList1);
		return "/airline/reservation/confirm_reservation"; //jsp로이동
	}

	//예약번호로 예약조회 시 뿌려주는 화면
	//a태그를 통해 여기로 오기때문에 (get요청으로 들어옴)
	@RequestMapping(value = "/reservation/checkReservation", method = RequestMethod.GET)
	public void insertReservation() throws Exception {
		logger.info("예약번호 입력하는 화면");
	}

	//입력한예약번호가 있는지 확인한다
	@ResponseBody
	@RequestMapping(value = "/reservation/findResrvNum")
	public int findResrvNum(String resrvNum) throws Exception {
		logger.info(resrvNum + "넘어온예약번호");
		List<String> resrvnumList = new ArrayList<>();
		resrvnumList.addAll(airlineservice.resrvnumList());

		int result = 0;
		for (int i = 0; i < resrvnumList.size(); i++) {
			if (resrvnumList.get(i).equals(resrvNum)) {
				result = 1;
			}
		}
		return result;
	}

	//예약확인하는 화면으로 이동 (post요청으로 들어옴)
	@RequestMapping(value = "/reservation/checkReservation", method = RequestMethod.POST)
	public String viewReservation(String resrvNum, Model model) throws Exception {
		logger.info("입력한 예약번호" + resrvNum);
		// 내가 지금예약한 예약번호에 맞는 예약편(가는거랑오는거)
		ReservationVO reserveList0 = airlineservice.reserveList0(resrvNum);
		model.addAttribute("reserveList0", reserveList0);

		ReservationVO reserveList1 = airlineservice.reserveList1(resrvNum);
		model.addAttribute("reserveList1", reserveList1);

		logger.info("가는리저브리스트=>" + reserveList0);
		logger.info("오는리저브리스트=>" + reserveList1);
		return "/airline/reservation/confirm_reservation";
	}

	//*****************웹체크인*******************************
	@RequestMapping("/reservation/webCheck-in")
	public void webCheckin() throws Exception {
		logger.info("웹체크인화면");
	}

}
// end public class AdminController
