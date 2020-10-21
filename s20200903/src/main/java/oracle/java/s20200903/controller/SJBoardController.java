package oracle.java.s20200903.controller;

import java.io.*;

import java.util.*;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import oracle.java.s20200903.model.SJBoard;
import oracle.java.s20200903.service.SJBoardService;
import oracle.java.s20200903.service.SJPaging;

@MultipartConfig(
		// location="" 상대경로"/../.."불가. 절대경로를 적어야 함. 절대경로는 리눅스/윈도우에 차이가 있으므로 차라리 설정하지 않고
		// 자바 지정 임시 디렉토리 사용
		fileSizeThreshold = 1024 * 1024, // 1M (전송파일크기가 1M이상일 경우 메모리가 아니라 위의 디스크 사용
		maxFileSize = 1024 * 1024 * 50, // 첨부파일 한 개 당 사이즈 제한 (5MB)
		maxRequestSize = 1024 * 1024 * 50 * 5 // 전체 요청에 대한 사이즈 제한 (5MB 5개까지)
)

@Controller
public class SJBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(SJBoardController.class);

	@Autowired
	private SJBoardService bs;
	
	// 게시글 목록
	@RequestMapping(value="SJblackListBoard")
	public String blackListBoard(SJBoard sjb, String currentPage, Model model) {
		int total = bs.total();
		System.out.println("total=>" + total);
		SJPaging pg = new SJPaging(total, currentPage);
		sjb.setStart(pg.getStart());
		sjb.setEnd(pg.getEnd());
		List<SJBoard> SJblackListBoard = bs.SJblackListBoard(sjb);
		
		model.addAttribute("SJblackListBoard", SJblackListBoard);
		model.addAttribute("pg", pg);
		return "SJblackListBoard";
		
	}
	//게시글 내용
	@RequestMapping(value="SJblackListBoardRead")
	public String SJblackListBoardRead (HttpServletRequest request, Model model) {
		SJBoard sjb = new SJBoard();
		sjb.setpNum(Integer.parseInt(request.getParameter("pNum")));
		SJBoard sjb2 = bs.SJblackListBoardRead(sjb);
		System.out.println("blbr pNum->" + sjb);
		System.out.println("pImg1 -> " + request.getParameter("pImg1"));
		model.addAttribute("sjb", sjb2);
		return "SJblackListBoardRead";
	}
	
	
	// 게시글 작성화면
	@RequestMapping(value="SJblackListBoardWrite")
	public String SJblackListBoardWrite(Model model) {
		return "SJblackListBoardWrite";
	}
	
    @RequestMapping(value="SJblackListBoardInsert", method = RequestMethod.POST)
	public String jhWrite(HttpServletRequest request, @RequestParam("img") MultipartFile[] uploadFile, Model model) throws Exception {
    	System.out.println("SJController SJblackListBoardInsert start");
    	//사진 업로드 경로를 설정
		String uploadPath = request.getSession().getServletContext().getRealPath("/blackListBoardImg/");
		System.out.println("uploadPath: " + uploadPath);
		//
		SJBoard sjb = new SJBoard();
		//
		sjb.setmId((String) request.getSession().getAttribute("mId"));//request.getParameter("mId")
		System.out.println("mId: " + (String) request.getSession().getAttribute("mId"));
		sjb.setpTitle(request.getParameter("pTitle"));
		System.out.println("pTitle: " + request.getParameter("pTitle"));
		sjb.setpContent(request.getParameter("pContent"));
		System.out.println("pContent: " + request.getParameter("pContent"));
		
		for(int i = 0; i<uploadFile.length; i++) {
			MultipartFile img = uploadFile[i];
			System.out.println("upload File Name : " + img.getOriginalFilename());
			System.out.println("upload File Size : " + img.getSize());
			
			if(i==0 && img.getSize() != 0) {String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
					  System.out.println(savedName);
					  sjb.setpImg1(savedName);}
			if(i==1 && img.getSize() != 0) {String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
			  		  sjb.setpImg2(savedName);}
			if(i==2 && img.getSize() != 0) {String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
					  System.out.println(savedName);
			  		  sjb.setpImg3(savedName);}
			if(i==3 && img.getSize() != 0) {String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
					  System.out.println(savedName);
			  		  sjb.setpImg4(savedName);}
			if(i==4 && img.getSize() != 0) {String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
					  System.out.println(savedName);
			  		  sjb.setpImg5(savedName);
				/*jhb.setPimg5(savedName); System.out.println(savedName);*/}		
		}   
		//jhInsert()를 실행후 결과값을 result에 저장
		int result = bs.SJblackListBoardInsert(sjb);
		if (result > 0) {System.out.println("글쓰기 성공"); return "redirect:SJblackListBoard.do";}
		else {System.out.println("글쓰기 실패"); return "forward:SJblackListBoardWrite.do";}
	}
	
