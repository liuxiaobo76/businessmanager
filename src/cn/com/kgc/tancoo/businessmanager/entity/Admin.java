package cn.com.kgc.tancoo.businessmanager.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
	private int adminId;
	private String adminName;
	private String adminPwd;
	private int adminAuth;
	private String userStatus;
	public Admin(String adminName, String adminPwd, int adminAuth) {
		super();
		this.adminName = adminName;
		this.adminPwd = adminPwd;
		this.adminAuth = adminAuth;
	}
	
	
	
}
