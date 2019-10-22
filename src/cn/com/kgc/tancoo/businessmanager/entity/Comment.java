package cn.com.kgc.tancoo.businessmanager.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
	private int comId;
	private String comName;
	private int userId;
	private String comTitle;
	private String comContent;
	private Date comTime;
	private double comScore;

}
