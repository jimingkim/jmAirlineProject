package com.ezen.airline.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.airline.domain.FlightVO;
import com.ezen.airline.domain.ItineraryVO;
import com.ezen.airline.domain.ReservationVO;
import com.ezen.airline.domain.SeatVO;
import com.ezen.airline.persistence.AirlineDAO;

@Service
public class AirlineServiceImpl implements AirlineService {

	@Inject
	private AirlineDAO airlineDAO;

	// 가는 여정에 해당하는 depCode와 arrCode의 flight값을 가져온다
	@Override
	public FlightVO goFlight(ItineraryVO itineraryvo) throws Exception {
		return airlineDAO.goFlight(itineraryvo);
	}

	// search화면에서 비행스케줄 지정 시 조건에 맞는 항공편만 보여준다
	@Override
	public List<ItineraryVO> listBySchedule(String depTime, String depCode, String arrCode) throws Exception {
		return airlineDAO.listBySchedule(depTime, depCode, arrCode);
	}

	// search화면에서 비행스케줄 지정 시 조건에 맞는 항공편만 보여준다
	@Override
	public List<ItineraryVO> listBySchedule2(String depTime, String depCode, String arrCode) throws Exception {
		return airlineDAO.listBySchedule2(depTime, depCode, arrCode);
	}

	// depCode와 arrCode와 depTime을 조건으로 줬을 때 여정갯수
	@Override
	public int getCountItinerary(String depTime, String depCode, String arrCode) throws Exception {
		return airlineDAO.getCountItinerary(depTime, depCode, arrCode);
	}

	@Override
	public int getCountItinerary2(String depTime, String depCode, String arrCode) throws Exception {
		return airlineDAO.getCountItinerary2(depTime, depCode, arrCode);
	}

	// 예약한다
	@Override
	public void reservRegi(ReservationVO vo) throws Exception {
		airlineDAO.reservRegi(vo);
	}

	@Override
	public List<SeatVO> seatList0(String itnyName) throws Exception {
		return airlineDAO.seatList0(itnyName);
	}

	@Override
	public List<SeatVO> seatList1(String itnyName) throws Exception {
		return airlineDAO.seatList1(itnyName);
	}

	// 기종번호에 맞춰서 최대인원수 초과 못하게 막기
	@Override
	public ItineraryVO getAcftCarrd(String itnyName) throws Exception {
		return airlineDAO.getAcftCarrd(itnyName);
	}

	// 예약하고자하는 여정에 대해 예약되어있는 갯수 가져오기
	@Override
	public int getReservation_count(String itnyName) throws Exception {
		return airlineDAO.getReservation_count(itnyName);
	}

	//선택한 좌석들 목록을 보여주자..
	@Override
	public SeatVO seatCheck(String seatNum, String seatClass, String itnyName) throws Exception {
		return airlineDAO.seatCheck(seatNum, seatClass, itnyName);
	}

	//좌석쪼개서 update한다
	@Override
	public void occupySeat(String seatNum, String itnyName) throws Exception {
		airlineDAO.occupySeat(seatNum, itnyName);
	}

	//예약목록에 좌석들을 쪼개기위해 사용
	@Override
	public ReservationVO seatNum_split(String resrvNum) throws Exception {

		return airlineDAO.seatNum_split(resrvNum);
	}

	//여정번호의 avail컬럼이 'N'을 가진 갯수를 센다
	@Override
	public int count_N(String itnyName) throws Exception {
		return airlineDAO.count_N(itnyName);
	}

	//count를 tbl_itinerary의 booked에 업뎃한다
	@Override
	public void updateBooked(int booked, String itnyName) throws Exception {
		airlineDAO.updateBooked(booked, itnyName);
	}

	// 가는예약목록을가져온다
	@Override
	public ReservationVO reserveList0(String resrvNum) throws Exception {
		return airlineDAO.reserveList0(resrvNum);
	}

	// 오는예약목록을가져온다
	@Override
	public ReservationVO reserveList1(String resrvNum) throws Exception {
		return airlineDAO.reserveList1(resrvNum);
	}

	//예약번호가 있는지찾는다
	@Override
	public List<String> resrvnumList() throws Exception {
		return airlineDAO.resrvnumList();
	}

}
