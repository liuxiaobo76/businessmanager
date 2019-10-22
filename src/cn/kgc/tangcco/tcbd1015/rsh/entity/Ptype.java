package cn.kgc.tangcco.tcbd1015.rsh.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
* 类描述：
* @version:1.0
* @author:任世豪
* @创建时间:2019年10月31日 上午9:05:16
*/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ptype {
	/**
	 * 产品类型id
	 */
	private int ptypeId;
	/**
	 * 产品类型名称
	 */
	private String ptypeName;
}
