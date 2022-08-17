package com.ezen.airline.domain;

import lombok.Data;

@Data
public class ReservationVO {
	private String resrvNum;
	private String resrvDate;
	private int resrvPrice_go;
	private int resrvPrice_come;
	private int userNum;
	private String seatNum_go;
	private String seatNum_come;
	private String itnyName_go;
	private String itnyName_come;
	private String account;

	private String userId;
	private String flgtName;
	private String seatClass;
	private String depCode;
	private String arrCode;
	private String depTime;
	private String arrTime;
} // end public class ReservationVO
