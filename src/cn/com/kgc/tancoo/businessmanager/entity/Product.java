package cn.com.kgc.tancoo.businessmanager.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private int proId;//商品编号
	private String proName;//商品名称
	private int proType;//商品类型
	private String proDescription;//商品描述
	private String proSimg;//商品小图片
	private String proBimg;//商品大图片
	private double proPrice;//商品价格
	private String proParam;//商品的细节描述 用英文,分开
	private String ptypeName;//商品类别
	private int proNum;//商品的数量
	public Product(int proId, String proName, int proType, String proDescription, String proSimg, String proBimg,
			double proPrice, String proParam, String ptypeName) {
		super();
		this.proId = proId;
		this.proName = proName;
		this.proType = proType;
		this.proDescription = proDescription;
		this.proSimg = proSimg;
		this.proBimg = proBimg;
		this.proPrice = proPrice;
		this.proParam = proParam;
		this.ptypeName = ptypeName;
	}
	
	
}
