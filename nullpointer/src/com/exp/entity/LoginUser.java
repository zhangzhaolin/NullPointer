package com.exp.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="loginuser")
public class LoginUser {
	private Integer loginUserId;
	private String loginName;//用户名
	private String loginEmail;//用户注册邮箱
	private String loginPassword;//用户密码
	private Role role;
	private UserInfo userInfo;
	private Integer loginActive;

	public Integer getLoginActive() {
		return loginActive;
	}
	public void setLoginActive(Integer loginActive) {
		this.loginActive = loginActive;
	}
	@Id
//	@GeneratedValue(generator = "system_uuid")
//	@GenericGenerator(name = "system_uuid", strategy = "uuid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getLoginUserId() {
		return loginUserId;
	}
	public void setLoginUserId(Integer loginUserId) {
		this.loginUserId = loginUserId;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getLoginEmail() {
		return loginEmail;
	}
	public void setLoginEmail(String loginEmail) {
		this.loginEmail = loginEmail;
	}
	public String getLoginPassword() {
		return loginPassword;
	}
	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}
	@ManyToOne
	@JoinColumn(name = "roleId")
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER) // fetch���ü�������
	@PrimaryKeyJoinColumn
	public UserInfo getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
	

}
