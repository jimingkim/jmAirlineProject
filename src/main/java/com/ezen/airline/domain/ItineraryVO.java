package com.ezen.airline.domain;

import lombok.Data;

@Data
public class ItineraryVO {

	private String itnyName;
	private String depTime;
	private String arrTime;
	private String flgtName;
	private String acftName;
	private int itnyPrice;
	private int discount_rate;
	private int acftCarrd; //not null
	private int booked; //not null

	//flightVO에있는컬럼
	private String depCode;
	private String arrCode;

} // end public class ItineraryVO
