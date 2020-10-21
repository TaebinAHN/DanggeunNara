package oracle.java.s20200903.model;

import java.sql.Date;

public class SJBoard {
	private int bId;			//게시판구분
	private int pNum;			//게시글번호
	private String mId;			//회원아이디
	private int ctCode;			//카테고리코드
	private int psCode;			//거래상태코드
	private String pTitle;		//게시글 제목
	private int pPrice;			//물품가격
	private Date pDate;			//게시글 등록일자
	private String pContent;	//게시글 내용
	private int pHit;			//게시글 조회수
	private int pPicks;			//관심개수
	private String pImg1;		//게시글 이미지1
	private String pImg2;		//게시글 이미지2
	private String pImg3;		//게시글 이미지3
	private String pImg4;		//게시글 이미지4
	private String pImg5;		//게시글 이미지5
	
	private String search;   
	private String keyword;
	private String pageNum;  
	private int start; 		 
	private int end;

	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getCtCode() {
		return ctCode;
	}
	public void setCtCode(int ctCode) {
		this.ctCode = ctCode;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public Date getpDate() {
		return pDate;
	}
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public int getpHit() {
		return pHit;
	}
	public void setpHit(int pHit) {
		this.pHit = pHit;
	}
	public int getpPicks() {
		return pPicks;
	}
	public void setpPicks(int pPicks) {
		this.pPicks = pPicks;
	}
	public String getpImg1() {
		return pImg1;
	}
	public void setpImg1(String pImg1) {
		this.pImg1 = pImg1;
	}
	public String getpImg2() {
		return pImg2;
	}
	public void setpImg2(String pImg2) {
		this.pImg2 = pImg2;
	}
	public String getpImg3() {
		return pImg3;
	}
	public void setpImg3(String pImg3) {
		this.pImg3 = pImg3;
	}
	public String getpImg4() {
		return pImg4;
	}
	public void setpImg4(String pImg4) {
		this.pImg4 = pImg4;
	}
	public String getpImg5() {
		return pImg5;
	}
	public void setpImg5(String pImg5) {
		this.pImg5 = pImg5;
	}
	public int getPsCode() {
		return psCode;
	}
	public void setPsCode(int psCode) {
		this.psCode = psCode;
	}
	
	
}
