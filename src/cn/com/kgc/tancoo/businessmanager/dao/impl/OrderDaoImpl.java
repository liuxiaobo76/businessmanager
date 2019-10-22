package cn.com.kgc.tancoo.businessmanager.dao.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.junit.Test;

import cn.com.kgc.tancoo.businessmanager.dao.BaseDao;
import cn.com.kgc.tancoo.businessmanager.dao.OrderDao;
import cn.com.kgc.tancoo.businessmanager.entity.Order;

public class OrderDaoImpl implements OrderDao {
	QueryRunner qr = new QueryRunner(BaseDao.getDs());

	@Override
	public List<Order> getAll() {
		String sql = "SELECT orderId,orderPro,userId,delAddr,userAddr,orderTime,ordreBz,orderstatus.orderStatus FROM orderd,orderstatus WHERE orderd.orderStatus=ordersId";
		try {
			return qr.query(sql, new BeanListHandler<>(Order.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Test
	public void testt() {
		System.out.println(getAll());
	}

	@Override
	public int add(Order ord) {
		String sql = "INSERT INTO orderd VALUES(NULL,?,?,?,?,NOW(),?,?);";
		try {
			return qr.update(sql,ord.getOrderPro(),ord.getUserId(),ord.getDelAddr(),ord.getUserAddr(),ord.getOrderBz(),ord.getOrderStatu());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Test
	public void testtt() {
		System.out.println(add(new Order(1, "fs", 4, "北京", "天津", new Date(), "快点发货", 1,"s")));
	}
	@Override
	public int delete(int id) {
		String sql = "delete from orderd where orderId=?";
		try {
			return qr.update(sql,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Test
	public void testttt() {
		System.out.println(delete(4));
	}
}
