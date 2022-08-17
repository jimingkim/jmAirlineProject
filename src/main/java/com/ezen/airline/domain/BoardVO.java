package com.ezen.airline.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	// 테이블의 필드명과 자료형을 동일하게 DTO에 변수 생성한다
	// 아래와 같이

	private String userId;
	private int userNum;
	private int b_index;
	private int rownum;
	private String b_content;
	private String b_title;
	private String b_kind;
	private Date b_regDate;
	private int b_replyed;

	private String b_kind_name;

	private Date r_regDate; //답글등록날짜

} // end public class UserVO
