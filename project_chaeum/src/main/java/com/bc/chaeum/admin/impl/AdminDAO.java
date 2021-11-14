package com.bc.chaeum.admin.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bc.chaeum.admin.service.AdminVO;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<AdminVO> selectAll_Month(AdminVO vo) {
		return mybatis.selectList("selectAll_Month", vo);
	}
	
	public List<AdminVO> selectAll_Day(AdminVO vo) {
		return mybatis.selectList("selectAll_Day", vo);
	}
	
	public AdminVO selectOne_Month(AdminVO vo) {
		return mybatis.selectOne("selectOne_Month", vo);
	}

	public AdminVO selectOne_Day(AdminVO vo) {
		return mybatis.selectOne("selectOne_Day", vo);
	}

	public AdminVO selectOne_lastMonth(AdminVO vo2) {
		return mybatis.selectOne("selectOne_Month", vo2);
	}

	public AdminVO selectOne_lastDay(AdminVO vo3) {
		return  mybatis.selectOne("selectOne_Day", vo3);
	}

	public AdminVO selectMonth_visitcnt(AdminVO vo) {
		return mybatis.selectOne("selectMonth_visitcnt", vo);
	}

	public AdminVO selectMonth_regcnt(AdminVO vo) {
		return mybatis.selectOne("selectMonth_regcnt", vo);
	}

	public List<AdminVO> visitcntlist(AdminVO vo) {
		return mybatis.selectList("visitcntlist", vo);
	}

	public void updatevisitcnt(String now) {
		System.out.println("방문자 수 업데이트 실행");
		
		//방문자 수 업데이트 실행
		int row = mybatis.update("updatevisitcnt", now);
		
		//업데이트 성공 row값 체크, 0일 경우 date값 미존재이므로 등록 실행
		if (row == 0) {
			System.out.println("방문자 수 등록 실행");
			mybatis.insert("insertvisitcnt", now);
		}
		System.out.println("row 값 체크 : " + row);
	}
}
