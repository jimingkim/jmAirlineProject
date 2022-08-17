package com.ezen.airline.service;

import java.util.List;

import com.ezen.airline.domain.BoardVO;
import com.ezen.airline.domain.Board_KindVO;
import com.ezen.airline.domain.ReplyVO;

public interface BoardService {

	// ******************** inqueryBoard ********************

	// 문의유형을 가져온다

	public List<Board_KindVO> boardKind() throws Exception;

	//작성한 문의를 insert한다

	public void insertBoard(BoardVO boardVO) throws Exception;

	//내가 작성한 문의내역을 다보여준다
	public List<BoardVO> myInqueryList(String id) throws Exception;

	//b_index,게시물 번호로 선택한 문의내용을 본다
	public BoardVO selectmyInquery(int b_index) throws Exception;

	//b_index에 해당하는 등록된 답변을 본다
	public List<ReplyVO> showReply(int b_index) throws Exception;

	//선태한 게시글을 삭제한다
	public int deleteInquery(int b_index) throws Exception;

	//해당게시글에대한 사용자아이디를가져온다
	public String selectId(int b_index) throws Exception;

}
// end public class AdminService
