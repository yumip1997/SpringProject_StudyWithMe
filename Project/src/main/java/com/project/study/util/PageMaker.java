package com.project.study.util;

public class PageMaker {
	
	private int displayPageNum =10;
	private PageVO pageVO;
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	public void setPageVO(PageVO pageVO) {
		this.pageVO = pageVO;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	private void calcData() {
		endPage = (int) (Math.ceil(pageVO.getPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage -displayPageNum) +1;
		
		int tempEndPage = (int) (Math.ceil(totalCount / (double) pageVO.getPerPageNum()));
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage * pageVO.getPerPageNum() >= totalCount ? false : true;
	}

}
