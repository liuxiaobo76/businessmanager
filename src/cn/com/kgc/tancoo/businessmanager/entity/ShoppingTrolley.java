package cn.com.kgc.tancoo.businessmanager.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShoppingTrolley {
	private int troId;
	private int proId;
	private int userId;
	private Date troTime;

}
