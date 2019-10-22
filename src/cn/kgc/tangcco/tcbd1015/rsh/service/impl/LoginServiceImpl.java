package cn.kgc.tangcco.tcbd1015.rsh.service.impl;


import cn.kgc.tangcco.tcbd1015.rsh.dao.impl.LoginDaoImpl;
import cn.kgc.tangcco.tcbd1015.rsh.entity.User;
import cn.kgc.tangcco.tcbd1015.rsh.service.LoginService;

/**
* 类描述：
* @version:1.0
* @author:任世豪
* @创建时间:2019年10月23日  15:16:12
*/
public class LoginServiceImpl implements LoginService{
	LoginDaoImpl ldi = new LoginDaoImpl();

	@Override
	public User login(String userName, String userPwd) {
		return ldi.login(userName, userPwd);
	}

	/*@Test
	public void test() {
		System.out.println(login("admin", "12356"));
	}*/
}
