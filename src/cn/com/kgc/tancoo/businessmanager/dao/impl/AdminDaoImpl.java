package cn.com.kgc.tancoo.businessmanager.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
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
	@Override
	public Admin login(String adminName, String adminPwd) {
		String sql="select * from admin where adminName=? and adminPwd=?";
		try {
			return qr.query(sql, new BeanHandler<>(Admin.class),adminName,adminPwd);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public List<Admin> getAll(String adminName,int currentPage, int pageCount) {
		String sql="select a.adminId,a.adminName,a.adminPwd,ut.userStatus from admin a,usertype ut where a.adminAuth=ut.id and 1=1 ";
		List<Object> list=new ArrayList<>();
		if(adminName!=null) {
			sql+=" and adminName like ?";
			list.add("%"+adminName.trim()+"%");
		}
		sql+=" limit ?,?";
		list.add(((currentPage-1)*pageCount));
		list.add(pageCount);
		try {
			return qr.query(sql, new BeanListHandler<>(Admin.class),list.toArray());
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public int getCount(String adminName) {
		String sql="select COUNT(*) from admin where 1=1";
		List<Object> list=new ArrayList<>();
		if(adminName!=null) {
			sql+=" and adminName like ?";
			list.add("%"+adminName.trim()+"%");
		}
		
		try {
			return (int)(long)qr.query(sql, new ScalarHandler<Long>(),list.toArray());
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Test
	public void test() {
		System.out.println(checkName("admin"));
	}
	@Override
	public int deleteAdmin(int id) {
		String sql="delete from admin where adminId=?";
		try {
			return qr.update(sql,id);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	@Override
	public int addAdmin(Admin a) {
		String sql="insert into admin value (null,?,?,?)";
		try {
			return qr.update(sql,a.getAdminName(),a.getAdminPwd(),a.getAdminAuth());
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	@Override
	public int checkName(String Aname) {
		String sql="select count(*) from admin where adminName=?";
		try {
			return (int)(long)qr.query(sql, new ScalarHandler<Long>(),Aname);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	@Override
	public Admin queryAdminById(int id) {
		String sql="select a.adminId,a.adminName,a.adminPwd,a.adminAuth,ut.userStatus from admin a,usertype ut where a.adminAuth=ut.id and a.adminId=?";
		try {
			return qr.query(sql, new BeanHandler<>(Admin.class),id);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public int updateAdmin(Admin a) {
		String sql="update admin set adminName=?,adminPwd=?,adminAuth=? where adminId=?";
		try {
			return qr.update(sql,a.getAdminName(),a.getAdminPwd(),a.getAdminAuth(),a.getAdminId());
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
}
