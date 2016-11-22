package com.exp.question.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.exp.entity.Question;
import com.framework.BaseDao;
import com.framework.Page;

@Repository
public class QuestionDaoImpl extends BaseDao<Question, Integer> {

	/**
	 * @author zhang zhao lin
	 * @return 查询首页中的问答推荐信息 按照点赞人数和时间排
	 */
	public List<Question> findQuestionRecommend() {
		Session session = super.getSession();
		Query query = session.createQuery("from Question order by questionPublishTime DESC,questionLikeNum DESC");
		return query.list();
	}

	/**
	 * @author zhang zhao lin
	 * @param currentPageNum
	 *            当前是第几页
	 * @param pageSize
	 *            每一页有多少条数据
	 * @return 简单的罗列出技术问答中的数据---最新发布
	 */
	public Page<Question> findQuestion_theNew(Integer currentPageNum, Integer pageSize) {
		String hql = "from Question order by questionPublishTime DESC";

		Page<Question> page = new Page<Question>();
		try {
			page = super.findByPage(currentPageNum, pageSize, hql, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return page;
		// return "";
	}
}
