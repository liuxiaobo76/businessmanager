package cn.kgc.tangcco.tcbd1015.rsh.service.impl;

import java.util.List;

import cn.kgc.tangcco.tcbd1015.rsh.dao.impl.PtypeDaoImpl;
import cn.kgc.tangcco.tcbd1015.rsh.entity.Ptype;
import cn.kgc.tangcco.tcbd1015.rsh.service.PtypeService;

/**
* 类描述：
* @version:1.0
* @author:任世豪
* @创建时间:2019年10月31日 上午9:08:44
*/
public class PtypeServiceImpl implements PtypeService{
	PtypeDaoImpl pdi = new PtypeDaoImpl();
	@Override
	public List<Ptype> getAll() {
		return pdi.getAll();
	}
	@Override
	public int update(int ptypeId, String ptypeName) {
		return pdi.update(ptypeId, ptypeName);
	}
	@Override
	public Ptype query(int ptypeId) {
		return pdi.query(ptypeId);
	}
	@Override
	public int add(String ptypeName) {
		return pdi.add(ptypeName);
	}

}
