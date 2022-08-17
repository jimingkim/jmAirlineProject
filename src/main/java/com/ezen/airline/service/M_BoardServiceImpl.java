package com.ezen.airline.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.airline.domain.BoardVO;
import com.ezen.airline.domain.ReplyVO;
import com.ezen.airline.persistence.M_BoardDAO;

@Service
public class M_BoardServiceImpl implements M_BoardService {

	@Inject
	private M_BoardDAO m_boardDAO;

	// ******************** 문의 목록보기********************

	//사용자에 상관없이 문의 목록을 본다
	@Override
	public List<BoardVO> inqueryList() throws Exception {
		return m_boardDAO.inqueryList();
	}

	//사용자의 게시물에 답변을 등록한다 ajax
	@Override
	public Integer insertReply(ReplyVO replyVO) throws Exception {

		return m_boardDAO.insertReply(replyVO);
	}

	//사용자의 게시물에 답변을 보여준다
	@Override
	public List<ReplyVO> showReply(@RequestParam int b_index) throws Exception {
		return m_boardDAO.showReply(b_index);
	}

	//관리자가 본인이 쓴 답급을 삭제한다 
	@Override
	public int deleteReply(int r_index, int b_index) throws Exception {
		return m_boardDAO.deleteReply(r_index, b_index);
	}

	//답글등록여부를 업뎃한다
	@Override
	public void updateReplyed(int b_index) throws Exception {
		m_boardDAO.updateReplyed(b_index);
	}

}
// end public class AdminServiceImpl
