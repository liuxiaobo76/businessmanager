package cn.kgc.tangcco.tcbd1015.rsh.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.kgc.tangcco.tcbd1015.rsh.dao.BaseDao;
import cn.kgc.tangcco.tcbd1015.rsh.dao.OrderDao;
import cn.kgc.tangcco.tcbd1015.rsh.entity.Order;

/**
* 类描述：
* @version:1.0
* @author:任世豪
* @创建时间:2019年10月24日 14:47:12
*/
public class OrderDaoImpl implements OrderDao{
	QueryRunner qr = new QueryRunner(BaseDao.getDs());
	
	/*@Test
	public void test() {
		System.out.println(getAll(null,2,4));
		
	}*/
	@Override
	public List<Order> getAll(String orderRandom, int cutpage, int pagecount) {
		if(orderRandom==null) {
			String sql = "select u.userName,u.userId,u.userphone,u.userAddr,o.orderPrice,o.orderRandom,o.orderTime from orderd o,userinfo u where o.userId=u.userId limit ?,?";
			try {
				return qr.query(sql, new BeanListHandler<>(Order.class),(cutpage-1)*pagecount,pagecount);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			String sql = "select u.userName,u.userId,u.userphone,o.userAddr,o.orderPrice,o.orderRandom,o.orderTime from orderd o,userinfo u where o.userId=u.userId and o.orderRandom=? ";
			try {
				return qr.query(sql, new BeanListHandler<>(Order.class),orderRandom);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	@Override
	public int getCount(String orderRandom) {
		if(orderRandom!=null) {
			String sql ="SELECT COUNT(*) FROM orderd WHERE orderRandom=?";
			try {
				return (int)(long)qr.query(sql, new ScalarHandler<Long>(),orderRandom);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			String sql = "select count(*) from orderd";
			try {
				return (int)(long)qr.query(sql, new ScalarHandler<Long>());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}

	@Override
	public int update(String userphone,String userAddr,int userId) {
		String sql = "UPDATE userinfo SET userphone=?,userAddr=? WHERE userId=?";
		try {
			return qr.update(sql,userphone,userAddr,userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Order select(int userId) {
		String sql = "SELECT * FROM userinfo WHERE userId=?";
		try {
			return qr.query(sql, new BeanHandler<>(Order.class),userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/*@Test
	public void test() {
		System.out.println(select(2).getUserId());
		
	}*/

	@Override
	public int delete(String orderRandom) {
		String sql = "delete from orderd where orderRandom=?";
		try {
			return qr.update(sql,orderRandom);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	

}
