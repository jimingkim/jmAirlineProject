package com.ezen.airline.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ezen.airline.domain.FlightVO;
import com.ezen.airline.domain.ItineraryVO;
import com.ezen.airline.domain.ReservationVO;
import com.ezen.airline.domain.SeatVO;

@Repository
public class AirlineDAOImpl implements AirlineDAO {

	@Inject
	SqlSession sql;

	// mapper
	private static String namespace = "com.ezen.airline.mappers.airlineMapper";

	// search화면에서 가는 비행스케줄 지정 시 조건에 맞는 항공편만 보여준다
	@Override
	public List<ItineraryVO> listBySchedule(String depTime, String depCode, String arrCode) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("depTime", depTime);
		map.put("depCode", depCode);
		map.put("arrCode", arrCode);
		return sql.selectList(namespace + ".listBySchedule", map);
	}

	// search화면에서 오는 비행스케줄 지정 시 조건에 맞는 항공편만 보여준다
	@Override
	public List<ItineraryVO> listBySchedule2(String depTime, String depCode, String arrCode) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("depTime", depTime);
		map.put("depCode", depCode);
		map.put("arrCode", arrCode);
		return sql.selectList(namespace + ".listBySchedule2", map);
	}

	// depCode와 arrCode와 depTime을 조건으로 줬을 때 가는 여정갯수
	@Override
	public int getCountItinerary(String depTime, String depCode, String arrCode) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("depTime", depTime);
		map.put("depCode", depCode);
		map.put("arrCode", arrCode);
		return sql.selectOne(namespace + ".getCountItinerary", map);
	}

	// depCode와 arrCode와 depTime을 조건으로 줬을 때 오는 여정갯수
	@Override
	public int getCountItinerary2(String depTime, String depCode, String arrCode) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("depTime", depTime);
		map.put("depCode", depCode);
		map.put("arrCode", arrCode);
		System.out.println("뎁타임" + depTime + "뎁코드" + depCode + "어라이버코드" + arrCode);
		return sql.selectOne(namespace + ".getCountItinerary2", map);
	}

	// 가는 여정에 해당하는 depCode와 arrCode의 flight값을 가져온다(avail_list.jsp에서씀)
	@Override
	public FlightVO goFlight(ItineraryVO itineraryvo) throws Exception {
		return sql.selectOne(namespace + ".goFlight", itineraryvo);
	}

	//예약한다
	@Override
	public void reservRegi(ReservationVO vo) throws Exception {
		sql.insert(namespace + ".reservRegi", vo);
	}

	@Override
	public List<SeatVO> seatList0(String itnyName) throws Exception {
		return sql.selectList(namespace + ".seatList0", itnyName);
	}

	@Override
	public List<SeatVO> seatList1(String itnyName) throws Exception {
		return sql.selectList(namespace + ".seatList1", itnyName);
	}

	// 기종번호에 맞춰서 최대인원수 초과 못하게 막기
	@Override
	public ItineraryVO getAcftCarrd(String itnyName) throws Exception {
		return sql.selectOne(namespace + ".getAcftCarrd", itnyName);
	}

	// 예약하고자하는 여정에 대해 예약되어있는 갯수 가져오기
	@Override
	public int getReservation_count(String itnyName) throws Exception {
		return sql.selectOne(namespace + ".getReservation_count", itnyName);
	}

	//선택한 좌석들 목록을 보여주자..
	@Override
	public SeatVO seatCheck(String seatNum, String seatClass, String itnyName) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("seatNum", seatNum);
		map.put("seatClass", seatClass);
		map.put("itnyName", itnyName);
		return sql.selectOne(namespace + ".seatCheck", map);
	}

	//좌석쪼개서 update한다
	@Override
	public void occupySeat(String seatNum, String itnyName) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("seatNum", seatNum);
		map.put("itnyName", itnyName);
		sql.update(namespace + ".occupySeat", map);
	}

	//예약목록에 좌석들을 쪼개기위해 사용
	@Override
	public ReservationVO seatNum_split(String resrvNum) throws Exception {

		return sql.selectOne(namespace + ".seatNum_split", resrvNum);
	}

	//여정번호의 avail컬럼이 'N'을 가진 갯수를 센다
	@Override
	public int count_N(String itnyName) throws Exception {
		return sql.selectOne(namespace + ".count_N", itnyName);
	}

	//count를 tbl_itinerary의 booked에 업뎃한다
	@Override
	public void updateBooked(int booked, String itnyName) {
		Map<Object, Object> map = new HashMap<>();
		map.put("booked", booked);
		map.put("itnyName", itnyName);
		sql.update(namespace + ".updateCarrierd", map);
	}

	//가는 예약목록을가져온다
	@Override
	public ReservationVO reserveList0(String resrvNum) throws Exception {
		return sql.selectOne(namespace + ".reserveList0", resrvNum);
	}

	//오는 예약목록을가져온다
	@Override
	public ReservationVO reserveList1(String resrvNum) throws Exception {
		return sql.selectOne(namespace + ".reserveList1", resrvNum);
	}

	//예약번호가 있는지찾는다
	@Override
	public List<String> resrvnumList() throws Exception {
		return sql.selectList(namespace + ".resrvnumList");
	}

}
