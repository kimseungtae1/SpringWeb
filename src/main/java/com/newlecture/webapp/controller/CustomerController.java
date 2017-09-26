package com.newlecture.webapp.controller;


import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newlecture.webapp.dao.NoticeDao;
import com.newlecture.webapp.entity.NoticeView;

@Controller
@RequestMapping("/customer/*")
public class CustomerController {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@RequestMapping("notice")
	public String notice(
		@RequestParam(value="p", defaultValue="3") Integer page,
		@RequestParam(value="p", defaultValue="title") String field, //title�� �⺻������ �˻��ϰڴ�
		@RequestParam(value="q", defaultValue="") String query,
		Model model) {
		
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		List<NoticeView> list = noticeDao.getList(page, field, query);

		model.addAttribute("list", list);
		
		/*
		String output = String.format("p:%s, q:%s\n", page, query);
		output += String.format("title : %s\n", list.get(0).getTitle());*/
		
		return "customer/notice"; //servlet-context.xml���� ������ resolve ���̺귯���� �̿��ؼ� �����Ͽ��⶧���� �ٿ������ִ�!
	}
	
	@RequestMapping("notice/{id}")
	@ResponseBody
	public String noticeDetail(@PathVariable("id") String id) {
		
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		NoticeView noticeView = noticeDao.get(id);
		
		return "customer/notice-detail";
	}
}
