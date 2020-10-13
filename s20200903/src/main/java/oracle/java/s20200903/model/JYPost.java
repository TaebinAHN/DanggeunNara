package oracle.java.s20200903.model;

public class JYPost {
	private int bId; // 게시판구분
	private int pNum; // 게시글번호
	private String mId; // 회원아이디
	private int ctCode; // 카테고리코드
	private int psCode;
	private String pTitle; // 제목
	private int pPrice; // 가격
	private String pDate; // 게등록일자
	private String pContent;// 내용
	private int pHit; // 조회수
	private int pPicks; // 관심개수
	private String pImg1; // 이미지1
	private String pImg2;
	private String pImg3;
	private String pImg4;
	private String pImg5;

	// 조회용
	private String search;
	private String keyword;
	private String pageNum;
	private int start;
	private int end;

	// 출력용 // JYJoin 뷰 사용
	private String mNick;
	private String mAddr;
	private int mLevel;
	private String ctKinds;	
	private String pStatus;
	
	


	

	public String getpStatus() {
		return pStatus;
	}


	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}


	public int getPsCode() {
		return psCode;
	}


	public void setPsCode(int psCode) {
		this.psCode = psCode;
	}


	public String getCtKinds() {
		return ctKinds;
	}


	public void setCtKinds(String ctKinds) {
		this.ctKinds = ctKinds;
	}


	public String getmNick() {
		return mNick;
	}


	public void setmNick(String mNick) {
		this.mNick = mNick;
	}


	public String getmAddr() {
		return mAddr;
	}


	public void setmAddr(String mAddr) {
		this.mAddr = mAddr;
	}


	public int getmLevel() {
		return mLevel;
	}


	public void setmLevel(int mLevel) {
		this.mLevel = mLevel;
	}


	public JYPost() {
	
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

	public String getpDate() {
		return pDate;
	}

	public void setpDate(String pDate) {
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

}
