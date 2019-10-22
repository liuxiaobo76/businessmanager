package cn.kgc.tangcco.tcbd1015.rsh.dao;

import java.util.List;

import cn.kgc.tangcco.tcbd1015.rsh.entity.Ptype;

/**
* 类描述：
* @version:1.0
* @author:任世豪
* @创建时间:2019年10月31日 上午9:07:54
*/
public interface PtypeDao {
	/**
	 * 获取产品种类的集合
	 * @return
	 */
	List<Ptype>getAll();
	/**
	 * 修改分类
	 * @param ptypeId 分类编号
	 * @param ptypeName 分类名称
	 * @return
	 */
	int update(int ptypeId,String ptypeName);
	/**
	 * 查找类型对象
	 * @param ptypeId 类型id
	 * @return
	 */
	Ptype query(int ptypeId);
	/**
	 * 增加分类
	 * @param ptypeName 分类名称
	 * @return
	 */
	int add(String ptypeName);
}
