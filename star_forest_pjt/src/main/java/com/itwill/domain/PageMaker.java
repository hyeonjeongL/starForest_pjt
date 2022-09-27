package com.itwill.domain;

public class PageMaker {
		//공부중..... 공부중....... 공부중......
	    // 페이지당 게시물 수
	    public static final int PAGE_SCALE = 10;
	    // 화면당 페이지 수
	    public static final int BLOCK_SCALE = 5;
	     
	    private int curPage;    // 현재 페이지  [2]
	    
	    private int prevPage;   // 이전 페이지 [1]
	    private int nextPage;   // 다음 페이지 [3]
	    
	    private int prevGroupStartPage;   // 이전 그룹시작페이지  --> [1]??
	    private int nextGroupStartPage;   // 다음 그룹시작페이지  --> [6]??
	    
	    
	    private int totPage;    // 전체 페이지 갯수  --> [1]~?   맞?
	    private int totBlock;   // 전체 페이지 블록 갯수 --> [1]-[5] 요게 1개로 쳐서 곱하기 블록 갯수 맞?
	    private int curBlock;   // 현재 페이지 블록  --> [6]-[10] ?
	    private int prevBlock;  // 이전 페이지 블록  --> [1]-[5] ?
	    private int nextBlock;  // 다음 페이지 블록  --> [11]-[15] ?
	     
	    // WHERE rn BETWEEN #{start} AND #{end}
	    private int pageBegin;  // #{start}    ??
	    private int pageEnd;    // #{end}      ??
	    // [이전] blockBegin -> 41 42 43 44 45 46 47 48 49 50 [다음]
	    private int blockBegin; // 현재 페이지 블록의 시작번호   --> 그럼 이게 51 ?
	    // [이전] 41 42 43 44 45 46 47 48 49 50 <- blockEnd [다음]
	    private int blockEnd;   // 현재 페이지 블록의 끝번호  --> 55?
	    
	    
	   //오 다 이해됐는데 System.out.println("13.DB에서select할게시물시작번호 :"+pageBegin);
		//System.out.println("14.DB에서select할게시물끝번호   :"+pageEnd); 이것만 물어보기!
	     
}