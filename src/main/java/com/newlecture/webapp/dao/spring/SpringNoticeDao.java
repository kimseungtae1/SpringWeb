package com.newlecture.webapp.dao.spring;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.newlecture.webapp.dao.NoticeDao;
import com.newlecture.webapp.entity.NoticeView;

public class SpringNoticeDao implements NoticeDao {

	@Autowired
	private DataSource dataSource;
	
	@Override
	public List<NoticeView> getList(int page, String query) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public NoticeView get(String id) {
		
		String sql = "SELECT * FROM NoticeView WHERE id=?";
		
		//JdbcTemplate jdbcTemplete = new JdbcTemplate();
		//jdbcTemplete.queryForObject(sql, requiredType);
		
		return null;
	}

	@Override
	public int update(String id, String title, String content) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<NoticeView> getList(int page, String field, String query) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeView getPrev(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeView getNext(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}