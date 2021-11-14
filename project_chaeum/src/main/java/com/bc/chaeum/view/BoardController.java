package com.bc.chaeum.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bc.chaeum.board.service.BoardService;
import com.bc.chaeum.board.service.BoardVO;


@Controller
@SessionAttributes("board") // board 라는 이름의 Model 있으면 session에 저장
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	
	public BoardController() {
		System.out.println("--->> BoardController() 객체생성");
	}
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		System.out.println("--->> Map searchConditionMap() 실행");
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) throws Exception {
		System.out.println(">>> 게시글 상세 보여주기");
		boardService.boardCnt(vo.getBoard_id());
		BoardVO board = boardService.getBoard(vo);
		System.out.println(":: getBoard board : " + board);

		model.addAttribute("board", board); //Model 객체 사용 View로 데이터 전달

		return "index.jsp?contentPage=community/getBoard.jsp";
	}
	
	@RequestMapping("/getFreeBoardList.do")
	public String getBoardList(BoardVO vo, Model model) {
		System.out.println(">>> 게시글 목록 보여주기");
		System.out.println(":: getBoardList() vo : " + vo);
		List<BoardVO> boardList = boardService.getBoardList(vo);
		
		model.addAttribute("boardList", boardList);
		
		return "index.jsp?contentPage=community/freeBoard.jsp";

	}	
	
	@RequestMapping("/getNoticeBoardList.do")
	public String getNoticeBoardList(BoardVO vo, Model model) {
		System.out.println(">>> 게시글 목록 보여주기");
		System.out.println(":: getBoardList() vo : " + vo);
		List<BoardVO> boardList = boardService.getBoardList(vo);
		
		model.addAttribute("boardList", boardList);
		
		return "index.jsp?contentPage=community/noticeBoard.jsp";

	}	
	
	@PostMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo) {
		System.out.println(">>> 게시글 입력");
		System.out.println("insert vo : " + vo);
		
		boardService.insertBoard(vo);
		return "getFreeBoardList.do";
	}	
	
	@PostMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo) {
		System.out.println(">>> 게시글 수정");
		System.out.println("update vo : " + vo);
		boardService.updateBoard(vo);
		return "getFreeBoardList.do";
	}
	
	@GetMapping("/updateBoard.do")
	public String updateView(@ModelAttribute("board") BoardVO vo) {
		System.out.println(">>> 게시글 수정화면");
		System.out.println("update vo : " + vo);

		return "index.jsp?contentPage=community/updateBoard.jsp";
	}
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		System.out.println(">>> 게시글 삭제");
		boardService.deleteBoard(vo);
		return "getFreeBoardList.do";
	}
	
	
}

