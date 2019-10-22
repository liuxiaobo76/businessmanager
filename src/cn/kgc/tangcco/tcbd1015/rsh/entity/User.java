package cn.kgc.tangcco.tcbd1015.rsh.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
* 类描述：用户实体类
* @version:1.0
* @author:任世豪
* @创建时间:2019年10月23日  14:20:23
*/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	/**
	 * 用户编号
	 */
	private int userId;
	/**
	 * 用户名称
	 */
	private String userName;
	/**
	 * 密码
	 */
	private String userPwd;
	/**
	 * 用户地址ַ
	 */
	private String userAddr;
	/**
	 * 手机号
	 */
	private String userphone;
	/**
	 * 用户真实姓名
	 */
	private String userTruename;
	/**
	 * 用户性别
	 */
	private String userSex;
	/**
	 * 用户生日
	 */
	private String userBirthday;
	/**
	 * 用户注册时间
	 */
	private String userregtime;
	/**
	 * 用户分类
	 */
	private int userType;
	/**
	 * 用户状态״̬
	 */
	private int userStatus;
}
