package com.ezen.airline.persistence;

import java.util.List;

import com.ezen.airline.domain.AircraftVO;
import com.ezen.airline.domain.AirportVO;
import com.ezen.airline.domain.FlightVO;
import com.ezen.airline.domain.ItineraryVO;
import com.ezen.airline.domain.SeatVO;

public interface AdminDAO {

	// ******************** airport ********************

	//공항목록을 불러온다
	public List<AirportVO> airportList() throws Exception;

	//공항(취항지)을 등록한다  (post)
	public void airport_register(AirportVO airportVO) throws Exception;

	//공항에 대한 정보를 수정한다 (post)
	public void airport_modify(AirportVO vo) throws Exception;

	//공항에 대한 정보를 수정한다 (ajax)
	//public int airport_modify(AirportVO vo) throws Exception;

	//공항을 삭제한다(ajax)
	public int airportDel(String aptCode) throws Exception;

	// airport count
	public int airportCount() throws Exception;

	// ******************** aircraft ********************

	// 항공기 목록을 불러온다 
	public List<AircraftVO> aircraftList() throws Exception;

	// 항공기를 등록한다
	public void aircraft_register(AircraftVO aircraftVO) throws Exception;

	//항공기 삭제한다
	public void aircraftDel(String acftName) throws Exception;

	// ******************** flight ********************

	//flight list
	public List<FlightVO> flightList() throws Exception;

	// flight regist
	public void flightRegi(FlightVO vo) throws Exception;

	//항공편 삭제
	public void flightDel(String flgtName) throws Exception;

	//특정flgtName에 해당하는 항공편 정보를가져온다
	public FlightVO flightListByFlgtName(String flgtName) throws Exception;

	//항공편 수정
	public void flight_modify(FlightVO flightVO) throws Exception;

	// ******************** itinerary ********************

	// 비행일정을 등록한다
	public void itineraryRegi(ItineraryVO vo) throws Exception;

	//비행일정 목록
	public List<ItineraryVO> itineraryList() throws Exception;

	//특정비행일정 내용을 가져온다

	public ItineraryVO findItinerary(String itnyName) throws Exception;

	//비행일정 수정
	public void itinerary_modify(ItineraryVO vo) throws Exception;

	//비행일정 삭제
	public void itineraryDel(String itnyName) throws Exception;

	// ******************** seat ********************

	//itnyName에따른 좌석목록을 가져온다
	public List<SeatVO> seat_list(String itnyName) throws Exception;

	//itnyName에 해당하는 항공편명,출발지,도착지 가져온다
	public FlightVO flightByItnyName(String itnyName) throws Exception;

} // end public class AdminDAO
