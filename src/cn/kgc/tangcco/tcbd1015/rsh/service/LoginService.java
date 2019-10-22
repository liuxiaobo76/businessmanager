package cn.kgc.tangcco.tcbd1015.rsh.service;

import cn.kgc.tangcco.tcbd1015.rsh.entity.User;

/**
* 类描述:
* @version:1.0
* @author:任世豪
* @创建时间:2019年10月23日  15:15:52
*/
public interface LoginService {
	/**
	 * 登录方法
	 * @param userName 用户姓名
	 * @param userPwd 密码
	 * @return
	 */
	User login(String userName,String userPwd);
}
