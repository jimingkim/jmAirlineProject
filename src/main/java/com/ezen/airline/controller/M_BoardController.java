package com.ezen.airline.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.airline.domain.BoardVO;
import com.ezen.airline.domain.ReplyVO;
import com.ezen.airline.domain.UserVO;
import com.ezen.airline.service.BoardService;
import com.ezen.airline.service.M_BoardService;

@Controller
@RequestMapping("/admin/m_board/*")
public class M_BoardController {

	private static final Logger logger = LoggerFactory.getLogger(M_BoardController.class);

	@Inject
	M_BoardService m_boardservice;

	@Inject
	BoardService boardservice;

	//****************문의 목록보기************************

	//사용자에 상관없이 문의 목록을 본다
	@RequestMapping(value = "inqueryList", method = RequestMethod.GET)
	public String inqueryList(HttpSession session, Model model) throws Exception {

		//session에 user라는 키값의 value값을 가져온다
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:/user/signin";
		}
		List<BoardVO> boardList = m_boardservice.inqueryList();
		model.addAttribute("boardList", boardList);
		logger.info("관리자보드리스트" + boardList);
		return "/admin/m_board/inqueryList";
	}

	//사용자의 게시문의에 답변하러간다
	@RequestMapping(value = "replying")
	public void answering(@RequestParam int b_index, Model model) throws Exception {

		BoardVO boardVO = boardservice.selectmyInquery(b_index);
		model.addAttribute("boardVO", boardVO);

		logger.info("답변하러");
	}

	//사용자의 게시물에 답변을 등록한다 ajax
	@ResponseBody
	@RequestMapping(value = "insertReply")
	public Integer insertReply(ReplyVO replyVO) throws Exception {

		Integer result = m_boardservice.insertReply(replyVO);
		logger.info("댓글성공값" + result);
		//등록과 동시에 게시글테이블에 답글등록여부를 업뎃한다
		m_boardservice.updateReplyed(replyVO.getB_index());

		return result;
	}

	//사용자의 게시물에 답변을 보여준다
	@ResponseBody
	@RequestMapping(value = "showReply")
	public List<ReplyVO> showReply(@RequestParam int b_index) throws Exception {

		List<ReplyVO> replylList = m_boardservice.showReply(b_index);
		logger.info("게시글번호에맞는 댓글목록" + replylList);
		return replylList;
	}

	//관리자가 본인이 쓴 답급을 삭제한다 
	@ResponseBody
	@RequestMapping(value = "deleteReply")
	public int deleteReply(@RequestParam int r_index, @RequestParam int b_index) throws Exception {
		logger.info("댓글번호랑 게시글번호" + r_index, b_index);
		int result = m_boardservice.deleteReply(r_index, b_index);
		return result;
	}

}
