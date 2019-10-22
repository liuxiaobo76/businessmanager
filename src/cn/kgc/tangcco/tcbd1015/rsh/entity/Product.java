package cn.kgc.tangcco.tcbd1015.rsh.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
* 类描述：商品实体类
* @version:1.0
* @author:任世豪
* @创建时间:2019年10月31日 下午3:20:30
*/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	/**
	 * 商品编号
	 */
	private int proId;
	/**
	 * 商品名称
	 */
	private String proName;
	/**
	 * 商品类别
	 */
	private int proType;
	/**
	 * 商品类别名称
	 */
	private String ptypeName;
	/**
	 * 商品描述
	 */
	private String proDescription;
	/**
	 * 商品小图地址
	 */
	private String proSimg;
	/**
	 * 商品大图地址
	 */
	private String proBimg;
	/**
	 * 商品价格
	 */
	private double proPrice;
	
	
	public Product(String proName, int proType, String proDescription, String proSimg, String proBimg,
			double proPrice) {
		super();
		this.proName = proName;
		this.proType = proType;
		this.proDescription = proDescription;
		this.proSimg = proSimg;
		this.proBimg = proBimg;
		this.proPrice = proPrice;
	}


	public Product(int proId, String proName, int proType, String proDescription, String proSimg, String proBimg,
			double proPrice) {
		super();
		this.proId = proId;
		this.proName = proName;
		this.proType = proType;
		this.proDescription = proDescription;
		this.proSimg = proSimg;
		this.proBimg = proBimg;
		this.proPrice = proPrice;
	}
	
	
}
