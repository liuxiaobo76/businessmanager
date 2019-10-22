package cn.com.kgc.tancoo.businessmanager.server.impl;

import java.util.List;


import cn.com.kgc.tancoo.businessmanager.dao.AdminDao;
import cn.com.kgc.tancoo.businessmanager.dao.impl.AdminDaoImpl;
import cn.com.kgc.tancoo.businessmanager.entity.Admin;
import cn.com.kgc.tancoo.businessmanager.server.AdminServer;

public class AdminServerImpl implements AdminServer{
	AdminDao ad = new AdminDaoImpl();
	@Override
	public List<Admin> getAll() {
		return ad.getAll();
	}
	@Override
	public int add(Admin adm) {
		return ad.add(adm);
	}
	@Override
	public int delete(int id) {
		return ad.delete(id);
	}
	@Override
	public int update(Admin adm) {
		return ad.update(adm);
	}
	
}
