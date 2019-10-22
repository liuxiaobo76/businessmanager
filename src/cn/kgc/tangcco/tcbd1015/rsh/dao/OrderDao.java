package cn.kgc.tangcco.tcbd1015.rsh.dao;

import java.util.List;

import cn.kgc.tangcco.tcbd1015.rsh.entity.Order;

/**
* 类描述：
* @version:1.0
* @author:任世豪
* @创建时间:2019年10月24日 14:29:29
*/

public interface OrderDao {
	/**
	 * 获取所有订单
	 * @param orderRandom 查询的订单编号
	 * @param cutpage 第几页
	 * @param pagecount 一页有多少条数据
	 * @return
	 */ 
	List<Order>getAll(String orderRandom,int cutpage,int pagecount);
	/**
	 * 获取有多少条数据
	 * @param orderRandom 订单编号
	 * @return
	 */
	int getCount(String orderRandom);
	/**
	 * 修改订单信息
	 * @param orderId 用户编号
	 * @return 
	 */
	int update(String userphone,String userAddr,int userId);
	/**
	 * 查找订单信息
	 * @param userId 用户编号
	 * @return 
	 */
	Order select(int userId);
	/**
	 * 删除订单
	 * @param orderRandom 订单编号
	 * @return
	 */
	int delete(String orderRandom);
	
}
