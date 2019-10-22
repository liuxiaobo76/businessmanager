package cn.kgc.tangcco.tcbd1015.rsh.service;

import java.util.List;

import cn.kgc.tangcco.tcbd1015.rsh.entity.Product;
import cn.kgc.tangcco.tcbd1015.rsh.entity.Ptype;

/**
* 类描述：
* @version:1.0
* @author:任世豪
* @创建时间:2019年10月31日 下午3:37:44
*/
public interface ProductService {
	/**
	 * 展示所有商品信息
	 * @param proName 商品名称
	 * @param proType 商品类别
	 * @param cutpage 显示第几页
	 * @param pagecount 一页显示多少条数据
	 * @return
	 */
	List<Product>getAll(String proName,int proType,int cutpage,int pagecount);
	/**
	 * 获取产品种类的集合
	 * @return
	 */
	List<Ptype>getAll();
	/**
	 * 获取商品数量
	 * @param proName 商品名称
	 * @param proType 商品类别
	 * @return
	 */
	int getCount(String proName,int proType);
	/**
	 * 添加商品信息
	 * @param p 商品对象
	 * @return
	 */
	int add(Product p);
	/**
	 * 删除商品信息
	 * @param proId 商品编号
	 * @return
	 */
	int delete(int proId);
	/**
	 * 修改商品信息
	 * @param p 修改后的商品对象
	 * @return
	 */
	int update(Product p);
	/**
	 * 通过商品编号查找商品信息
	 * @param proId 商品编号
	 * @return
	 */
	Product getOne(int proId);
	
}
