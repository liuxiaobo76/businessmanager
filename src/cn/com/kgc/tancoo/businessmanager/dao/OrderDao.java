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
<<<<<<< HEAD
	 * 获取个人的全部信息
	 * @param id 用户编号
	 * @param pageindex 第几页
	 * @param pagecount 每页几个
	 * @return
	 */
	List<Order> getAllById(int id,int pageindex,int pagecount);
	/**
=======
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
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
<<<<<<< HEAD
	/**
	 * 获取该用户的总条数
	 * @param id
	 * @return
	 */
	int getCount(int id);
=======
	//int Update(Product pro);
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
	
}
