package cn.com.kgc.tancoo.businessmanager.dao;

import java.util.List;

import cn.com.kgc.tancoo.businessmanager.entity.ShoppingTrolley;

public interface ShopingTrolleyDao {
	/**
	 * 查找购物车
	 * @return
	 */
	List<ShoppingTrolley> getAll();
	/**
	 * 添加购物车
	 * @param ord 要添加的购物车记录
	 * @return
	 */
	int add(ShoppingTrolley st);
	/**
	 * 根据编号删除商品
	 * @param id 要删除的购物记录
	 * @return
	 */
	int delete(int id);
	/**
	 * 修改购物车记录
	 * @param pro 要修改的购物车
	 * @return
	 */
	int update(ShoppingTrolley st);
	/**
	 * 查找购物车
	 * 根据用户编号查找购物车
	 * @return
	 */
	List<ShoppingTrolley> getAlById(int userId);
	
}
