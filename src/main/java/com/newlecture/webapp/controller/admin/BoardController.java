package com.newlecture.webapp.controller.admin;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.newlecture.webapp.dao.NoticeDao;
import com.newlecture.webapp.entity.Notice;

@Controller
@RequestMapping("/admin/board/*")
public class BoardController {

	//객체는 ioc컨테이너에 있지!
	@Autowired
	private NoticeDao noticeDao;
	
	@RequestMapping("notice")
	public String notice(
			@RequestParam(value="p", defaultValue="1") Integer page,
			@RequestParam(value="f", defaultValue="title") String field, //title을 기본값으로 검색하겠다
			@RequestParam(value="q", defaultValue="") String query,
			Model model) {
		
		model.addAttribute("list", noticeDao.getList(page, field, query));
		
		return "admin.board.notice.list";
	}
	
	@RequestMapping("notice/{id}")
	public String noticeDetail(@PathVariable("id") String id, Model model) {
		
		model.addAttribute("n", noticeDao.get(id));
		model.addAttribute("prev", noticeDao.getPrev(id));
		model.addAttribute("next", noticeDao.getNext(id));
		
		//return "customer/notice-detail";
		return "admin.board.notice.detail";
	}
	
	@RequestMapping(value="notice/reg", method=RequestMethod.GET)
	public String noticeReg() {
		
		return "admin.board.notice.reg";
	}
	
	@RequestMapping(value="notice/reg", method=RequestMethod.POST)
	/*public String noticeReg(
			String title,
			String content) throws UnsupportedEncodingException {*/
	public String noticeReg(
			Notice notice,
			MultipartFile file,
			HttpServletRequest request) throws IOException {
		
		//현재날짜얻기 - 디렉토리관리를 년도별로 하기 위해
		// 날짜얻는방법1
		//Date curDate = new Date();
		//curDate.getYear();
		
		// 날짜얻는방법2
		Calendar cal = Calendar.getInstance();
		//Date curDate2 = cal.getTime();
		int year = cal.get(Calendar.YEAR);
		
		// 날짜얻는방법3
		//SimpleDateFormat fmt = new SimpleDateFormat("yyyy");
		//String year = fmt.format(curDate)

		
		//트랜잭션으로 묶어줘야한다. 내가 글을 올리고 있는데 다른사람이 올려버리면 내가 받아온 키값이 달라져야 하기때문에
		//방해받으면 안되므로 하나의 단위로 묶어줘야한다.
		//다음 게시물의 글번호를 알아냈던 서브쿼리를 함수로 만들어서 이용해야한다. 
		String nextId = noticeDao.getNextId();
				
		ServletContext ctx = request.getServletContext();
		/*String path = ctx.getRealPath("/resource/customer/notice/" + year + "/" + nextId); //year의 묵시적인 형변환 ( 정수형 -> 문자형 )*/
		String path = ctx.getRealPath(String.format("/resource/customer/notice/%d/%s", year, nextId));		
		System.out.println(path);
		
		File f = new File(path); //연도별 폴더생성을 위한 파일객체 생성
		
		if(f.exists()) {
			if(!f.mkdirs()) //mkdirs() -> 폴더를 만들어라
				System.out.println("디렉토리를 생성할 수가 없습니다.");
		}
		
		f.mkdirs();
		
		InputStream fis = file.getInputStream();
		OutputStream fos = new FileOutputStream(f);
		
		
		/*
		//file.getInputStream();
		String fileName = file.getOriginalFilename(); //db연동하기전에 파일이 넘어오는지 확인해야한다.
		System.out.println(fileName);
		
		//한글 깨질때
		//title = new String(title.getBytes("ISO-8859-1"),"UTF-8");
		
		System.out.println(notice.getTitle());
		
		String writerId = "newlec";
		notice.setWriterId("newlec");
		//int row = noticeDao.insert(new Notice(title, content, writerId));
		int row = noticeDao.insert(notice);
		*/
		return "redirect:../notice";
	}
}
