package cn.com.kgc.tancoo.businessmanager.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import com.sun.javafx.fxml.BeanAdapter;

import cn.com.kgc.tancoo.businessmanager.dao.BaseDao;
import cn.com.kgc.tancoo.businessmanager.dao.UserDao;
import cn.com.kgc.tancoo.businessmanager.entity.User;

public class UserDaoImpl implements UserDao {

	QueryRunner qr = new QueryRunner(BaseDao.getDs());

	@Override
	public int yzUesr(String userName) {
		String sql = "select COUNT(*) from userinfo where  userName =?";
		try {
			return (int) (long) qr.query(sql, new ScalarHandler<Long>(), userName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		
		}
	}


	@Override
	public User login(String userName, String pwd) {
		String sql = "select * from userinfo  where  userName=? and userPwd=?";
		try {
			return qr.query(sql, new BeanHandler<>(User.class), userName, pwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	
	@Override
	public int add(User account) {
		
		String sql = "insert into userinfo values(null,?,?,?,?,?,?,?,NOW(),?,?)";
		try {																																							
			return qr.update(sql,account.getUserName(),account.getUserPwd(),account.getUserAddr(),account.getUserPhone(),account.getUserTruename(),account.getUserSex(),account.getUserBirthday(),account.getUserType(),account.getUserStatus());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}


	@Override
	public List<User> getAll() {
		String sql = "select userinfo.*,usertype.userStatus as userStatu from userinfo,usertype where userinfo.userType=usertype.id";
		try {
			return qr.query(sql, new BeanListHandler<>(User.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Test
	public void test1() {
		System.out.println(getAll());
	}

	@Override
	public int delete(int id) {
		String sql = "DELETE FROM userinfo WHERE userId =?";
		try {
			return qr.update(sql,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Test
	public void test2() {
		System.out.println(delete(5));
	}

	@Override
	public int update(User user) {
		String sql = "UPDATE userinfo SET userName=?,userPwd=?,userAddr=?,userPhone=?,userTruename=?,userSex=?,userBirthday=?,userRegtime=?,userType=?,userStatus=? WHERE userId=?";
		try {
			return qr.update(sql,user.getUserName(),user.getUserPwd(),user.getUserAddr(),user.getUserPhone(),user.getUserTruename(),user.getUserSex(),user.getUserBirthday(),user.getUserRegtime(),user.getUserType(),user.getUserStatus(),user.getUserId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Test
	public void test3() {
		System.out.println(update(new User(4,"哈哈","","","","","","s",new Date(),3,0,"")));
	}
<<<<<<< HEAD
	@Override
	public int queryPhone(String phone) {
		String sql="select COUNT(*) from userinfo where userPhone =?";
		try {
			return(int)(long)qr.query(sql, new ScalarHandler<Long>(),phone);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	public static void main(String[] args) {
		UserDaoImpl f=new UserDaoImpl();
		System.out.println(f.queryPhone("15700666666"));
	}



	@Override
	public List<User> getAll(String userName, int currentPage, int pageCount) {
		String sql="select ui.userId,ui.userName,ui.userAddr,ui.userPhone,ui.userTruename,ui.userSex,ui.userBirthday,ui.userRegtime,ut.userStatus as userStatu,ui.userStatus from userinfo ui,usertype ut where ui.userType=ut.id and 1=1";
		List<Object> list=new ArrayList<Object>();
		if(userName!=null) {
			sql+=" and userName like ?";
			list.add("%"+userName.trim()+"%");
		}
		sql+=" limit ?,?";
		list.add((currentPage-1)*pageCount);
		list.add(pageCount);
		try {
			return qr.query(sql, new BeanListHandler<>(User.class),list.toArray());
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public int getCount(String userName) {
		String sql="select count(*) from userinfo where 1=1";
		List<Object> list=new ArrayList<>();
		if(userName!=null) {
			sql+=" and userName like ?";
			list.add("%"+userName.trim()+"%");
		}
		try {
			return (int)(long)qr.query(sql, new ScalarHandler<Long>(),list.toArray());
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int deleteUser(int id) {
		String sql="delete from userinfo where userId=?";
		try {
			return qr.update(sql,id);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int addUser(User u) {
		String sql="insert into userinfo values (null,?,?,?,?,?,?,?,now(),?,?)";
		try {
			return qr.update(sql,u.getUserName(),u.getUserPwd(),u.getUserAddr(),u.getUserPhone(),u.getUserTruename(),u.getUserSex(),u.getUserBirthday(),u.getUserType(),u.getUserStatus());
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int checkUserName(String userName) {
		String sql="select count(*) from userinfo where userName=?";
		try {
			return (int)(long)qr.query(sql, new ScalarHandler<Long>(),userName);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	@Override
	public User queryUserById(int id) {
		String sql="select ui.userId,ui.userName,ui.userPwd,ui.userAddr,ui.userPhone,ui.userTruename,ui.userSex,ui.userBirthday,ui.userRegtime,ut.userStatus as userStatu,ui.userStatus,ui.userType from userinfo ui,usertype ut where ui.userType=ut.id and userId=?";
		try {
			return qr.query(sql, new BeanHandler<>(User.class),id);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public int updateUser(User u) {
		String sql="update userinfo set userName=?,userPwd=?,userAddr=?,userPhone=?,userTruename=?,userSex=?,userBirthday=?,userType=?,userStatus=? where userId=?";
		try {
			return qr.update(sql,u.getUserName(),u.getUserPwd(),u.getUserAddr(),u.getUserPhone(),u.getUserTruename(),u.getUserSex(),u.getUserBirthday(),u.getUserType(),u.getUserStatus(),u.getUserId());
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public User userNameQreuery(String userName) {
	String sql="select *from userinfo where userName =?";
 		try {
			return qr.query(sql,new BeanHandler<User>(User.class),userName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
=======
>>>>>>> 0687210869020c79e5144e895f192ac4bd75a808
}
