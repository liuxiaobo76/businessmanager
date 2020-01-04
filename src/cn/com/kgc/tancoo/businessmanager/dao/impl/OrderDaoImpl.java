package cn.com.kgc.tancoo.businessmanager.dao.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
<<<<<<< HEAD
import org.apache.commons.dbutils.handlers.ScalarHandler;
=======
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
import org.junit.Test;

import cn.com.kgc.tancoo.businessmanager.dao.BaseDao;
import cn.com.kgc.tancoo.businessmanager.dao.OrderDao;
import cn.com.kgc.tancoo.businessmanager.entity.Order;

public class OrderDaoImpl implements OrderDao {
	QueryRunner qr = new QueryRunner(BaseDao.getDs());

	@Override
	public List<Order> getAll() {
<<<<<<< HEAD
		String sql = "SELECT orderId,proId,orderNum,userId,orderPrice,delAddr,userAddr,orderTime,ordreBz,orderstatus.orderStatus,orderRandom FROM orderd,orderstatus WHERE orderd.orderStatus=ordersId";
		try {
			return qr.query(sql, new BeanListHandler<>(Order.class));
		} catch (SQLException e) {
=======
		String sql = "SELECT orderId,orderPro,userId,delAddr,userAddr,orderTime,ordreBz,orderstatus.orderStatus FROM orderd,orderstatus WHERE orderd.orderStatus=ordersId";
		try {
			return qr.query(sql, new BeanListHandler<>(Order.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
			e.printStackTrace();
		}
		return null;
	}
	@Test
	public void testt() {
		System.out.println(getAll());
	}
<<<<<<< HEAD
	@Override
	public List<Order> getAllById(int id, int pageindex, int pagecount) {
		String sql = "SELECT orderId,proId,orderNum,userId,orderPrice,delAddr,userAddr,orderTime,ordreBz,orderstatus.orderStatus,orderRandom FROM orderd,orderstatus WHERE orderd.orderStatus=ordersId AND userId=? LIMIT ?,?;";
		try {
			return qr.query(sql, new BeanListHandler<>(Order.class),id,pageindex,pagecount);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public int add(Order ord) {
		String sql = "INSERT INTO orderd VALUES(NULL,?,?,?,?,?,?,NOW(),?,?,?);";
		try {
			return qr.update(sql,ord.getProId(),ord.getOrderNum(),ord.getUserId(),ord.getOrderPrice(),ord.getDelAddr(),ord.getUserAddr(),ord.getOrderBz(),ord.getOrderStatu(),ord.getOrderRandom());
=======

	@Override
	public int add(Order ord) {
		String sql = "INSERT INTO orderd VALUES(NULL,?,?,?,?,NOW(),?,?);";
		try {
			return qr.update(sql,ord.getOrderPro(),ord.getUserId(),ord.getDelAddr(),ord.getUserAddr(),ord.getOrderBz(),ord.getOrderStatu());
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Test
	public void testtt() {
<<<<<<< HEAD
		System.out.println(add(new Order(1, 6,2, 4,666666, "北京", "天津", new Date(), "快点发货", 1,"s","")));
=======
		System.out.println(add(new Order(1, "fs", 4, "北京", "天津", new Date(), "快点发货", 1,"s")));
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
	}
	@Override
	public int delete(int id) {
		String sql = "delete from orderd where orderId=?";
		try {
			return qr.update(sql,id);
		} catch (SQLException e) {
<<<<<<< HEAD
=======
			// TODO Auto-generated catch block
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
			e.printStackTrace();
		}
		return 0;
	}
	@Test
	public void testttt() {
		System.out.println(delete(4));
	}
<<<<<<< HEAD
	@Override
	public int getCount(int id) {
		String sql = "SELECT COUNT(*) FROM orderd WHERE userId=?;";
		try {
			return (int)(long)qr.query(sql, new ScalarHandler<Long>(),id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
=======
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
}
