package cn.kgc.tangcco.tcbd1015.rsh.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
* 类描述：
* @version:1.0
* @author:任世豪
* @创建时间:2019年10月24日  14:22:42
*/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
	/**
	 * 订单编号
	 */
	private int orderId;
	/**
	 * 用户编号
	 */
	private int userId;
	/**
	 * 用户名称
	 */
	private String userName;
	/**
	 * 用户手机号
	 */
	private String userphone;
	/**
	 * 用户地址ַ
	 */
	private String userAddr;
	/**
	 * 订单价格
	 */
	private double orderPrice;
	/**
	 * 订单编号
	 */
	private String orderRandom;
	/**
	 * 下单时间
	 */
	private String orderTime;
	
}
