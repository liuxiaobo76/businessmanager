package cn.com.kgc.tancoo.businessmanager.dao.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.junit.Test;


import cn.com.kgc.tancoo.businessmanager.dao.BaseDao;
import cn.com.kgc.tancoo.businessmanager.dao.CommentDao;
import cn.com.kgc.tancoo.businessmanager.entity.Comment;

public class CommentDaoImpl implements CommentDao{
	QueryRunner qr = new QueryRunner(BaseDao.getDs());

	@Override
	public List<Comment> getAll() {
		String sql = "SELECT * FROM COMMENT ";
		try {
			return qr.query(sql, new BeanListHandler<>(Comment.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Test
	public void test1() {
		System.out.println(getAll());
	}

	@Override
	public int add(Comment com) {
		String sql = "INSERT INTO COMMENT VALUES(NULL,?,?,?,?,NOW(),?)";
		try {
			return qr.update(sql,com.getComName(),com.getUserId(),com.getComTitle(),com.getComContent(),com.getComScore());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	@Test
	public void test2(){
		System.out.println(add(new Comment(1,"",3,"ss","ss",new Date(),2.2)));
	}
	@Override
	public int delete(int id) {
		String sql = "delete from comment where comId = ?";
		try {
			return qr.update(sql,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Test
	public void test3() {
		System.out.println(delete(3));
	}
	@Override
	public int update(Comment ad) {
		String sql = "UPDATE COMMENT SET comName=?,userId=?,comTitle=?,comContent=?,comTime=?,comScore=? WHERE comId=?;";
		try {
			return qr.update(sql,ad.getComName(),ad.getUserId(),ad.getComTitle(),ad.getComContent(),ad.getComTime(),ad.getComScore(),ad.getComId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Test
	public void test4() {
		System.out.println(update(new Comment(2,"aa",2,"ss","ss",new Date(),2.2)));
	}
}
