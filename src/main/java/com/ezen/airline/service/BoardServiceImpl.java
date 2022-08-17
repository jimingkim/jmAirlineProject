package com.ezen.airline.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.airline.domain.BoardVO;
import com.ezen.airline.domain.Board_KindVO;
import com.ezen.airline.domain.ReplyVO;
import com.ezen.airline.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;

	// ******************** airport ********************

	// 문의유형을 가져온다
	@Override
	public List<Board_KindVO> boardKind() throws Exception {

		return boardDAO.boardKind();
	}

	//작성한 문의를 insert한다
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		boardDAO.insertBoard(boardVO);
	}

	//내가 작성한 문의내역을 다보여준다
	@Override
	public List<BoardVO> myInqueryList(String id) throws Exception {
		return boardDAO.myInqueryList(id);
	}

	//b_index,게시물 번호로 선택한 문의내용을 본다
	@Override
	public BoardVO selectmyInquery(int b_index) throws Exception {
		return boardDAO.selectmyInquery(b_index);
	}

	//b_index에 해당하는 등록된 답변을 본다
	@Override
	public List<ReplyVO> showReply(int b_index) throws Exception {

		return boardDAO.showReply(b_index);
	}

	//선택한 게시글을 삭제한다
	@Override
	public int deleteInquery(int b_index) throws Exception {
		return boardDAO.deleteInquery(b_index);
	}

	//해당게시글에대한 사용자아이디를가져온다
	@Override
	public String selectId(int b_index) throws Exception {
		return boardDAO.selectId(b_index);
	}

} // end public class AdminServiceImpl
