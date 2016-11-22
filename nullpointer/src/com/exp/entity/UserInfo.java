package com.exp.entity;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.swing.plaf.synth.SynthSpinnerUI;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
@Entity
@Table(name="userinfo")
public class UserInfo {

	//属性
	private Integer userInfoId;
	private Date userInfoBirthday;//用户生日
	private String userInfoHeadPortrait;//用户头像
	private String userInfoSex;//用户性别
	private Date userInfoRegistTime;//用户注册时间
	private String userInfoDescribe;//用户描述
	private Integer userInfoHonorCount;//荣誉值
	private LoginUser loginUser;
	private Set<Bug> bugs=new HashSet<Bug>(0);
	private Set<Question> questions=new HashSet<Question>(0);
	private Set<Comment> comments=new HashSet<Comment>(0);
	private Set<Answer> answers=new HashSet<Answer>(0);
	private Set<Tag> tags=new HashSet<Tag>(0);
	@Id
	@GenericGenerator(name = "foreignkey", strategy = "foreign", parameters = @Parameter(value = "loginUser", name = "property") )
	@GeneratedValue(generator = "foreignkey")
	public Integer getUserInfoId() {
		return userInfoId;
	}
	public void setUserInfoId(Integer userInfoId) {
		this.userInfoId = userInfoId;
	}
	public Date getUserInfoBirthday() {
		return userInfoBirthday;
	}
	public void setUserInfoBirthday(Date userInfoBirthday) {
		this.userInfoBirthday = userInfoBirthday;
	}
	public String getUserInfoHeadPortrait() {
		return userInfoHeadPortrait;
	}
	public void setUserInfoHeadPortrait(String userInfoHeadPortrait) {
		this.userInfoHeadPortrait = userInfoHeadPortrait;
	}
	public String getUserInfoSex() {
		return userInfoSex;
	}
	public void setUserInfoSex(String userInfoSex) {
		this.userInfoSex = userInfoSex;
	}
	public Date getUserInfoRegistTime() {
		return userInfoRegistTime;
	}
	public void setUserInfoRegistTime(Date userInfoRegistTime) {
		this.userInfoRegistTime = userInfoRegistTime;
	}
	public String getUserInfoDescribe() {
		return userInfoDescribe;
	}
	public void setUserInfoDescribe(String userInfoDescribe) {
		this.userInfoDescribe = userInfoDescribe;
	}
	

	public Integer getUserInfoHonorCount() {
		return userInfoHonorCount;
	}
	public void setUserInfoHonorCount(Integer userInfoHonorCount) {
		this.userInfoHonorCount = userInfoHonorCount;
	}
	@OneToOne
	@PrimaryKeyJoinColumn
	public LoginUser getLoginUser() {
		return loginUser;
	}
	public void setLoginUser(LoginUser loginUser) {
		this.loginUser = loginUser;
	}
	@OneToMany(mappedBy="userInfo")
	public Set<Bug> getBugs() {
		return bugs;
	}
	public void setBugs(Set<Bug> bugs) {
		this.bugs = bugs;
	}
	@OneToMany(mappedBy="userInfo")
	public Set<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
	}
	@OneToMany(mappedBy="userInfo")
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	@OneToMany(mappedBy="userInfo")
	public Set<Answer> getAnswers() {
		return answers;
	}
	public void setAnswers(Set<Answer> answers) {
		this.answers = answers;
	}
	@ManyToMany(cascade = CascadeType.PERSIST)
	@JoinTable(name = "r_tag_userinfo", joinColumns = {
			@JoinColumn(name = "userInfoId", referencedColumnName = "userInfoId") }, inverseJoinColumns = {
					@JoinColumn(name = "tagId", referencedColumnName = "tagId") })
	public Set<Tag> getTags() {
		return tags;
	}
	public void setTags(Set<Tag> tags) {
		this.tags = tags;
	}
	
	
}
