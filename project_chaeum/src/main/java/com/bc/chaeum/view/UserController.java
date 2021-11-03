package com.bc.chaeum.view;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bc.chaeum.member.service.UserService;
import com.bc.chaeum.member.service.UserVO;


@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private JavaMailSender mailSender;
		
	// 로그인처리
	@PostMapping("/login.do") 
	public String login(HttpServletRequest request, UserVO vo) {
		System.out.println(">>> 로그인 처리 - login()");
		System.out.println("vo : " + vo);
		
		UserVO user = userService.loginUser(vo);
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		
		System.out.println("user : " + user);
		
		if (user != null) {
			System.out.println(">> 로그인성공!!!");
			return "index.jsp?contentPage=login/loginSuccess.jsp";
		} else {
			System.out.println(">> 로그인실패~~");
			return "index.jsp?contentPage=login/loginFail.jsp";
		}	
	}
	
	// 로그인화면 이동
	@GetMapping("/login.do")
	public String loginView(UserVO vo) {
		System.out.println(">>> 로그인 화면이동 - loginView()");
		
		return "index.jsp?contentPage=login/login.jsp";
	}
	
	// 로그아웃처리
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		System.out.println(">>> 로그아웃 처리");
		session.invalidate();
		return "login.jsp";
	}
	
	// 회원가입
	@PostMapping("/signup.do")
	public String signup(UserVO vo) {
		System.out.println(">> 회원가입 처리");
		System.out.println("userVO : " + vo);
		
		userService.insertUser(vo);
		
		return "signupSuccess.jsp";
	}
	
	// 이메일인증
	@GetMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(String email) throws Exception {
		System.out.println("이메일 넘어오니" + email);
		
		// 인증번호 생성 6자리
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		
		System.out.println("보낼 인증번호"  + checkNum);
		
		String fromMail = "webjava224@gmail.com";
		String toMail = email;
		String title = "[CHAEUM] 회원가입인증 메일입니다";
		String content = "방문해주셔서 감사합니다" +"<br><br>" +
						 "인증번호는 " + checkNum + " 입니다" + "<br>" + 
						 "인증번호 확인란에 입력해주세요";	
		
//		try {
//			MimeMessage message = mailSender.createMimeMessage();
//			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
//			helper.setFrom(fromMail);
//			helper.setTo(toMail);
//			helper.setSubject(title);
//			helper.setText(content, true);
//			mailSender.send(message);
//			
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
		
		String num = Integer.toString(checkNum);
		
		return num;
	}
}
