package cn.com.kgc.tancoo.businessmanager.server.impl;

import java.util.List;

import cn.com.kgc.tancoo.businessmanager.dao.impl.CommentDaoImpl;
import cn.com.kgc.tancoo.businessmanager.entity.Comment;
import cn.com.kgc.tancoo.businessmanager.server.CommentServer;

public class CommentServerImpl implements CommentServer{
	CommentDaoImpl cdi = new CommentDaoImpl();
	@Override
	public List<Comment> getAll() {
		return cdi.getAll();
	}

	@Override
	public int add(Comment com) {
		return cdi.add(com);
	}

	@Override
	public int delete(int id) {
		return cdi.delete(id);
	}

	@Override
	public int update(Comment ad) {
		return cdi.update(ad);
	}

}
