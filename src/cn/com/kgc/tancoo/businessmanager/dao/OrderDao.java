package cn.com.kgc.tancoo.businessmanager.dao;

import java.util.List;

import cn.com.kgc.tancoo.businessmanager.entity.Order;

public interface OrderDao {
	/**
	 * 查找订单
	 * @return
	 */
	List<Order> getAll();
	/**
	 * 添加订单
	 * @param ord 要添加的订单
	 * @return
	 */
	int add(Order ord);
	/**
	 * 根据编号删除订单
	 * @param id 要删除的订单编号
	 * @return
	 */
	int delete(int id);
	//int Update(Product pro);
	
}
