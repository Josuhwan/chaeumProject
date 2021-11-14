package com.bc.chaeum.view.branch;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bc.chaeum.branch.service.BranchVO;
import com.bc.chaeum.branch.service.StudyroomService;
import com.bc.chaeum.branch.service.StudyroomVO;

@Controller
@SessionAttributes("studyroom")
public class StudyroomController {
	@Autowired
	private StudyroomService studyroomService;
	
	public StudyroomController() {
		System.out.println(">> StudyroomController() 객체 생성");
	}
	
	@RequestMapping("/getStudyroomList.do")
	public String getStudyroom(StudyroomVO vo, Model model, HttpSession session) {
		
		BranchVO branch = (BranchVO) session.getAttribute("branch");
		System.out.println(branch.getBranch_name());
		int bid = branch.getBranch_id();
		System.out.println(bid);
		List<StudyroomVO> studyroomList_Bid = studyroomService.getStudyroomList_Bid(bid);
		
		model.addAttribute("studyroomList_Bid", studyroomList_Bid);
		return "index.jsp?contentPage=reservation/choiceStudyroom.jsp";
	
	}
	

}
