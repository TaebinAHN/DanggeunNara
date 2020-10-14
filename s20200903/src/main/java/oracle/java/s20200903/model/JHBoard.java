package oracle.java.s20200903.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class JHBoard {
	//POST
	private int bId;			//게시판 구분(불량거래게시판 : 4)
	private int pNum;			//게시글 번호
	private String mId;			//회원 아이디
	private int cTcode;			//카테고리 코드					//사용안함
	private int pStatus;		//거래 상태 코드					//사용안함
	private String pTitle;		//게시글 제목
	private int pPrice;			//물품가격						//사용안함
	private String pDate;		//게시글 등록 일자
	private String pContent;	//게시글 내용
	private int pHit;			//게시글 조회수
	private int pPicks;			//관심 개수					//사용안함
	private String pImg1;		//게시글 이미지1
	private String pImg2;		//게시글 이미지2
	private String pImg3;		//게시글 이미지3
	private String pImg4;		//게시글 이미지4
	private String pImg5;		//게시글 이미지5
	
	//Comment
	private int cNum;			//댓글 번호
	private String cCmnt;		//댓글 내용
	private Date cDate;			//댓글 작성 일시
	private int cLevel;			//댓글 등급(0 댓글/1 대댓글/2대대댓글....)
	
	//member join
	private String mNick;		//회원 닉네임
	private String mAddr;		//회원 주소
	
	//Paging
	private int start; 		 
	private int end;
	
	private MultipartFile[] img;	//이미지 업로드용
	
	public MultipartFile[] getImg() {
		return img;
	}
	public void setImg(MultipartFile[] img) {
		this.img = img;
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
	public int getcTcode() {
		return cTcode;
	}
	public void setcTcode(int cTcode) {
		this.cTcode = cTcode;
	}
	public int getpStatus() {
		return pStatus;
	}
	public void setpStatus(int pStatus) {
		this.pStatus = pStatus;
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
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public String getcCmnt() {
		return cCmnt;
	}
	public void setcCmnt(String cCmnt) {
		this.cCmnt = cCmnt;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public int getcLevel() {
		return cLevel;
	}
	public void setcLevel(int cLevel) {
		this.cLevel = cLevel;
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
