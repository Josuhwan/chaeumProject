package com.bc.chaeum.view;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bc.chaeum.admin.service.AdminService;
import com.bc.chaeum.admin.service.AdminVO;
import com.bc.chaeum.member.service.MemberService;
import com.bc.chaeum.member.service.MemberVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/Saletotal.do", method = RequestMethod.GET)
	public String totalmain(HttpSession session) {
		
		//세션에 변경된 날짜값 체크
		AdminVO changedate = (AdminVO)session.getAttribute("changedate");
		
		//세션에 전달받은 지점값 체크
		AdminVO changebranch = (AdminVO)session.getAttribute("changebranch");
		
		//변경된 날짜값 없을 시 
		if(changedate == null) {
			System.out.println("변경된 날짜값 : " + changedate);
			
			//현재 시간 저장할  VO 객체 생성
			AdminVO vo = new AdminVO();
			
			//전월 대비 값 저장할 VO 객체 생성
			AdminVO vo2 = new AdminVO();
			
			//전일 대비 값 저장할 VO 객체 생성
			AdminVO vo3 = new AdminVO();
			
			//현재 시간 추출 (월, 일)
			LocalDate now = LocalDate.now();
			int month = now.getMonthValue();
			int day = now.getDayOfMonth();
			
			//추출된 현재 시간 값 VO 객체에 저장
			vo.setDay(day);
			vo.setMonth(month);
			
			//테스트 날짜 값
			//vo.setDay(5);
			
			
			if(changebranch == null) {
				//지점번호 디폴트값 지정
				vo.setBranchid(1);
			} else {
				vo.setBranchid(changebranch.getBranchid());
			}
			
			//전월 대비를 위한 vo2에 값 입력
			vo2 = setlastmonth(vo);
			
			//전일 대비를 위한 vo3에 값 입력
			vo3 = setlastday(vo);
			
			System.out.println("vo값 체크 : " + vo);
			System.out.println("vo2값 체크 : " + vo2);
			System.out.println("vo3값 체크 : " + vo3);
			System.out.println("vo 값 전달");
			System.out.println("vo 값 전달");
			System.out.println("vo 값 전달");
			System.out.println("vo 값 전달");
			
			//VO에 설정된 현재 시간 값 전달 
			
			List<AdminVO> main1 = adminService.selectAll_Month(vo);
			List<AdminVO> main2 = adminService.selectAll_Day(vo);
			AdminVO main3 = adminService.selectOne_Month(vo);
			AdminVO main4 = adminService.selectOne_Day(vo);
			AdminVO main5 = adminService.selectOne_lastMonth(vo2);
			AdminVO main6 = adminService.selectOne_lastDay(vo3);
			
			//일별 데이터가 null값일때 날짜 데이터 입력
			if(main2.isEmpty()) {
				main2.add(0, vo);
			}
			
			if(main1 != null) {
				
				session.setAttribute("selectAll_Month", main1);
				session.setAttribute("selectAll_Day", main2);
				session.setAttribute("selectOne_Month", main3);
				session.setAttribute("selectOne_Day", main4);
				session.setAttribute("selectOne_lastMonth", main5);
				session.setAttribute("selectOne_lastDay", main6);
				
				
				System.out.println("정상으로 값 입력 selectAll_Month : " + main1);
				System.out.println("정상으로 값 입력 selectAll_Day : " + main2);
				System.out.println("정상으로 값 입력 selectOne_Month : " + main3);
				System.out.println("정상으로 값 입력 selectOne_day : " + main4);
				System.out.println("정상으로 값 입력 selectOne_lastMonth : " + main5);
				System.out.println("정상으로 값 입력 selectOne_lastDay : " + main6);
				
				return "index.jsp?contentPage=admin/statisticsSales.jsp";
			} else {
				return null;
			}
		} else {
			System.out.println("변경된 날짜값 : " + changedate);
			
			//전월 대비 값 저장할 VO 객체 생성
			AdminVO vo2 = new AdminVO();
			
			//전일 대비 값 저장할 VO 객체 생성
			AdminVO vo3 = new AdminVO();
			
			if(changebranch == null) {
				//지점번호 디폴트값 지정
				changedate.setBranchid(1);
			} else {
				changedate.setBranchid(changebranch.getBranchid());
			}
			
			//전월 대비를 위한 vo2에 값 입력
			vo2 = setlastmonth(changedate);
			
			//전일 대비를 위한 vo3에 값 입력
			vo3 = setlastday(changedate);
			
			System.out.println("changedate 값 체크 : " + changedate);
			System.out.println("vo2값 체크 : " + vo2);
			System.out.println("vo3값 체크 : " + vo3);
			System.out.println("vo 값 전달");
			System.out.println("vo 값 전달");
			System.out.println("vo 값 전달");
			System.out.println("vo 값 전달");
			
			//VO에 설정된 현재 시간 값 전달 
			
			List<AdminVO> main1 = adminService.selectAll_Month(changedate);
			List<AdminVO> main2 = adminService.selectAll_Day(changedate);
			AdminVO main3 = adminService.selectOne_Month(changedate);
			AdminVO main4 = adminService.selectOne_Day(changedate);
			AdminVO main5 = adminService.selectOne_lastMonth(vo2);
			AdminVO main6 = adminService.selectOne_lastDay(vo3);
			
			if(main2.isEmpty()) {
				main2.add(0, changedate);
			}
			
			if(main1 != null) {
				
				session.setAttribute("selectAll_Month", main1);
				session.setAttribute("selectAll_Day", main2);
				session.setAttribute("selectOne_Month", main3);
				session.setAttribute("selectOne_Day", main4);
				session.setAttribute("selectOne_lastMonth", main5);
				session.setAttribute("selectOne_lastDay", main6);
				
				System.out.println("정상으로 값 입력 selectAll_Month : " + main1);
				System.out.println("정상으로 값 입력 selectAll_Day : " + main2);
				System.out.println("정상으로 값 입력 selectOne_Month : " + main3);
				System.out.println("정상으로 값 입력 selectOne_day : " + main4);
				System.out.println("정상으로 값 입력 selectOne_lastMonth : " + main5);
				System.out.println("정상으로 값 입력 selectOne_lastDay : " + main6);
				
				return "index.jsp?contentPage=admin/statisticsSales.jsp";
			} else {
				return null;
			}
		} 
	}
	
	@RequestMapping(value = "/changeSaledate.do", method = RequestMethod.GET)
	public String changSaledate(HttpSession session, String Saledate) {
		System.out.println("changSaledate() 실행");
		System.out.println("받은 입력값 확인 : " + Saledate);
		
		if (Saledate == null || Saledate == "") {
			Saledate = LocalDate.now().toString();
		}
		
		//String으로 받은 날짜 값 형 변환
		Date date = null;
		
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(Saledate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//변환된 값에서 월, 일 추출
		int month = Integer.parseInt(new SimpleDateFormat("MM").format(date));
		int day = Integer.parseInt(new SimpleDateFormat("dd").format(date));
		
		System.out.println("추출값 확인 : " + month);
		System.out.println("추출값 확인 : " + day);
		
		//받은 날짜 값 VO 객체에 저장
		AdminVO changedate = new AdminVO();
		changedate.setMonth(month);
		changedate.setDay(day);
		session.setAttribute("changedate", changedate);
		
		return "Saletotal.do";
	}
	
	@RequestMapping(value = "/changebranch.do", method = RequestMethod.GET)
	public String changebranch(HttpSession session, String changebranch) {
		System.out.println("changebranch() 실행");
		System.out.println("전달받은 branch 확인 : " + changebranch);
		
		//전달받은 branchid 값 vo 객체에 저장
		AdminVO changebranchid = new AdminVO();
		changebranchid.setBranchid(Integer.parseInt(changebranch));
		session.setAttribute("changebranch", changebranchid);
		
		return "Saletotal.do";
	}
	
	public AdminVO setlastmonth(AdminVO vo) {
		AdminVO vo2 = new AdminVO();
		
		//전월 대비를 위한 vo2에 값 입력
		vo2.setMonth(vo.getMonth() - 1);
		vo2.setBranchid(vo.getBranchid());
		
		//1월일 경우 전월 대비 값 입력
		if(vo.getMonth() == 1) {
			vo2.setMonth(12);
		}
		
		return vo2;
	}
	
	public AdminVO setlastday(AdminVO vo) {
		AdminVO vo3 = new AdminVO();
		
		//전일 대비를 위한 vo3에 값 입력
		vo3.setBranchid(vo.getBranchid());
		vo3.setDay(vo.getDay() - 1);
		vo3.setMonth(vo.getMonth());
		
		//1일일 경우 전일 대비 값 입력
		if(vo.getDay() == 1) {
			if(vo.getMonth() == 2) {
				vo3.setDay(28);
			}
			if(vo.getMonth() == 11 || vo.getMonth() == 9 || vo.getMonth() == 6 || vo.getMonth() == 4) {
				vo3.setDay(30);
			}
			if(vo.getMonth() == 1 || vo.getMonth() == 3 || vo.getMonth() == 5 || vo.getMonth() == 7 || vo.getMonth() == 8 || vo.getMonth() == 10 || vo.getMonth() == 12) {
				vo3.setDay(31);
			}
		}
		return vo3;
	}
	
	@RequestMapping(value = "/Usertotal.do", method = RequestMethod.GET)
	public String Usertotal(HttpSession session) {
		System.out.println("Usertotal() 실행");
		
		//현재 시간 추출
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int month = now.getMonthValue();
		//int day = now.getDayOfMonth(); //월단위 통계만 지원
		
		System.out.println("현재시간 체크 : " + LocalDate.now().format(DateTimeFormatter.ofPattern("yy/MM/dd")));
		
		//시간 저장할 객체 생성
		AdminVO vo = new AdminVO();
		AdminVO vo1 = new AdminVO();
		
		//추출된 값 저장
		vo.setMonth(month);
		vo.setYear(year);
		
		System.out.println("vo값 체크 : " + vo);
		
		//전월 대비 값
		vo1 = setlastmonth(vo);
		
		AdminVO main1 = adminService.selectMonth_visitcnt(vo);
		AdminVO main2 = adminService.selectMonth_regcnt(vo);
		List<AdminVO> main3 = adminService.visitcntlist(vo);
		AdminVO main4 = adminService.lastMonth_visitcnt(vo1);
		AdminVO main5 = adminService.lastMonth_regcnt(vo1);
		
		if(main1 != null) {
			session.setAttribute("visitcnt", main1);
			session.setAttribute("regcnt", main2);
			session.setAttribute("visitcntlist", main3);
			session.setAttribute("lastMonth_visitcnt", main4);
			session.setAttribute("lastMonth_regcnt", main5);
			
			System.out.println("월 방문자 수 체크 : " + main1);
			System.out.println("월 가입자 수 체크 : " + main2);
			System.out.println("연간 방문자 수 체크 : " + main3);
			System.out.println("전월 방문자 수 체크 : " + main4);
			System.out.println("전월 가입자 수 체크 : " + main5);
			
			return "index.jsp?contentPage=admin/statisticsMember.jsp";
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/adminhome.do")
	public String adminHome(HttpSession session) {
		System.out.println("adminHome() 실행");
		
		//현재 시간 추출
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int month = now.getMonthValue();
		//int day = now.getDayOfMonth(); //월단위 통계만 지원
		
		System.out.println("현재시간 체크 : " + LocalDate.now().format(DateTimeFormatter.ofPattern("yy/MM/dd")));
		
		//시간 저장할 객체 생성
		AdminVO vo = new AdminVO();
		AdminVO vo1 = new AdminVO();
		
		//추출된 값 저장
		vo.setMonth(month);
		vo.setYear(year);
		
		System.out.println("vo값 체크 : " + vo);
		
		//전월 대비 값
		vo1 = setlastmonth(vo);
		
		//전체 지점 월 매출 통계
		 
		List<AdminVO> main1 = adminService.selectAll_Month(vo);
		List<AdminVO> main2 = adminService.selectAll_Month(vo1);
		
		//List로 가져온 전체 지점 월 매출 합산
		int total = 0;
		int lasttotal = 0;
		for(int i = 0; i < main1.size(); i++) {
	         total += main1.get(i).getMonthsale();
	      }
	      for(int i = 0; i < main2.size(); i++) {
	         lasttotal += main2.get(i).getMonthsale();
	      }
		
		System.out.println("현재 월 전체 지점 매출 합산값 체크 : " + total);
		System.out.println("전 월 전체 지점 매출 합산값 체크 : " + lasttotal);
		
		//방문자 통계
		AdminVO main3 = adminService.selectMonth_visitcnt(vo);
		AdminVO main4 = adminService.lastMonth_visitcnt(vo1);
		
		//가져온 값 체크
		System.out.println("adminhome 월 매출 : " + main1);
		System.out.println("adminhome 전월 매출 : " + main2);
		System.out.println("adminhome 월 방문자 수 : " + main3);
		System.out.println("adminhome 전월 방문자 수 : " + main4);
		
		session.setAttribute("Monthsale", total);
		session.setAttribute("lastMonthsale", lasttotal);
		session.setAttribute("visitcnt", main3);
		session.setAttribute("lastMonth_visitcnt", main4);
		
		//관리자 목록 출력
		List<MemberVO> adminlist = memberService.selectAllMember();
		
		System.out.println("adminlist 값 체크 : " + adminlist);
		
		session.setAttribute("adminlist", adminlist);
		
		return "index.jsp?contentPage=admin/adminHome.jsp";
	}
}
