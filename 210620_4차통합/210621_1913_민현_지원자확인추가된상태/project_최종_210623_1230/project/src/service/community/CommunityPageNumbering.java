package service.community;

public class CommunityPageNumbering {
	
	private int totCnt;
	private int pageNum;
	private int pageSize;
	private int currentPage;
	private int startNum;
	private int list;
	private int blockSize;
	private int pageCnt;
	private int startRow;
	private int endRow;
	private int startPage;
	private int endPage;
	
	public CommunityPageNumbering(int totCnt, int pageNum, int pageSize){
		this.totCnt = totCnt;
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.currentPage = pageNum;
		this.startRow = (currentPage - 1) * pageSize + 1;
		this.endRow = startRow + pageSize - 1;
		this.pageCnt = (int) Math.ceil((double) totCnt / pageSize);
		
		// page index
		if (currentPage < 3) {
			startPage = 1;
			endPage = 5;
		} else {
			startPage = currentPage - 2;
			endPage = currentPage + 2;
		}
		if (endPage > pageCnt) {
			startPage -= endPage - pageCnt;
			endPage = pageCnt;
		}
		if (startPage < 1) {
			startPage = 1;
		}
	}
	
	
	//getter
	public int getTotCnt() {
		return totCnt;
	}

	public int getPageNum() {
		return pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getStartNum() {
		return startNum;
	}

	public int getList() {
		return list;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}


}
