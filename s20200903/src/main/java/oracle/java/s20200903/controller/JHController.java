package oracle.java.s20200903.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import oracle.java.s20200903.model.JHBoard;
import oracle.java.s20200903.model.NEJoin;
import oracle.java.s20200903.model.TBMember;
import oracle.java.s20200903.service.JHService;
import oracle.java.s20200903.service.TBService;
import oracle.java.s20200903.service.JHPaging;

@Controller
public class JHController {

	@Autowired
	private JHService jhs;
	
	@RequestMapping(value="JHbadReviewBoard")
	public String jhList(JHBoard jhb, String currentPage, Model model) {
		System.out.println("JHController jhList start");
		// 게시글 총 개수 가져옴
		int total = jhs.jhtotal();
		System.out.println("게시글 갯수 =>" + total);
		System.out.println("currentPage =>" + currentPage);
		//페이징 처리를 위한 클래스 선언
		JHPaging pg = new JHPaging(total, currentPage);
		// 페이징 시작 번호/마지막 번호 set
		jhb.setStart(pg.getStart());
		jhb.setEnd(pg.getEnd());
		//게시판 리스트 가져옴
		List<JHBoard> jhBoard = jhs.jhList(jhb);
		//model에  게시판 리스트(brBoare), 페이징(pg), 게시글 총 갯수(total) 저장
		model.addAttribute("jhBoard", jhBoard);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		//badReviewBoard.jsp로 이동
		return "JHbadReviewBoard";
	}
	
	@RequestMapping(value="JHbadReviewBoardRead")
	public String jhRead(HttpServletRequest request , int pNum, Model model) {
		System.out.println("JHController jhRead start");
		//게시글 조회수 증가
		jhs.jhHitUp(pNum);
		//게시글 불러옴
		JHBoard jhBoard = jhs.jhRead(pNum);
		//게시글 model에 추가
		model.addAttribute("jhBoard", jhBoard);
		//badReviewBoardRead.jsp로 이동
		return"JHbadReviewBoardRead";
	}
	
	@RequestMapping(value="JHbadReviewBoardDelete")
	public String jhDelete(int pNum, Model model) {
		System.out.println("JHController jhDelete start");
		//게시글 삭제
		int k = jhs.jhDelete(pNum);
		System.out.println("k ->" + k);	//성공시 k = 1
		//JHbadReviewBoard.do 실행
		return"redirect:JHbadReviewBoard.do";
	}
	
	@RequestMapping(value="JHbadReviewBoardWriteForm")
	public String jhWriteForm(HttpServletRequest request, Model model) {
		System.out.println("JHController jhWriteForm start");	
		JHBoard jhBoard = jhs.jhMember((String)request.getSession().getAttribute("mId"));
		model.addAttribute("jhBoard", jhBoard);
		//badReviewBoardWrite.jsp로 이동	
		return"JHbadReviewBoardWrite";
	}
	
    @RequestMapping(value="JHbadReviewBoardWrite", method = RequestMethod.POST)
	public String jhWrite(HttpServletRequest request, @RequestParam("img") MultipartFile[] uploadFile, Model model) throws Exception {
    	System.out.println("JHController jhWrite start");
    	//사진 업로드 경로를 설정
		String uploadPath = request.getSession().getServletContext().getRealPath("/badReviewBoardImg/");
		System.out.println("uploadPath: " + uploadPath);
		//
		String fileSave = "/badReviewBoardImg";
	    String context = request.getContextPath();	//
		
		JHBoard jhb = new JHBoard();
		//
		jhb.setmId((String) request.getSession().getAttribute("mId"));
		System.out.println("mId: " + (String) request.getSession().getAttribute("mId"));
		jhb.setpTitle(request.getParameter("pTitle"));
		System.out.println("ptitle: " + request.getParameter("ptitle"));
		jhb.setpContent(request.getParameter("pContent"));
		System.out.println("pContent: " + request.getParameter("pcontent"));
		
		for(int i = 0; i<uploadFile.length; i++) {
			MultipartFile img = uploadFile[i];
			System.out.println("upload File Name : " + img.getOriginalFilename());
			System.out.println("upload File Size : " + img.getSize());
			
			if(i==0 && img.getSize() != 0) {String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
					  System.out.println(savedName);
					  String imgData = context + fileSave + "/" + savedName;
					  jhb.setpImg1(imgData);}
			if(i==1 && img.getSize() != 0) {String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
					  System.out.println(savedName);
			  		  String imgData = context + fileSave + "/" + savedName;
			  		  jhb.setpImg2(imgData);}
			if(i==2 && img.getSize() != 0) {String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
					  System.out.println(savedName);
			  		  String imgData = context + fileSave + "/" + savedName;
			  		  jhb.setpImg3(imgData);}
			if(i==3 && img.getSize() != 0) {String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
					  System.out.println(savedName);
			  		  String imgData = context + fileSave + "/" + savedName;
			  		  jhb.setpImg4(imgData);}
			if(i==4 && img.getSize() != 0) {String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
					  System.out.println(savedName);
			  		  String imgData = context + fileSave + "/" + savedName;
			  		  jhb.setpImg5(imgData);
				/*jhb.setPimg5(savedName); System.out.println(savedName);*/}		
		}   
		//jhInsert()를 실행후 결과값을 result에 저장
		int result = jhs.jhInsert(jhb);
		if (result > 0) {System.out.println("글쓰기 성공"); return "redirect:JHbadReviewBoard.do";}
		else {System.out.println("글쓰기 실패"); return "forward:JHbadReviewBoardWriteForm.do";}
	}
	
