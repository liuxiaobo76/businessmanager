package cn.com.kgc.tancoo.businessmanager.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.junit.Test;

import cn.com.kgc.tancoo.businessmanager.dao.AdminDao;
import cn.com.kgc.tancoo.businessmanager.dao.BaseDao;
import cn.com.kgc.tancoo.businessmanager.entity.Admin;

public class AdminDaoImpl implements AdminDao{
	QueryRunner qr = new QueryRunner(BaseDao.getDs());
	
	/**
	 * 获得虽有管理员的集合
	 */
	@Override
	public List<Admin> getAll() {
		String sql = "SELECT adminId,adminName,adminPwd,userStatus FROM admin,usertype WHERE admin.adminAuth=usertype.id;";
		try {
			return qr.query(sql, new BeanListHandler<>(Admin.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@Test
	public void tests() {
		System.out.println(delete(4));
	}

	@Override
	public int add(Admin ad) {
		String sql = "INSERT INTO admin VALUES(NULL,?,?,?)";
		try {
			return qr.update(sql,ad.getAdminName(),ad.getAdminPwd(),ad.getAdminAuth());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int delete(int id) {
		String sql = "delete from admin where adminId = ?";
		try {
			return qr.update(sql,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int update(Admin ad) {
		String sql = "update admin set adminName=?,adminPwd=? where adminId=?;";
		try {
			return qr.update(sql,ad.getAdminName(),ad.getAdminPwd(),ad.getAdminId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	@Test
	public void ddd() {
		System.out.println(update(new Admin(3, "ha", "123456", 2,"普通管理员")));
	}
}