//	//게시글 작성
//	@RequestMapping(value="SJblackListBoardInsert", method=RequestMethod.POST)
//	public String SJblackListBoardInsert(HttpServletRequest request , Model model, @RequestParam("img") MultipartFile[] uploadFile ) throws IOException, Exception  {
//		String uploadPath = "C:\\spring\\springSrc\\s20200903\\src\\main\\webapp\\resources\\image";
//		
//		SJBoard sjb = new SJBoard();
//		sjb.setmId("admin@dang.com");
//		sjb.setpTitle(request.getParameter("pTitle"));
//		sjb.setpContent(request.getParameter("pContent"));
//		for (int i = 0; i < uploadFile.length; i++) {
//			MultipartFile img = uploadFile[i];
//			logger.info("upload File Name : " + img.getOriginalFilename());
//			logger.info("upload File Size : " + img.getSize());
//			String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
//			if (i == 0) {
//				sjb.setpImg1(savedName);
//				System.out.println(savedName);
//			}
//			if (i == 1)
//				sjb.setpImg2(savedName);
//			if (i == 2)
//				sjb.setpImg3(savedName);
//			if (i == 3)
//				sjb.setpImg4(savedName);
//			if (i == 4)
//				sjb.setpImg5(savedName);
//
//		}
//
//
//		int result = bs.SJblackListBoardInsert(sjb);
//		
//		if (result > 0) return "redirect:SJblackListBoard.do";
//		else {
//			model.addAttribute("msg", "입력 실패 확인해 보세요");
//			return "forward:SJblackListBoardWrite.do";
//			
//		}
//	}
	
	public String uploadFile(String originalName, byte[] fileData, String uploadPath) throws Exception {

		UUID uid = UUID.randomUUID();

		File fileDirectory = new File(uploadPath);

		// 업로드한 파일이 없을 경우 저장하지 않음

		if (originalName.equals("") || originalName == null) {
			return "null";
		} else {
			if (!fileDirectory.exists()) {
				fileDirectory.mkdirs();
				System.out.println("업로드용 폴더 생성:" + uploadPath);
			}
			String savedName = uid.toString() + "_" + originalName;
			File dirSave = new File(uploadPath, savedName);
			FileCopyUtils.copy(fileData, dirSave);

			return savedName;
		}
	}
	
	// 게시글 수정
	@RequestMapping(value="SJblackListBoardUpdateForm" )
	public String SJblackListBoardUpdateForm(HttpServletRequest request, Model model) {
		SJBoard sjb = new SJBoard();
		sjb.setpNum(Integer.parseInt(request.getParameter("pNum")));
		SJBoard sjb2 = bs.SJblackListBoardRead(sjb);
		model.addAttribute("sjb", sjb2);
		return "SJblackListBoardUpdateForm";
	}
	@RequestMapping(value="SJblackListBoardUpdate",  method=RequestMethod.POST)
	public String update(HttpServletRequest request, @RequestParam("img") MultipartFile[] uploadFile, Model model) throws Exception{
		String uploadPath = request.getSession().getServletContext().getRealPath("/blackListBoardImg/");
		SJBoard sjb = new SJBoard();
		sjb.setpNum(Integer.parseInt(request.getParameter("pNum")));
		SJBoard sjBoard = bs.SJblackListBoardRead(sjb);		
		sjb.setmId((String) request.getSession().getAttribute("mId"));	//(String) request.getSession().getAttribute("mid");
		System.out.println("mId" + (String) request.getSession().getAttribute("mId"));
		sjb.setpTitle(request.getParameter("pTitle"));
		System.out.println("pTitle" + request.getParameter("pTitle"));
		sjb.setpContent(request.getParameter("pContent"));
	    System.out.println("pContent" + request.getParameter("pContent"));
		
		for(int i = 0; i<uploadFile.length; i++) {
			MultipartFile img = uploadFile[i];
			System.out.println("upload File Name : " + img.getOriginalFilename());
			System.out.println("upload File Size : " + img.getSize());
			
			//if => 새로 첨부된 파일이 있을 시 새로 set //else => 새로 첨부된 파일이 없을 시 기존의 img정보 저장
			if(img.getSize()!=0) {	//새로 첨부된 파일이 있을 시 새로 set
				String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
				if(i==0) { sjb.setpImg1(savedName); System.out.println(savedName);}
				if(i==1) sjb.setpImg2(savedName);
				if(i==2) sjb.setpImg3(savedName);
				if(i==3) sjb.setpImg4(savedName);
				if(i==4) sjb.setpImg5(savedName);	
			} else {				// 새로 첨부된 파일이 없을 시 기존의 img정보 저장
				if(i==0)sjb.setpImg1(sjBoard.getpImg1());
				if(i==1)sjb.setpImg2(sjBoard.getpImg2());
				if(i==2)sjb.setpImg3(sjBoard.getpImg3());
				if(i==3)sjb.setpImg4(sjBoard.getpImg4());
				if(i==4)sjb.setpImg5(sjBoard.getpImg5());
			}	
		}
		
	    int result = bs.SJblackListBoardUpdate(sjb);
	    model.addAttribute("result", result);
	    System.out.println("result: " + result);
		if (result > 0) {System.out.println("글수정 성공"); return "redirect:SJblackListBoard.do";}
		else { System.out.println("글수정 실패"); return "forward:SJblackListBoardUpdateForm.do";}
	}
	
	//게시글 삭제
	@RequestMapping(value="SJblackListBoardDelete")
	public String delete(int pNum,Model model) {
		int k = bs.delete(pNum);
		return "redirect:SJblackListBoard.do";
	}
	
}
