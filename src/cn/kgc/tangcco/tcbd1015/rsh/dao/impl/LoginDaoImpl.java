package cn.kgc.tangcco.tcbd1015.rsh.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.kgc.tangcco.tcbd1015.rsh.dao.BaseDao;
import cn.kgc.tangcco.tcbd1015.rsh.dao.LoginDao;
import cn.kgc.tangcco.tcbd1015.rsh.entity.User;

/**
* 类描述:
* @version:1.0
* @author:任世豪
* @创建时间:2019年10月23日  15:04:34
*/
public class LoginDaoImpl implements LoginDao{
	QueryRunner qr = new QueryRunner(BaseDao.getDs());
	@Override
	public User login(String userName,String userPwd) {
		String sql = "select *from userinfo where userName=? and userPwd=?";
		try {
			return qr.query(sql, new BeanHandler<>(User.class),userName,userPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
