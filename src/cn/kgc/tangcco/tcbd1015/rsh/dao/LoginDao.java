package cn.kgc.tangcco.tcbd1015.rsh.dao;

import cn.kgc.tangcco.tcbd1015.rsh.entity.User;
/**
* 类描述：
* @version:1.0
* @author:任世豪
* @创建时间:2019年10月23日 15:04:19
*/
public interface LoginDao {
	/**
	 * 用户登录
	 * @param userName 用户名
	 * @param userPwd 密码
	 * @return
	 */
	User login(String userName,String userPwd);
}
