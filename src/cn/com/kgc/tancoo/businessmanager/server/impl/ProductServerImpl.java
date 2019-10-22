package cn.com.kgc.tancoo.businessmanager.server.impl;

import java.util.List;

import cn.com.kgc.tancoo.businessmanager.dao.ProductDao;
import cn.com.kgc.tancoo.businessmanager.dao.impl.ProductDaoImpl;
import cn.com.kgc.tancoo.businessmanager.entity.Product;
import cn.com.kgc.tancoo.businessmanager.server.ProductServer;

public class ProductServerImpl implements ProductServer {
	ProductDao pd = new ProductDaoImpl();
	@Override
	public List<Product> getAll(String name, int pageindex, int pagecount) {
		return pd.getAll(name, pageindex, pagecount);
	}
	@Override
	public int add(Product pdo) {
		return pd.add(pdo);
	}
	@Override
	public int delete(int id) {
		return pd.delete(id);
	}
	@Override
	public int update(Product pro) {
		return pd.update(pro);
	}
	@Override
	public int getCount(String name) {
		return pd.getCount(name);
	}
	@Override
	public List<Product> getAllByType(String name, int pageindex, int pagecount) {
		return pd.getAllByType(name, pageindex, pagecount);
	}
	@Override
	public Product getById(int id) {
		return pd.getById(id);
	}
	
}
