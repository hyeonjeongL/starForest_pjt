package com.itwill.util;


public class PageMaker {
	private int pageBegin;  // #{start}
	private int pageEnd;    // #{end}
	/* 시작 페이지 */
	private int startPage;
	
	/* 끝 페이지 */
	private int endPage;
	
	/* 이전 페이지, 다음 페이지 존재유무 */
	private boolean prev, next;
	
	/*전체 게시물 수*/
	private int total;
	
	/* 현재 페이지, 페이지당 게시물 표시수 정보 */
	private Criteria cri;	
	
	/* 생성자 */
	public PageMaker(Criteria cri, int total) {
		
		this.cri = cri;
		this.total = total;
		
		/* 마지막 페이지 */
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		
		/* 시작 페이지 */
		this.startPage = this.endPage - 9;
		
		/* 전체 마지막 페이지 (=총페이지 수 계산)*/
		int realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount()));
		
		/* 전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정 */
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		/* 시작 페이지(startPage)값이 1보다 큰 경우 true */
		this.prev = this.startPage > 1;
		
		/* 마지막 페이지(endPage)값이 1보다 큰 경우 true */
		this.next = this.endPage < realEnd;
		
		
		
		 pageBegin = (cri.getPageNum()-1)*10+1;
	        // 끝번호 = 시작번호+페이지당 게시물수 -1
	     pageEnd = pageBegin+10-1;
		System.out.println("pageNum:"+cri.getPageNum());
		System.out.println("pageBegin:"+pageBegin);
		System.out.println("pageEnd:"+pageEnd);
	
	}
	
	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "PageMaker [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri=" + cri + "]";
	}

	
	
	


	
	
	
}