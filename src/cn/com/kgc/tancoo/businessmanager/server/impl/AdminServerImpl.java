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
	@Override
	public Admin login(String adminName, String adminPwd) {
		return ad.login(adminName, adminPwd);
	}
	@Override
	public List<Admin> getAll(String adminName, int currentPage, int pageCount) {
		return ad.getAll(adminName, currentPage, pageCount);
	}
	@Override
	public int getCount(String adminName) {
		return ad.getCount(adminName);
	}
	@Override
	public int deleteAdmin(int id) {
		return ad.deleteAdmin(id);
	}
	@Override
	public int addAdmin(Admin a) {
		return ad.addAdmin(a);
	}
	@Override
	public int checkName(String Aname) {
		return ad.checkName(Aname);
	}
	@Override
	public Admin queryAdminById(int id) {
		return ad.queryAdminById(id);
	}
	@Override
	public int updateAdmin(Admin a) {
		return ad.updateAdmin(a);
	}
	
}
