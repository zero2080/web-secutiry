package com.web.security.model;

import java.util.List;

public class Page<T extends PageNation> {
	private int pageNo;
	private int pageSize;
	private int totalCount;
	private int totalPageCount;
	
	private int startRow;
	private String memberId;
	
	private List<T> list;
	
	public int getPageNo() {
		return pageNo;
	}
	
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		this.totalPageCount = (int)Math.round(Math.ceil((float)totalCount/pageSize));
		this.startRow = (this.pageNo-1)*this.pageSize;
	}
	public int getStartRow() {
		return startRow;
	}
	
	public int getTotalPageCount() {
		return totalPageCount;
	}
	
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
	public void setMemberId(String memberId) {
		this.memberId=memberId;
	}
	public String getMemberId() {
		return memberId;
	}
	
}
