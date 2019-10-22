package cn.kgc.tangcco.tcbd1015.rsh.dao;
/**
* 类描述：
* @version:1.0
* @author:任世豪
* @创建时间:2019年10月23日 14:58:25
*/
import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import lombok.Getter;

public class BaseDao {
	@Getter
	private static DataSource ds = new ComboPooledDataSource();
}
