package cn.com.kgc.tancoo.businessmanager.server.impl;

import java.util.List;

import cn.com.kgc.tancoo.businessmanager.dao.impl.ShoppingTrolleyDaoImpl;
import cn.com.kgc.tancoo.businessmanager.entity.ShoppingTrolley;
import cn.com.kgc.tancoo.businessmanager.server.ShoppingTrolleyServer;

public class ShoppingTrolleyServerImpl implements ShoppingTrolleyServer{
	ShoppingTrolleyDaoImpl stdi = new ShoppingTrolleyDaoImpl();
	@Override
	public List<ShoppingTrolley> getAll() {
		return stdi.getAll();
	}

	@Override
	public int add(ShoppingTrolley st) {
		return stdi.add(st);
	}

	@Override
	public int delete(int id) {
		return stdi.delete(id);
	}

	@Override
	public int update(ShoppingTrolley st) {
		return stdi.update(st);
	}
<<<<<<< HEAD

	@Override
	public List<ShoppingTrolley> getAlById(int userId) {
		return stdi.getAlById(userId);
	}
=======
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
	
}
