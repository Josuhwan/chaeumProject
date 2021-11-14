package com.bc.chaeum.board.service;

import java.util.List;

public interface BoardService {
	//CRUD 기능 구현 메소드 정의
	void insertBoard(BoardVO vo);
	void updateBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);
	BoardVO getBoard(BoardVO vo) throws Exception;
	List<BoardVO> getBoardList();
	List<BoardVO> getBoardList(BoardVO vo);
	void boardCnt(int board_id) throws Exception;
}
