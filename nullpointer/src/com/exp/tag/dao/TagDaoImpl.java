package com.exp.tag.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.exp.entity.Question;
import com.exp.entity.Tag;
import com.framework.BaseDao;

@Repository
public class TagDaoImpl extends BaseDao<Tag, String> {

	/**
	 * 查询所有标签信息
	 * @zhangzhaolin
	 * @return
	 */
	public List<Tag> findAllTag() {
		Session session = super.getSession();
		Query query = session.createQuery("from Tag");
		return query.list();
	}
}