	private String uploadFile(String originalName, byte[] fileData , String uploadPath) 
			  throws Exception {
		System.out.println("JHController uploadFile Start");
		
		//UUID를 이용하여 유일한 식별자생성(업로드된 파일명의 중복을 방지,첨부파일 파일다운로드시 다른 파일을 예측하여 다운로드하는것을 방지,다른 컨텐츠의 임의 접근을 방지)
		UUID uid = UUID.randomUUID();
		//requestPath = requestPath + "/resources/image";
	    System.out.println("uploadPath->"+uploadPath);
	    //이미지가 업로드될 Directory 생성 
		File fileDirectory = new File(uploadPath);
		if (!fileDirectory.exists()) {
			fileDirectory.mkdirs();
			System.out.println("업로드용 폴더 생성 : " + uploadPath);
		}
		//저장될 이미지 아이디 생성
	    String savedName = uid.toString() + "_" + originalName;
//	    String path1 = "C:\\spring\\springSrc39\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\sMybatis\\resources\\image";
	    System.out.println("savedName->" + savedName);
	    
	    File target = new File(uploadPath, savedName);
//	    File target = new File(requestPath, savedName);
	    System.out.println("target->" + target);
	    
	    FileCopyUtils.copy(fileData, target);   // org.springframework.util.FileCopyUtils
	    
	    return savedName;
	  }
	
	@RequestMapping(value="JHbadReviewBoardUpdateForm")
	public String jhUpdateForm(int pNum, Model model) {
		System.out.println("JHController jhUpdateForm start");
		//게시글 불러옴
		JHBoard jhBoard = jhs.jhRead(pNum);
		//게시글 model에 추가
		model.addAttribute("jhBoard",jhBoard);
		//badReviewBoardUpdate.jsp로 이동
		return "JHbadReviewBoardUpdate";
	}
	
	@RequestMapping(value="JHbadReviewBoardUpdate")
	public String jhUpdate(HttpServletRequest request, int pNum, @RequestParam("img") MultipartFile[] uploadFile, Model model) throws Exception {
		System.out.println("JHController jhUpdate start");
    	//사진 업로드 경로를 설정
		String uploadPath = request.getSession().getServletContext().getRealPath("/badReviewBoardImg/");
		System.out.println("uploadPath: " + uploadPath);
		String fileSave = "/badReviewBoardImg";
	    String context = request.getContextPath();
	    System.out.println("context: " + context);		//
		
		JHBoard jhBoard = jhs.jhRead(pNum);	//원래 글 이미지, 제목, 내용 가져옴
		
		JHBoard jhb = new JHBoard();		
		jhb.setmId(request.getParameter("mId"));	//(String) request.getSession().getAttribute("mid");
		System.out.println("mId" + request.getParameter("mId"));
		jhb.setpTitle(request.getParameter("pTitle"));
		System.out.println("pTitle" + request.getParameter("pTitle"));
	    jhb.setpContent(request.getParameter("pContent"));
	    System.out.println("pContent" + request.getParameter("pContent"));
		
		for(int i = 0; i<uploadFile.length; i++) {
			MultipartFile img = uploadFile[i];
			System.out.println("upload File Name : " + img.getOriginalFilename());
			System.out.println("upload File Size : " + img.getSize());
			
			//if => 새로 첨부된 파일이 있을 시 새로 set //else => 새로 첨부된 파일이 없을 시 기존의 img정보 저장
				if(i==0 && img.getSize()!=0) { 
						String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
						System.out.println(savedName);
						String imgData = context + fileSave + "/" + savedName;
						System.out.println(imgData);
						jhb.setpImg1(imgData);
				} else {jhb.setpImg1(jhBoard.getpImg1());}
				if(i==1 && img.getSize()!=0) { 
						String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
						System.out.println(savedName);
						String imgData = context + fileSave + "/" + savedName;
						System.out.println(imgData);
						jhb.setpImg2(imgData);
				} else { jhb.setpImg2(jhBoard.getpImg2());}
				if(i==2 && img.getSize()!=0) {
						String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
						System.out.println(savedName);
						String imgData = context + fileSave + "/" + savedName;
						System.out.println(imgData);
						jhb.setpImg3(imgData);
				} else { jhb.setpImg3(jhBoard.getpImg3());}
				if(i==3 && img.getSize()!=0) {
						String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
						System.out.println(savedName);
						String imgData = context + fileSave + "/" + savedName;
						System.out.println(imgData);
						jhb.setpImg4(imgData);
				} else { jhb.setpImg4(jhBoard.getpImg4());}
				if(i==4 && img.getSize()!=0) {
						String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
						System.out.println(savedName);
						String imgData = context + fileSave + "/" + savedName;
						System.out.println(imgData);
						jhb.setpImg5(imgData);
				} else { jhb.setpImg5(jhBoard.getpImg5());}	
		}
		
	    int result = jhs.jhUpdate(jhb);
	    System.out.println("result: " + result);
		if (result > 0) {System.out.println("글수정 성공"); return "redirect:JHbadReviewBoard.do";}
		else { System.out.println("글수정 실패"); return "forward:JHbadReviewBoardUpdateForm.do";}
	}
}
