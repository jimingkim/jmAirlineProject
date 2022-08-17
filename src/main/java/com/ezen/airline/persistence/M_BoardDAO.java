package com.ezen.airline.persistence;

import java.util.List;

import com.ezen.airline.domain.BoardVO;
import com.ezen.airline.domain.ReplyVO;

public interface M_BoardDAO {

	// ******************** 문의 목록보기********************

	//사용자에 상관없이 문의 목록을 본다
	public List<BoardVO> inqueryList() throws Exception;

	//사용자의 게시물에 답변을 등록한다 ajax
	public Integer insertReply(ReplyVO replyVO) throws Exception;

	//사용자의 게시물에 답변을 보여준다
	public List<ReplyVO> showReply(int b_index) throws Exception;

	//관리자가 본인이 쓴 답급을 삭제한다 
	public int deleteReply(int r_index, int b_index) throws Exception;

	//답글등록여부를 업뎃한다
	public void updateReplyed(int b_index) throws Exception;
} // end public class AdminDAO
