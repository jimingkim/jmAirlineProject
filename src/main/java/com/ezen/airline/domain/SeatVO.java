package com.ezen.airline.domain;

import lombok.Data;

@Data
public class SeatVO {

	private String seatNum;
	private String itnyName; // 일정번호
	private String acftName; // 기종번호 HL
	private String seatClass;

	private int carrierd;
	private String flgtName;
	private String avail; //
	private String depCode;
	private String arrCode;

	private int totalPrice; //실제db에는없음
	private int goPrice; //실제db에는없음
	private int comePrice; //실제db에는없음

} // end public class SeatVO
