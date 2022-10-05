package com.itwill.util;

import java.util.List;

import com.itwill.util.PageMaker2;

public class PageMakerDto<E> {
	public List<E> itemList;
	public PageMaker2 pageMaker2;
	public int totRecordCount;

	public PageMakerDto() {
	}

	public PageMakerDto(List<E> itemList, PageMaker2 pageMaker2, int totRecordCount) {
		super();
		this.itemList = itemList;
		this.pageMaker2 = pageMaker2;
		this.totRecordCount = totRecordCount;
	}

}
