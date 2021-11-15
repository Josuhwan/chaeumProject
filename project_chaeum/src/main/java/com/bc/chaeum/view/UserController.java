package com.bc.chaeum.view;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bc.chaeum.admin.service.AdminService;
import com.bc.chaeum.board.service.BoardService;
import com.bc.chaeum.board.service.BoardVO;
import com.bc.chaeum.board.service.ReplyService;
import com.bc.chaeum.board.service.ReplyVO;
import com.bc.chaeum.member.service.MemberVO;
import com.bc.chaeum.member.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private AdminService adminService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private ReplyService replyService;

	// 로그인처리
	@PostMapping("/login.do")
	public String login(HttpSession session, MemberVO vo) {
		System.out.println(">>> 로그인 처리 - login()");
		System.out.println("vo : " + vo);

		MemberVO user = userService.loginUser(vo);
		session.setAttribute("user", user);

		System.out.println("user : " + user);

		if (user != null) {
			System.out.println(">> 로그인성공!!!");

			if ("관리자".equals(user.getRank()) || "마스터 관리자".equals(user.getRank())) {

				return "adminhome.do";
			} else {
				String now = LocalDate.now().format(DateTimeFormatter.ofPattern("yy/MM/dd"));
				System.out.println("now 값 체크 : " + now);
				adminService.updatevisitcnt(now);
				return "redirect:index.jsp";
			}

		} else {
			System.out.println(">> 로그인실패~~");
			return "index.jsp?contentPage=login/loginFail.jsp";
		}
	}

	// 로그인화면 이동
	@GetMapping("/login.do")
	public String loginView(MemberVO vo) {
		System.out.println(">>> 로그인 화면이동 - loginView()");

		return "index.jsp?contentPage=login/login.jsp";
	}

	// 로그아웃처리
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		System.out.println(">>> 로그아웃 처리");
		session.invalidate();
		return "index.jsp";
	}

	// 회원가입
	@PostMapping("/signup.do")
	public String signup(MemberVO vo) {
		System.out.println(">> 회원가입 처리");

		String email = vo.getEmail1() + "@" + vo.getEmail2();
		vo.setEmail(email);
		System.out.println("userVO : " + vo);

		userService.insertUser(vo);

		return "index.jsp";
	}

	// 이메일인증
	@GetMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(String email) throws Exception {
		System.out.println("이메일 넘어오니" + email);

		// 인증번호 생성 6자리
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		System.out.println("보낼 인증번호" + checkNum);

		String fromMail = "webjava224@gmail.com";
		String toMail = email;
		String title = "[CHAEUM] 회원가입인증 메일입니다";
		String content = "방문해주셔서 감사합니다" + "<br><br>" + "인증번호는 " + checkNum + " 입니다" + "<br>" + "인증번호 확인란에 입력해주세요";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(fromMail);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum);

		return num;
	}

	// 닉네임중복체크
	@PostMapping("/checkName.do")
	@ResponseBody
	public String checkName(@RequestParam("nickname") String nickname) {
		System.out.println(nickname);
		int rs = userService.checkName(nickname);

		System.out.println("결과값 : " + rs);

		return Integer.toString(rs);
	}

	// 이메일중복체크
	@PostMapping("/checkEmail.do")
	@ResponseBody
	public String checkEmail(@RequestParam("email") String email) {
		System.out.println(email);
		int rs = userService.checkEmail(email);

		System.out.println("결과값 : " + rs);

		return Integer.toString(rs);
	}

	// 마이페이지 이동
	@GetMapping("/mypage.do")
	public String myPage(BoardVO vo, Model model, HttpSession session) {
		System.out.println(">>> 마이페이지");

		MemberVO mvo = (MemberVO) session.getAttribute("user");

		List<BoardVO> boardList = boardService.getBoardList(vo);
		List<ReplyVO> rlist = replyService.getMyReply(mvo.getEmail());
		model.addAttribute("boardList", boardList);
		model.addAttribute("rlist", rlist);

		return "index.jsp?contentPage=member/myPage.jsp";
	}

	// 회원수정
	@GetMapping("/userUpdate.do")
	public String userUpdate(HttpSession session, MemberVO vo) {
		System.out.println(">>> 회원수정 !!");
		System.out.println(">>> 회원수정컨트롤러 " + vo);
		userService.userUpdate(vo);
		session.setAttribute("user", vo);

		return "index.jsp?contentPage=member/myPage.jsp";
	}

	// 회원탈퇴
	@GetMapping("/signout.do")
	public String userSignout(HttpSession session, String email) {
		System.out.println(">>> 회원탈퇴");

		userService.userSignout(email);
		session.invalidate();

		return "index.jsp";
	}

	// 비밀번호재설정페이지
	@GetMapping("/passFindPage.do")
	public String passFindPage() {
		System.out.println("비밀번호찾기페이지이동");

		return "index.jsp?contentPage=member/passFind.jsp";
	}

	// 비밀번호재설정
	@GetMapping("/passFind.do")
	public String passFind(MemberVO vo) {
		System.out.println("비밀번호찾기");
		System.out.println(vo);
		userService.passFind(vo);
		System.out.println("비번수정후 : " + vo);
		return "index.jsp";
	}
	
	
}
