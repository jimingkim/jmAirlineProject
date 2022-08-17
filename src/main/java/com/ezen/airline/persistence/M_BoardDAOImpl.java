package com.ezen.airline.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ezen.airline.domain.BoardVO;
import com.ezen.airline.domain.ReplyVO;

@Repository
public class M_BoardDAOImpl implements M_BoardDAO {

	@Inject
	SqlSession sql;

	// mapper
	private static String namespace = "com.ezen.airline.mappers.m_boardMapper";

	// ******************** 문의 목록보기********************

	//사용자에 상관없이 문의 목록을 본다
	@Override
	public List<BoardVO> inqueryList() throws Exception {
		return sql.selectList(namespace + ".inqueryList");
	}

	//사용자의 게시물에 답변을 등록한다 ajax
	@Override
	public Integer insertReply(ReplyVO replyVO) throws Exception {

		return sql.insert(namespace + ".insertReply", replyVO);
	}

	//사용자의 게시물에 답변을 보여준다
	@Override
	public List<ReplyVO> showReply(int b_index) throws Exception {

		return sql.selectList(namespace + ".showReply", b_index);
	}

	//관리자가 본인이 쓴 답급을 삭제한다 
	@Override
	public int deleteReply(int r_index, int b_index) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("r_index", r_index);
		map.put("b_index", b_index);

		return sql.delete(namespace + ".deleteReply", map);
	}

	//답글등록여부를 업뎃한다
	@Override
	public void updateReplyed(int b_index) throws Exception {
		sql.update(namespace + ".updateReplyed", b_index);
	}
} // end public class AdminDAOImpl
