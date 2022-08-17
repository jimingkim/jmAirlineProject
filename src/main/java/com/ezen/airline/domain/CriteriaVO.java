package com.ezen.airline.domain;

import lombok.Data;

@Data
public class CriteriaVO {

	private int pageNum;
	private int amount;
	private String keyword;

	public CriteriaVO() {
		this(1, 10);
	}

	public CriteriaVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private CriteriaVO cri;

	public CriteriaVO(CriteriaVO cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil(total * 1.0 / cri.getAmount()));
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}

} // end public class CriteriaVO
