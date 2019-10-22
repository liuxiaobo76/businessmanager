package cn.com.kgc.tancoo.businessmanager.dao;

import java.util.List;

import cn.com.kgc.tancoo.businessmanager.entity.Comment;

public interface CommentDao {
	/**
	 * 获得所有评价表
	 * @return 
	 */
	List<Comment> getAll();
	/**
	 * 添加新的评价表
	 * @param ad 要添加的评价表
	 * @return 返回0添加失败
	 */
	int add(Comment com);
	/**
	 * 删除评价表
	 * @param id 要删除的评价表的编号
	 * @return
	 */
	int delete(int id);
	/**
	 * 修改评价表
	 * @param id 要修改的评价表的编号
	 * @return
	 */
	int update(Comment ad);
}
