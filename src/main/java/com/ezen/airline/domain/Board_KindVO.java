package com.ezen.airline.domain;

import lombok.Data;

@Data
public class Board_KindVO {

	// 테이블의 필드명과 자료형을 동일하게 DTO에 변수 생성한다
	// 아래와 같이
	private String b_kind_id;
	private String b_kind_name;

} // end public class UserVO
