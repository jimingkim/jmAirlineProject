package com.ezen.airline.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	// 테이블의 필드명과 자료형을 동일하게 DTO에 변수 생성한다
	// 아래와 같이

	private int r_index; //답글번호
	private int b_index; //게시글번호
	private String r_writer; //관리자
	private String r_reply; //답글
	private Date r_regDate; //답글등록날짜

} // end public class UserVO
