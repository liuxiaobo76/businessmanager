package cn.com.kgc.tancoo.businessmanager.server;

import java.util.List;

import cn.com.kgc.tancoo.businessmanager.entity.Product;

public interface ProductServer {
	/**
	 * 模糊查询加分页
	 * @param name 要查找的商品的名称
	 * @param pageindex 第几页
	 * @param pagecount 每页几条数据
	 * @return 返回找到的商品的数据集合
	 */
	List<Product> getAll(String name ,int pageindex,int pagecount);
	/**
	 * 添加商品
	 * @param pd 要添加的商品
	 * @return
	 */
	int add(Product pd);
	/**
	 * 根据编号删除商品
	 * @param id 要删除的商品编号
	 * @return
	 */
	int delete(int id);
	/**
	 * 修改商品
	 * @param pro 要修改的商品
	 * @return
	 */
	int update(Product pro);
	/**
	 * 根据商品找到相应的商品的总数
	 * @param name 商品的名字
	 * @return
	 */
	int getCount(String name);
	/**
	 * 根据商品找到相应的商品的总数
	 * @param name 商品的类型
	 * @return
	 */
	List<Product> getAllByType(String name,int pageindex,int pagecount);
	/**
	 * 根据编号查找id
	 * @param id 要查找的商品id
	 * @return
	 */
	Product getById(int id);
}
