package com.itwill.domain;
import java.util.*;

import org.springframework.stereotype.Component;

import com.itwill.util.PageMaker;
@Component
public class RequestBoardListPageMaker extends PageMaker{
	public List<RequestBoard> itemList;
	public PageMaker pageMaker;
	public int totRecordCount;
	
	public List<RequestBoard> getItemList() {
		return itemList;
	}
	public void setItemList(List<RequestBoard> itemList) {
		this.itemList = itemList;
	}
	


}
