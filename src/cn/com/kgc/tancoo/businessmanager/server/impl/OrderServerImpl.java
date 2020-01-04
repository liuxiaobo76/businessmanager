package cn.com.kgc.tancoo.businessmanager.server.impl;

import java.util.List;

import cn.com.kgc.tancoo.businessmanager.dao.impl.OrderDaoImpl;
import cn.com.kgc.tancoo.businessmanager.entity.Order;
import cn.com.kgc.tancoo.businessmanager.server.OrderServer;

public class OrderServerImpl implements OrderServer {
	OrderDaoImpl odi = new OrderDaoImpl();
	@Override
	public List<Order> getAll() {
		return odi.getAll();
	}
<<<<<<< HEAD
	@Override
	public List<Order> getAllById(int id, int pageindex, int pagecount) {
		return odi.getAllById(id, pageindex, pagecount);
	}
=======
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808

	@Override
	public int add(Order ord) {
		return odi.add(ord);
	}

	@Override
	public int delete(int id) {
		return odi.delete(id);
	}
<<<<<<< HEAD
	@Override
	public int getCount(int id) {
		return odi.getCount(id);
	}

	
=======
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808

}
