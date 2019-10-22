package cn.kgc.tangcco.tcbd1015.rsh.service.impl;

import java.util.List;

import cn.kgc.tangcco.tcbd1015.rsh.dao.impl.OrderDaoImpl;
import cn.kgc.tangcco.tcbd1015.rsh.entity.Order;
import cn.kgc.tangcco.tcbd1015.rsh.service.OrderService;

/**
* 创建时间：
* @version:1.0
* @author:任世豪
* @创建时间:2019年10月24日  14:55:19
*/
public class OrderServiceImpl implements OrderService{
	OrderDaoImpl odi = new OrderDaoImpl();
	@Override
	public List<Order> getAll(String orderRandom, int cutpage, int pagecount) {
		return odi.getAll(orderRandom, cutpage, pagecount);
	}
	@Override
	public int getCount(String orderRandom) {
		return odi.getCount(orderRandom);
	}
	@Override
	public int update(String userphone, String userAddr, int userId) {
		return odi.update(userphone, userAddr, userId);
	}
	@Override
	public Order select(int userId) {
		return odi.select(userId);
	}
	@Override
	public int delete(String orderRandom) {
		return odi.delete(orderRandom);
	}

}
