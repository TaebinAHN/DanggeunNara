package oracle.java.s20200903.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class saleBoard {

	private int pnum;
	private int bid;
	private String mid;
	private int ctcode;
	private int pscode;
	private String ptitle;
	private int pprice;
	private Date pdate;
	private String pcontent;
	private int phit;
	private int ppicks;
	private String pimg1;
	private String pimg2;
	private String pimg3;
	private String pimg4;
	private String pimg5;
	
	private MultipartFile file;


	
	private String sertch;
	private String keyword;
	private String pageNum;
	private int start;
	private int end;
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getCtcode() {
		return ctcode;
	}
	public void setCtcode(int ctcode) {
		this.ctcode = ctcode;
	}
	public int getPscode() {
		return pscode;
	}
	public void setPscode(int pscode) {
		this.pscode = pscode;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public int getPhit() {
		return phit;
	}
	public void setPhit(int phit) {
		this.phit = phit;
	}
	public int getPpicks() {
		return ppicks;
	}
	public void setPpicks(int ppicks) {
		this.ppicks = ppicks;
	}
	public String getPimg1() {
		return pimg1;
	}
	public void setPimg1(String pimg1) {
		this.pimg1 = pimg1;
	}
	public String getPimg2() {
		return pimg2;
	}
	public void setPimg2(String pimg2) {
		this.pimg2 = pimg2;
	}
	public String getPimg3() {
		return pimg3;
	}
	public void setPimg3(String pimg3) {
		this.pimg3 = pimg3;
	}
	public String getPimg4() {
		return pimg4;
	}
	public void setPimg4(String pimg4) {
		this.pimg4 = pimg4;
	}
	public String getPimg5() {
		return pimg5;
	}
	public void setPimg5(String pimg5) {
		this.pimg5 = pimg5;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getSertch() {
		return sertch;
	}
	public void setSertch(String sertch) {
		this.sertch = sertch;
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
