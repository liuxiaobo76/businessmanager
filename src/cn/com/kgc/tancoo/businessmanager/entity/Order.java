package cn.com.kgc.tancoo.businessmanager.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
	private int orderId;//订单编号
<<<<<<< HEAD
	private int proId;//订购商品名称s
	private int orderNum;//订单的商品数
	private int userId;//用户编号
	private double orderPrice;//订单总金额
=======
	private String orderPro;//订购商品名称
	private int userId;//用户编号
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
	private String delAddr;//发货地址
	private String userAddr;//收货地址
	private Date orderTime;//订货时间
	private String orderBz;//备注
	private int orderStatu;//订单状态
	private String orderStatus;//订单状态
<<<<<<< HEAD
	private String orderRandom;//随机订单编号
=======
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808

}
