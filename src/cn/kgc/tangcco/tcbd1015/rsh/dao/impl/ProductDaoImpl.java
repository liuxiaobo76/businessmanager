package cn.kgc.tangcco.tcbd1015.rsh.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.kgc.tangcco.tcbd1015.rsh.dao.BaseDao;
import cn.kgc.tangcco.tcbd1015.rsh.dao.ProductDao;
import cn.kgc.tangcco.tcbd1015.rsh.entity.Product;
import cn.kgc.tangcco.tcbd1015.rsh.entity.Ptype;

/**
* 类描述：
* @version:1.0
* @author:任世豪
* @创建时间:2019年10月31日 下午3:37:13
*/
public class ProductDaoImpl implements ProductDao{
	QueryRunner qr = new QueryRunner(BaseDao.getDs());
	@Override
	public List<Product> getAll(String proName, int proType, int cutpage, int pagecount) {
		if(proName==null) {
			proName="";
		}
		try {
			if(proType==0) {
				String sql = "select *from product p,producttype pt where pt.ptypeId=p.proType and p.proName like ? limit ?,?";
				return qr.query(sql, new BeanListHandler<>(Product.class),"%"+proName+"%",(cutpage-1)*pagecount,pagecount);
			}else {
				String sql = "select *from product p,producttype pt where pt.ptypeId=p.proType and p.proName like ? and proType=? limit ?,?";
				return qr.query(sql, new BeanListHandler<>(Product.class),"%"+proName+"%",proType,(cutpage-1)*pagecount,pagecount);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public List<Ptype> getAll() {
		String sql = "SELECT *FROM producttype";
		try {
			return qr.query(sql, new BeanListHandler<>(Ptype.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public int getCount(String proName,int proType) {
		if(proName==null) {
			proName="";
		}
		try {
			if(proType==0) {
				String sql = "select count(*) from product where proName like ?";
				return (int)(long)qr.query(sql, new ScalarHandler<Long>(),"%"+proName+"%");
			}else {
				String sql = "select count(*) from product where proName like ? and proType=?";
				return (int)(long)qr.query(sql, new ScalarHandler<Long>(),"%"+proName+"%",proType);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int add(Product p) {
		String sql = "insert into product values(null,?,?,?,?,?,?,null)";
		try {
			return qr.update(sql,p.getProName(),p.getProType(),p.getProDescription(),p.getProSimg(),p.getProBimg(),p.getProPrice());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int delete(int proId) {
		String sql = "delete from product where proId=?";
		try {
			return qr.update(sql,proId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int update(Product p) {
		String sql = "update product set proName=?,proType=?,proDescription=?,proSimg=?,proBimg=?,proPrice=? where proId=?";
		try {
			return qr.update(sql,p.getProName(),p.getProType(),p.getProDescription(),p.getProSimg(),p.getProBimg(),p.getProPrice(),p.getProId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public Product getOne(int proId) {
		String sql = "select *from product where proId=?";
		try {
			return qr.query(sql, new BeanHandler<>(Product.class),proId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
