package cn.com.kgc.tancoo.businessmanager.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private int userId;//编号
	private String userName;//用户名
	private String userPwd;//密码
	private String userAddr;//地址
	private String userPhone;//电话号码
	private String userTruename;//真实姓名
	private String userSex;//性别
	private String userBirthday;//出生年月
	private Date userRegtime;//注册时间
	private int userType;//用户身份（买家3，卖家4）
	private int userStatus;//登陆状态 默认0正常1禁用
	private String userStatu;//用户身份具体名字

}
