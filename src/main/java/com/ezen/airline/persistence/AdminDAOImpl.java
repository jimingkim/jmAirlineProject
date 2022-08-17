package com.ezen.airline.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ezen.airline.domain.AircraftVO;
import com.ezen.airline.domain.AirportVO;
import com.ezen.airline.domain.FlightVO;
import com.ezen.airline.domain.ItineraryVO;
import com.ezen.airline.domain.SeatVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	SqlSession sql;

	// mapper
	private static String namespace = "com.ezen.airline.mappers.adminMapper";

	// ******************** airport ********************

	// 공항목록을 불러온다
	@Override
	public List<AirportVO> airportList() throws Exception {
		return sql.selectList(namespace + ".airportList");
	}

	//공항(취항지)을 등록한다  (post)
	@Override
	public void airport_register(AirportVO airportVO) throws Exception {
		sql.insert(namespace + ".airport_register", airportVO);
	}

	//공항에 대한 정보를 수정한다(post)
	@Override
	public void airport_modify(AirportVO vo) throws Exception {
		sql.update(namespace + ".airport_modify", vo);
	}

	//공항에 대한 정보를 수정한다(ajax)
	//@Override
	//public int airport_modify(AirportVO vo) throws Exception{
	//	return sql.update(namespace+".airport_modify",vo);
	//}

	//공항을 삭제한다(ajax)
	@Override
	public int airportDel(String aptCode) throws Exception {
		return sql.delete(namespace + ".airportDel", aptCode);
	}

	// airport count
	@Override
	public int airportCount() throws Exception {
		return sql.selectOne(namespace + ".airportCount");
	}

	// ******************** aircraft ********************

	// 항공기 목록을 불러온다 
	@Override
	public List<AircraftVO> aircraftList() throws Exception {
		return sql.selectList(namespace + ".aircraftList");
	}

	//항공기를 등록한다
	@Override
	public void aircraft_register(AircraftVO aircraftVO) throws Exception {
		sql.insert(namespace + ".aircraft_register", aircraftVO);
	}

	//항공기 삭제한다 
	@Override
	public void aircraftDel(String acftName) throws Exception {
		sql.delete(namespace + ".aircraftDel", acftName);
	}

	// ******************** flight ********************

	//flight list
	@Override
	public List<FlightVO> flightList() throws Exception {

		return sql.selectList(namespace + ".flightList");
	}

	@Override
	public void flightRegi(FlightVO vo) throws Exception {
		sql.insert(namespace + ".flightRegi", vo);
	}

	//항공편삭제
	@Override
	public void flightDel(String flgtName) throws Exception {
		sql.delete(namespace + ".flightDel", flgtName);
	}

	//특정flgtName에 해당하는 항공편 정보를가져온다
	@Override
	public FlightVO flightListByFlgtName(String flgtName) throws Exception {
		return sql.selectOne(namespace + ".flightListByFlgtName", flgtName);
	}

	//항공편 수정
	@Override
	public void flight_modify(FlightVO flightVO) throws Exception {
		sql.update(namespace + ".flight_modify", flightVO);
	}

	// ******************** itinerary ********************
	//비행일정을 등록한다
	@Override
	public void itineraryRegi(ItineraryVO vo) throws Exception {
		sql.insert(namespace + ".itineraryRegi", vo);
	}

	//비행일정 목록
	@Override
	public List<ItineraryVO> itineraryList() throws Exception {

		return sql.selectList(namespace + ".itineraryList");
	}

	//특정비행일정 내용을 가져온다
	@Override
	public ItineraryVO findItinerary(String itnyName) throws Exception {
		return sql.selectOne(namespace + ".findItinerary", itnyName);
	}

	//비행일정을 수정한다
	@Override
	public void itinerary_modify(ItineraryVO vo) throws Exception {
		sql.update(namespace + ".itinerary_modify", vo);
	}

	//비행일정 삭제
	@Override
	public void itineraryDel(String itnyName) throws Exception {
		sql.delete(namespace + ".itineraryDel", itnyName);
	}

	// ******************** seat ********************

	//itnyName에따른 좌석목록을 가져온다
	@Override
	public List<SeatVO> seat_list(String itnyName) throws Exception {
		return sql.selectList(namespace + ".seat_list", itnyName);
	}

	//itnyName에 해당하는 항공편명,출발지,도착지 가져온다
	@Override
	public FlightVO flightByItnyName(String itnyName) throws Exception {
		return sql.selectOne(namespace + ".flightByItnyName", itnyName);
	}

} // end public class AdminDAOImpl
