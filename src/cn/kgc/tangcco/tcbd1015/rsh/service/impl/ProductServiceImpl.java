package cn.kgc.tangcco.tcbd1015.rsh.service.impl;

import java.util.List;

import cn.kgc.tangcco.tcbd1015.rsh.dao.impl.ProductDaoImpl;
import cn.kgc.tangcco.tcbd1015.rsh.entity.Product;
import cn.kgc.tangcco.tcbd1015.rsh.entity.Ptype;
import cn.kgc.tangcco.tcbd1015.rsh.service.ProductService;

/**
* 类描述：
* @version:1.0
* @author:任世豪
* @创建时间:2019年10月31日 下午3:38:01
*/
public class ProductServiceImpl implements ProductService{
	ProductDaoImpl pdi = new ProductDaoImpl();
	
	@Override
	public List<Product> getAll(String proName, int proType, int cutpage, int pagecount) {
		return pdi.getAll(proName, proType, cutpage, pagecount);
	}

	@Override
	public List<Ptype> getAll() {
		return pdi.getAll();
	}

	@Override
	public int getCount(String proName,int proType) {
		return pdi.getCount(proName,proType);
	}

	@Override
	public int add(Product p) {
		return pdi.add(p);
	}

	@Override
	public int delete(int proId) {
		return pdi.delete(proId);
	}

	@Override
	public int update(Product p) {
		return pdi.update(p);
	}

	@Override
	public Product getOne(int proId) {
		return pdi.getOne(proId);
	}
	
	
}
