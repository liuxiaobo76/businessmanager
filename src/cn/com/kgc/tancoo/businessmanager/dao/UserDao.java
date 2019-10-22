package cn.com.kgc.tancoo.businessmanager.dao;

import java.util.List;

import cn.com.kgc.tancoo.businessmanager.entity.User;

public interface UserDao {
	/**
	 * 验证用户
	 * @param userName 要验证的用户
	 * @return
	 */
	public int yzUesr(String userName);
	/**
	 * 登陆
	 * @param userName 要登陆的账号
	 * @param pwd 密码
	 * @return
	 */
	public User login(String userName, String pwd);
	/**
	 * 添加
	 * @param account 要添加的账号
	 * @return
	 */
	public int add(User account);
	/**
	 * 获取所有用户
	 * @return
	 */
	public List<User> getAll();
	/**
	 * 删除
	 * @param id 要删除的id
	 * @return
	 */
	public int delete(int id);
	/**
	 * 修改用户
	 * @param id 要修改的编号
	 * @return
	 */
	int update (User user);
	 /**
	   * 验证手机号
	 */
	List<User> getAll(String userName,int currentPage,int pageCount);
	int getCount(String userName);
	int deleteUser(int id);
	int addUser(User u);
	int checkUserName(String userName);
	User queryUserById(int id);
	int updateUser(User u);
	int queryPhone(String phone);
		
	/**
	 * 用户密码忘记工具查找
	 * 
	 * @param userName
	 * @return
	 */
	public User userNameQreuery(String userName);
	
}
