package cn.kgc.tangcco.tcbd1015.rsh.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.kgc.tangcco.tcbd1015.rsh.dao.BaseDao;
import cn.kgc.tangcco.tcbd1015.rsh.dao.PtypeDao;
import cn.kgc.tangcco.tcbd1015.rsh.entity.Ptype;

/**
* 类描述：
* @version:1.0
* @author:任世豪
* @创建时间:2019年10月31日 上午9:08:11
*/
public class PtypeDaoImpl implements PtypeDao{
	QueryRunner qr = new QueryRunner(BaseDao.getDs());
	@Override
	public List<Ptype> getAll() {
		String sql = "SELECT *FROM producttype";
		try {
			return qr.query(sql, new BeanListHandler<>(Ptype.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public int update(int ptypeId,String ptypeName) {
		String sql = "update producttype set ptypeName=? where ptypeId=?";
		try {
			return qr.update(sql, ptypeName, ptypeId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public Ptype query(int ptypeId) {
		String sql = "select *from producttype where ptypeId=?";
		try {
			return qr.query(sql, new BeanHandler<>(Ptype.class),ptypeId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public int add(String ptypeName) {
		String sql = "insert into producttype values(null,?,0)";
		try {
			return qr.update(sql, ptypeName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}
