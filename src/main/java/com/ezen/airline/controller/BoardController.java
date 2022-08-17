package com.ezen.airline.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.airline.domain.BoardVO;
import com.ezen.airline.domain.Board_KindVO;
import com.ezen.airline.domain.ReplyVO;
import com.ezen.airline.domain.UserVO;
import com.ezen.airline.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	BoardService boardservice;

	//****************문의하기************************

	//문의하기 페이지로 이동한다
	@RequestMapping(value = "myPage/inqueryBoard", method = RequestMethod.GET)
	public String inqueryBoard(HttpSession session, Model model) throws Exception {

		//session에 user라는 키값의 value값을 가져온다
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:/user/signin";
		}
		List<Board_KindVO> board_kindVO = boardservice.boardKind();
		logger.info("문의종류" + board_kindVO);
		model.addAttribute("board_kindVO", board_kindVO);
		return "/board/myPage/inqueryBoard";
	}

	//작성한 문의를 등록한다
	@RequestMapping(value = "myPage/inqueryBoard", method = RequestMethod.POST)
	public String inqueryBoard(BoardVO boardVO, Model model, RedirectAttributes rttr) throws Exception {
		logger.info("게시판내용" + boardVO);
		boardservice.insertBoard(boardVO);
		rttr.addAttribute("userId", boardVO.getUserId());
		return "redirect:/board/myPage/myInqueryList";
	}

	//내가 작성한 문의목록으로 이동한다
	@RequestMapping(value = "myPage/myInqueryList")
	public void myInqueryList(HttpServletRequest request, HttpSession session, Model model, @RequestParam("userId") String userId) throws Exception {
		logger.info(userId + "사용자아이디");

		List<BoardVO> boardList = boardservice.myInqueryList(userId);
		model.addAttribute("boardList", boardList);
		logger.info("보드리스트" + boardList);

		UserVO user = (UserVO) session.getAttribute("user");
		model.addAttribute("user", user);
	}

	//b_index,게시물 번호로 선택한 문의내용을 본다
	@RequestMapping(value = "myPage/myInquery")
	public void myInquery(@RequestParam("b_index") int b_index, Model model) throws Exception {

		BoardVO boardVO = boardservice.selectmyInquery(b_index);
		logger.info("가져온문의내용" + boardVO);
		model.addAttribute("boardVO", boardVO);
	}

	//b_index에 해당하는 등록된 답변을 본다
	@ResponseBody
	@RequestMapping("myPage/showReply")
	public List<ReplyVO> showReply(@RequestParam int b_index) throws Exception {

		List<ReplyVO> replyList = boardservice.showReply(b_index);
		logger.info("가져온답변" + replyList);
		return replyList;

	}

	//선택한 게시글을 삭제한다
	@RequestMapping("myPage/deleteInquery")
	public String deleteInquery(@RequestParam int b_index) throws Exception {

		//해당게시글에 대한 사용자아이디를 가져온다

		String userId = boardservice.selectId(b_index);
		logger.info(userId + "삭제게시물쓴아이디");

		int deleteOk = boardservice.deleteInquery(b_index);

		logger.info(deleteOk + "삭제값");
		if (deleteOk != 1) {

			return "redirect:/board/myPage/myInquery?b_index=" + b_index;
		}

		return "redirect:/board/myPage/myInqueryList?userId=" + userId;
	}

}
