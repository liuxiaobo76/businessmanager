package cn.com.kgc.tancoo.businessmanager.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import cn.com.kgc.tancoo.businessmanager.dao.BaseDao;
import cn.com.kgc.tancoo.businessmanager.dao.ProductDao;
import cn.com.kgc.tancoo.businessmanager.entity.Product;

public class ProductDaoImpl implements ProductDao {
	QueryRunner qr = new QueryRunner(BaseDao.getDs());
	@Override
	public List<Product> getAll(String name, int pageindex, int pagecount) {
		if(name == null) {
			name = "";
		}
		name = name.trim();
		String sql = "select proId,proName,proType,proDescription,proSimg,proBimg,proPrice,proParam,ptypeName from product,productType where ptypeId=proType and proName like ? limit ?,?";
		try {
			return qr.query(sql, new BeanListHandler<>(Product.class),"%"+name+"%",(pageindex-1)*pagecount,pagecount);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	@Test
	public void tdddd() {
		System.out.println(getAll("华", 1, 2));
	}
	@Override
	public int add(Product pd) {
		String sql = "INSERT INTO product VALUES(null,?,?,?,?,?,?,?)";
		try {
			return qr.update(sql,pd.getProName(),pd.getProType(),pd.getProDescription(),pd.getProSimg(),pd.getProBimg(),pd.getProPrice(),pd.getProParam());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	/*
	 * @Test public void testt() { System.out.println(Add (new Product(7, "苹果笔记本电脑",
	 * 6, "这个是一个好电脑", null, null, 888.88, "大小：19寸,颜色：银色,重量：1.5kg", ""))) ;
	 * 
	 * }
	 */
	@Override
	public int delete(int id) {
		String sql = "DELETE FROM product WHERE proId = ?;";
		try {
			return qr.update(sql,id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	/*
	 * @Test public void testtt() { System.out.println(Delete(8)); }
	 */
	@Override
	public int update(Product pro) {
		String sql = "UPDATE product SET proName=?,proType=?,proDescription=?,proSimg=?,proBimg=?,proPrice=?,proParam=? WHERE proId=?;";
		try {
			return qr.update(sql,pro.getProName(), pro.getProType(),pro.getProDescription(),pro.getProSimg(),pro.getProBimg(),pro.getProPrice(),pro.getProParam(),pro.getProId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	/*
	 * @Test public void ss() { System.out.println(Update(new
	 * Product(9,"呼呼",6,"喜喜",null,"",999,"dsafd",null))); }
	 */
	@Override
	public int getCount(String name) {
		if(name ==null) {
			name="";
		}
		name = name.trim();
		String sql = "select count(*) from product where proName like ?";
		try {
			return (int)(long)qr.query(sql, new ScalarHandler<Long>(),"%"+name+"%");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Test
	public void test05() {
		System.out.println(getCount("华"));
	}
	@Override
	public List<Product> getAllByType(String name, int pageindex, int pagecount) {
		if(name == null) {
			name = "";
		}
		name = name.trim();
		String sql = "select proId,proName,proType,proDescription,proSimg,proBimg,proPrice,proParam,ptypeName from product,productType where ptypeId=proType and ptypeName like ? limit ?,?";
		try {
			return qr.query(sql, new BeanListHandler<>(Product.class),"%"+name+"%",(pageindex-1)*pagecount,pagecount);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	@Test
	public void tddddd() {
		System.out.println(getAll("华为", 1, 5));
	}
	@Override
	public Product getById(int id) {
		String sql = "select proId,proName,proType,proDescription,proSimg,proBimg,proPrice,proParam,ptypeName from product,productType where ptypeId=proType and proId = ?";
		try {
			return qr.query(sql, new BeanHandler<>(Product.class),id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Test
	public void test5() {
		System.out.println(getById(6));
	}
}
