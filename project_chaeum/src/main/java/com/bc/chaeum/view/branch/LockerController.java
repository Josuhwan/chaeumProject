package com.bc.chaeum.view.branch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.bc.chaeum.branch.service.LockerService;

@Controller
public class LockerController {
	@Autowired
	private LockerService lockerService;
	
	public LockerController() {
		System.out.println(">> LockerController() 객체 생성");
	}
	
	
}
