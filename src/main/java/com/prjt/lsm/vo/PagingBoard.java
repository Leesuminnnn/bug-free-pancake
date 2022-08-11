package com.prjt.lsm.vo;

public class PagingBoard {

	
	private int totalCount; 
	private int displayPageNum = 10; 
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int firstPage;
	private int lastPage;
	private CriteriaBoard cri;

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		
		this.totalCount = totalCount;
		
		pagingData();
		
	}
	
	private void pagingData() {
		
		endPage = (int)(Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		
		startPage = (endPage-displayPageNum) +1;
		if(startPage <=0) startPage = 1;
		
		int tempEndPage = (int)(Math.ceil(totalCount/(double) cri.getPerPageNum()));
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage ==1?false:true;
		
		next = endPage * cri.getPerPageNum() >= totalCount ?false:true;
		}
	
	public void calcLastPage(int totalCount, int PerPageNum) {
		setLastPage((int) Math.ceil((double)totalCount / (double)PerPageNum));
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public CriteriaBoard getCri() {
		return cri;
	}

	public void setCri(CriteriaBoard cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "Paging [totalCount=" + totalCount + ", displayPageNum=" + displayPageNum + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", cri=" + cri + "]";
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
