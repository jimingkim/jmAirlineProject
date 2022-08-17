package com.ezen.airline.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.airline.domain.AircraftVO;
import com.ezen.airline.domain.AirportVO;
import com.ezen.airline.domain.FlightVO;
import com.ezen.airline.domain.ItineraryVO;
import com.ezen.airline.domain.SeatVO;
import com.ezen.airline.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;

	// ******************** airport ********************

	//공항목록을 불러온다
	@Override
	public List<AirportVO> airportList() throws Exception {
		return dao.airportList();
	}

	//공항(취항지)을 등록한다  (post)
	@Override
	public void airport_register(AirportVO airportVO) throws Exception {
		dao.airport_register(airportVO);
	}

	//공항에 대한 정보를 수정한다(post)
	@Override
	public void airport_modify(AirportVO vo) throws Exception {
		dao.airport_modify(vo);
	}

	//공항에 대한 정보를 수정한다(ajax)
	//@Override
	//public int airport_modify(AirportVO vo) throws Exception{
	//	return dao.airport_modify(vo);
	//}

	//공항을 삭제한다
	@Override
	public int airportDel(String aptCode) throws Exception {
		return dao.airportDel(aptCode);
	}

	// airport count
	@Override
	public int airportCount() throws Exception {
		return dao.airportCount();
	}

	// ******************** aircraft ********************

	// 항공기 목록을 불러온다 
	@Override
	public List<AircraftVO> aircraftList() throws Exception {
		return dao.aircraftList();
	}

	// 항공기를 등록한다
	@Override
	public void aircraft_register(AircraftVO aircraftVO) throws Exception {
		dao.aircraft_register(aircraftVO);
	}

	//항공기를 삭제한다
	@Override
	public void aircraftDel(String acftName) throws Exception {
		dao.aircraftDel(acftName);
	}
	// ******************** flight ********************

	//flight list
	@Override
	public List<FlightVO> flightList() throws Exception {
		return dao.flightList();

	}

	// flight regist
	@Override
	public void flightRegi(FlightVO vo) throws Exception {
		dao.flightRegi(vo);
	}

	// 항공편 삭제
	@Override
	public void flightDel(String flgtName) throws Exception {
		dao.flightDel(flgtName);
	}

	//특정flgtName에 해당하는 항공편 정보를가져온다
	@Override
	public FlightVO flightListByFlgtName(String flgtName) throws Exception {
		return dao.flightListByFlgtName(flgtName);
	}

	//항공편 수정
	@Override
	public void flight_modify(FlightVO flightVO) throws Exception {
		dao.flight_modify(flightVO);
	}

	// ******************** flight ********************
	// itinerary regist
	@Override
	public void itineraryRegi(ItineraryVO vo) throws Exception {
		dao.itineraryRegi(vo);
	}

	//특정비행일정 내용을 가져온다
	@Override
	public ItineraryVO findItinerary(String itnyName) throws Exception {
		return dao.findItinerary(itnyName);
	}

	//비행일정 목록
	@Override
	public List<ItineraryVO> itineraryList() throws Exception {
		return dao.itineraryList();
	}

	//비행일정을 수정한다
	@Override
	public void itinerary_modify(ItineraryVO vo) throws Exception {
		dao.itinerary_modify(vo);
	}

	//비행일정 삭제
	@Override
	public void itineraryDel(String itnyName) throws Exception {
		dao.itineraryDel(itnyName);
	}

	// ******************** seat ********************

	//itnyName에따른 좌석목록을 가져온다
	@Override
	public List<SeatVO> seat_list(String itnyName) throws Exception {
		return dao.seat_list(itnyName);
	}

	//itnyName에 해당하는 항공편명,출발지,도착지 가져온다
	@Override
	public FlightVO flightByItnyName(String itnyName) throws Exception {
		return dao.flightByItnyName(itnyName);
	}

} // end public class AdminServiceImpl
