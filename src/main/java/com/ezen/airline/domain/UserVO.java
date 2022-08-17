package com.ezen.airline.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {

	// 테이블의 필드명과 자료형을 동일하게 DTO에 변수 생성한다
	// 아래와 같이
	private int userNum;
	private String userName;
	private String userId;
	private String passwd;
	private String phone;
	private String passPort;
	private Date reg_Date;
	private String up_Date;
	private int verify;

} // end public class UserVO
