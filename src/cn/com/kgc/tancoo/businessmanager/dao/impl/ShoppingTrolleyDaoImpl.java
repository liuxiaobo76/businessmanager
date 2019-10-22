package cn.com.kgc.tancoo.businessmanager.dao.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.junit.Test;

import cn.com.kgc.tancoo.businessmanager.dao.BaseDao;
import cn.com.kgc.tancoo.businessmanager.dao.ShopingTrolleyDao;
import cn.com.kgc.tancoo.businessmanager.entity.ShoppingTrolley;

public class ShoppingTrolleyDaoImpl implements ShopingTrolleyDao{
	QueryRunner qr = new QueryRunner(BaseDao.getDs());
	@Override
	public List<ShoppingTrolley> getAll() {
		String sql = "SELECT * FROM shoppingTorlley";
		try {
			return qr.query(sql, new BeanListHandler<>(ShoppingTrolley.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	@Test
	public void test1() {
		System.out.println(getAll());
	}
	@Override
	public int add(ShoppingTrolley st) {
		String sql = "INSERT INTO shoppingTorlley VALUES(NULL,?,?,NOW());";
		try {
			return qr.update(sql,st.getProId(),st.getUserId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Test
	public void test2() {
		System.out.println(add(new ShoppingTrolley(3,5,4,new Date())));
	}
	@Override
	public int delete(int id) {
		String sql = "delete from shoppingTorlley where troId=?";
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
		System.out.println(delete(2));
	}
	@Override
	public int update(ShoppingTrolley st) {
		String sql = "update shoppingTorlley set proId=?,userId=?,troTime=? where troId=?";
		try {
			return qr.update(sql,st.getProId(),st.getUserId(),st.getTroTime(),st.getTroId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Test
	public void test4() {
		System.out.println(update(new ShoppingTrolley(1, 3, 3, new Date())));
	}
}
