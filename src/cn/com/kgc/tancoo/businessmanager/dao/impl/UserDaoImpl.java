package cn.com.kgc.tancoo.businessmanager.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import com.sun.javafx.fxml.BeanAdapter;

import cn.com.kgc.tancoo.businessmanager.dao.BaseDao;
import cn.com.kgc.tancoo.businessmanager.dao.UserDao;
import cn.com.kgc.tancoo.businessmanager.entity.User;

public class UserDaoImpl implements UserDao {

	QueryRunner qr = new QueryRunner(BaseDao.getDs());

	@Override
	public int yzUesr(String userName) {
		String sql = "select COUNT(*) from userinfo where  userName =?";
		try {
			return (int) (long) qr.query(sql, new ScalarHandler<Long>(), userName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		
		}
	}


	@Override
	public User login(String userName, String pwd) {
		String sql = "select * from userinfo  where  userName=? and userPwd=?";
		try {
			return qr.query(sql, new BeanHandler<>(User.class), userName, pwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	
	@Override
	public int add(User account) {
		
		String sql = "insert into userinfo values(null,?,?,?,?,?,?,?,NOW(),?,?)";
		try {																																							
			return qr.update(sql,account.getUserName(),account.getUserPwd(),account.getUserAddr(),account.getUserPhone(),account.getUserTruename(),account.getUserSex(),account.getUserBirthday(),account.getUserType(),account.getUserStatus());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}


	@Override
	public List<User> getAll() {
		String sql = "select userinfo.*,usertype.userStatus as userStatu from userinfo,usertype where userinfo.userType=usertype.id";
		try {
			return qr.query(sql, new BeanListHandler<>(User.class));
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
	public int delete(int id) {
		String sql = "DELETE FROM userinfo WHERE userId =?";
		try {
			return qr.update(sql,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Test
	public void test2() {
		System.out.println(delete(5));
	}

	@Override
	public int update(User user) {
		String sql = "UPDATE userinfo SET userName=?,userPwd=?,userAddr=?,userPhone=?,userTruename=?,userSex=?,userBirthday=?,userRegtime=?,userType=?,userStatus=? WHERE userId=?";
		try {
			return qr.update(sql,user.getUserName(),user.getUserPwd(),user.getUserAddr(),user.getUserPhone(),user.getUserTruename(),user.getUserSex(),user.getUserBirthday(),user.getUserRegtime(),user.getUserType(),user.getUserStatus(),user.getUserId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Test
	public void test3() {
		System.out.println(update(new User(4,"哈哈","","","","","","s",new Date(),3,0,"")));
	}
}
