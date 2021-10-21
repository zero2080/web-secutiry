package com.web.security.model;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class Member {
	private int id;
	private String memberId;
	private String memberPassword;
	private String createdAt;
	
	public Member() {
		
	}
	
	public Member(String memberId, String memberPassword) {
		this.memberId=memberId;
		this.memberPassword=memberPassword;
	}
	
	public int getId() {
		return id;
	}
	public String getMemberId() {
		return memberId;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setId(int id) {
		this.id=id;
	}
	public void setMemberId(String memberId) {
		this.memberId=memberId;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword=memberPassword;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt=createdAt;
	}
}
