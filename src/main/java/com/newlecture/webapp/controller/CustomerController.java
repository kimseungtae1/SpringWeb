package com.newlecture.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/customer/*")
public class CustomerController {
	
	@RequestMapping("notice")
	@ResponseBody
	public String notice(
		@RequestParam(value="p", defaultValue="1") Integer page, 
		@RequestParam(value="q", defaultValue="") String query) {
		
		String output = String.format("p:%s, q:%s", page, query);
		
		return output;
	}
	
	@RequestMapping("notice/{id}")
	@ResponseBody
	public String noticeDetail(@PathVariable("id") String id) {
		
		return id + "번째 공지사항";
	}
}
