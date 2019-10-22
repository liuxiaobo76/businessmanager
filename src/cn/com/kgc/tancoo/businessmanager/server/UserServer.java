package cn.com.kgc.tancoo.businessmanager.server;

import java.util.List;

import cn.com.kgc.tancoo.businessmanager.entity.User;

public interface UserServer {
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

	
}
