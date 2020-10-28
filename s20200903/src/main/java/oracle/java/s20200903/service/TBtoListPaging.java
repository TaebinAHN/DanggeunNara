package oracle.java.s20200903.service;
public class TBtoListPaging {
	private int currentPage = 1;	private int rowPage   = 3;
	private int pageBlock = 5;		
	private int start;		private int end;
	private int startPage;	private int endPage;
	private int total;		private int totalPage;
	
	public TBtoListPaging(int total, String currentPage1) {
		this.total = total;
		if (currentPage1 != null) {
			this.currentPage = Integer.parseInt(currentPage1);			
		}
		start = (currentPage - 1) * rowPage + 1;  // 시작시 1
		end   = start + rowPage - 1;
		totalPage = (int) Math.ceil((double)total / rowPage);  // 글이 4개 이상일때  2
		startPage = currentPage - (currentPage - 1) % pageBlock; // 시작시 1
		endPage = startPage + pageBlock - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}

	public int getCurrentPage() {	return currentPage;	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getRowPage() {		return rowPage;	}
	public void setRowPage(int rowPage) {	this.rowPage = rowPage;	}
	public int getPageBlock() {	return pageBlock;	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getStart() {		return start;	}
	public void setStart(int start) {	this.start = start;	}
	public int getEnd() {		return end;	}
	public void setEnd(int end) {		this.end = end;	}
	public int getStartPage() {		return startPage;	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {		return endPage;	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotal() {		return total;	}

	public void setTotal(int total) {	this.total = total;	}
	public int getTotalPage() {		return totalPage;	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}	
}