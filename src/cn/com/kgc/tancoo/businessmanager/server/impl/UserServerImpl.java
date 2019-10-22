package cn.com.kgc.tancoo.businessmanager.server.impl;

import java.util.List;

import cn.com.kgc.tancoo.businessmanager.dao.UserDao;
import cn.com.kgc.tancoo.businessmanager.dao.impl.UserDaoImpl;
import cn.com.kgc.tancoo.businessmanager.entity.User;
import cn.com.kgc.tancoo.businessmanager.server.UserServer;

public class UserServerImpl implements UserServer {
	UserDaoImpl udi = new UserDaoImpl();

	@Override
	public int yzUesr(String userName) {
		return udi.yzUesr(userName);
	}

	@Override
	public User login(String userName, String pwd) {
		return udi.login(userName, pwd);
	}

	@Override
	public int add(User account) {
		return udi.add(account);
	}

	@Override
	public List<User> getAll() {
		return udi.getAll();
	}

	@Override
	public int delete(int id) {
		return udi.delete(id);
	}

	@Override
	public int update(User user) {
		return udi.update(user);
	}

	@Override
	public int queryPhone(String phone) {
		return udi.queryPhone(phone);
	}
	
	@Override
	public List<User> getAll(String userName, int currentPage, int pageCount) {
		return udi.getAll(userName, currentPage, pageCount);
	}

	@Override
	public int getCount(String userName) {
		return udi.getCount(userName);
	}

	@Override
	public int deleteUser(int id) {
		return udi.deleteUser(id);
	}

	@Override
	public int addUser(User u) {
		return udi.addUser(u);
	}

	@Override
	public int checkUserName(String userName) {
		return udi.checkUserName(userName);
	}

	@Override
	public User queryUserById(int id) {
		return udi.queryUserById(id);
	}

	@Override
	public int updateUser(User u) {
		return udi.updateUser(u);
	}
	@Override
	public User userNameQreuery(String userName) {
		// TODO Auto-generated method stub
		return udi.userNameQreuery(userName);
	}


}
