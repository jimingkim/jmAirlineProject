package com.ezen.airline.service;

import java.util.List;

import com.ezen.airline.domain.FlightVO;
import com.ezen.airline.domain.ItineraryVO;
import com.ezen.airline.domain.ReservationVO;
import com.ezen.airline.domain.SeatVO;

public interface AirlineService {

	// *********************reservation**********************

	// 가는여정에 해당하는 depCode와 arrCode에 해당하는 flight값을 가져온다
	public FlightVO goFlight(ItineraryVO itineraryvo) throws Exception;

	// search화면에서 비행스케줄 지정 시 조건에 맞는 항공편만 보여준다
	public List<ItineraryVO> listBySchedule(String depTime, String depCode, String arrCode) throws Exception;

	// search화면에서 비행스케줄 지정 시 조건에 맞는 항공편만 보여준다
	public List<ItineraryVO> listBySchedule2(String depTime, String depCode, String arrCode) throws Exception;

	// depCode와 arrCode와 depTime을 조건으로 줬을 때 여정갯수
	public int getCountItinerary(String depTime, String depCode, String arrCode) throws Exception;

	// depCode와 arrCode와 depTime을 조건으로 줬을 때 여정갯수
	public int getCountItinerary2(String depTime, String depCode, String arrCode) throws Exception;

	// 예약한다

	public void reservRegi(ReservationVO vo) throws Exception;;

	public List<SeatVO> seatList0(String itnyName) throws Exception;

	public List<SeatVO> seatList1(String itnyName) throws Exception;

	// 기종번호에 맞춰서 최대인원수 초과 못하게 막기
	public ItineraryVO getAcftCarrd(String itnyName) throws Exception;

	// 예약하고자하는 여정에 대해 예약되어있는 갯수 가져오기
	public int getReservation_count(String itnyName) throws Exception;

	//선택한 좌석들 목록을 보여주자..
	public SeatVO seatCheck(String seatNum, String seatClass, String itnyName) throws Exception;

	//좌석쪼개서 update한다
	public void occupySeat(String seatNum, String itnyName) throws Exception;

	//예약목록에 좌석들을 쪼개기위해 사용
	public ReservationVO seatNum_split(String resrvNum) throws Exception;

	//여정번호의 avail컬럼이 'N'을 가진 갯수를 센다
	public int count_N(String itnyName) throws Exception;

	//count를 tbl_itinerary의 booked에 업뎃한다
	public void updateBooked(int booked, String itnyName) throws Exception;

	// 가는예약목록을가져온다
	public ReservationVO reserveList0(String resrvNum) throws Exception;

	// 오는예약목록을가져온다
	public ReservationVO reserveList1(String resrvNum) throws Exception;

	//예약번호가 있는지찾는다
	public List<String> resrvnumList() throws Exception;
}
