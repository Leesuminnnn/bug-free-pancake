package com.prjt.lsm.vo;

public class CriteriaBoard {

	
	private int page; 
	private int perPageNum; 
	
	private String keyword;
	private String type;
	private String member_id;
	
	
	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public CriteriaBoard() {

		this.page = 1; 
		this.perPageNum = 10;
        this.keyword = getKeyword();
        this.type = getType();
		
		return;

	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPageStart() {
		return (this.page - 1)  * perPageNum;  
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		
		if(page <=0) {
			this.page =1;
		}else {
			this.page=page;
		}
		
	
	}
	
	public int getPerPageNum() {
		
		return perPageNum;
	}
	
	public void setPerPageNum(int pageCount) {
		
		int cnt = this.perPageNum;
		
		if(pageCount != cnt) {
			this.perPageNum = cnt;
		}else {
			this.perPageNum = pageCount;
		}
		
	}

	@Override
	public String toString() {
		return "CriteriaBoard [page=" + page + ", perPageNum=" + perPageNum + ", keyword=" + keyword + ", type=" + type
				+ "]";
	}




	
	
	
	
	
}
