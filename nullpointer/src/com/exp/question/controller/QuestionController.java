package com.exp.question.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exp.entity.Question;
import com.exp.question.service.QuestionServiceImpl;
import com.framework.Page;

@Controller
@RequestMapping("question")
public class QuestionController {
	@Resource
	private QuestionServiceImpl questionserviceimpl;
	// 设置每页有5条数据
	private Integer pageSize = 5;

	/**
	 * @author zhang zhao lin
	 * @param currentPageNum
	 *            当前页 默认值为第一页
	 * @return list列表 _最新发布 没有查询功能！！
	 */
	@RequestMapping("list_new")
	public String questionList_theNew(@RequestParam(name = "currentPageNum", defaultValue = "1") Integer currentPageNum,
			HttpSession session) {
		Page<Question> page = new Page<Question>();
		page = questionserviceimpl.findQuestion_theNew(currentPageNum, pageSize);
		session.setAttribute("questionPage_theNew", page);
		return "q_a_list";
	}
}
