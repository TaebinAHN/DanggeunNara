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
	public String SJblackListBoardRead (HttpServletRequest request, int pNum, Model model) {
		SJBoard sjb = bs.SJblackListBoardRead(pNum);
		System.out.println("blbr pNum->" + pNum);
		model.addAttribute("sjb", sjb);
		return "SJblackListBoardRead";
	}
	
	
	// 게시글 작성화면
	@RequestMapping(value="SJblackListBoardWrite")
	public String SJblackListBoardWrite(Model model) {
		return "SJblackListBoardWrite";
	}
	
	//게시글 작성
	@RequestMapping(value="SJblackListBoardInsert", method=RequestMethod.POST)
	public String SJblackListBoardInsert(HttpServletRequest request , Model model, @RequestParam("img") MultipartFile[] uploadFile ) throws IOException, Exception  {
		String uploadPath = "C:\\Users\\anjal\\Documents\\spring\\s20200903\\src\\main\\webapp\\resources\\img";
		
		SJBoard sjb = new SJBoard();
		sjb.setmId("admin@dang.com");
		sjb.setpTitle(request.getParameter("pTitle"));
		sjb.setpContent(request.getParameter("pContent"));
		for (int i = 0; i < uploadFile.length; i++) {
			MultipartFile img = uploadFile[i];
			logger.info("upload File Name : " + img.getOriginalFilename());
			logger.info("upload File Size : " + img.getSize());
			String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
			if (i == 0) {
				sjb.setpImg1(savedName);
				System.out.println(savedName);
			}
			if (i == 1)
				sjb.setpImg2(savedName);
			if (i == 2)
				sjb.setpImg3(savedName);
			if (i == 3)
				sjb.setpImg4(savedName);
			if (i == 4)
				sjb.setpImg5(savedName);

		}


		int result = bs.SJblackListBoardInsert(sjb);
		
		if (result > 0) return "redirect:SJblackListBoard.do";
		else {
			model.addAttribute("msg", "입력 실패 확인해 보세요");
			return "forward:SJblackListBoardWrite.do";
			
		}
	}
	
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
	@RequestMapping(value="SJblackListBoardUpdateForm")
	public String SJblackListBoardUpdateForm(int pNum, Model model) {
		SJBoard sjb = bs.SJblackListBoardRead(pNum);
		model.addAttribute("sjb", sjb);
		return "SJblackListBoardUpdateForm";
	}
	@RequestMapping(value="SJblackListBoardUpdate",  method=RequestMethod.POST)
	public String update(SJBoard sjb, Model model) {
		int k = bs.SJblackListBoardUpdate(sjb);
		System.out.println("bs.SJblackListBoardUpdate(sjb) CNT -->"+k);
		model.addAttribute("kkk",k);   // Test Controller간 Data 전달
		model.addAttribute("kk3","Message Test");   // Test Controller간 Data 전달	
		return "forward:SJblackListBoard.do";   //  Controller간 Data 전달시 활용(Model등에 담아서리....)
	}
	
	//게시글 삭제
	@RequestMapping(value="SJblackListBoardDelete")
	public String delete(int pNum,Model model) {
		int k = bs.delete(pNum);
		return "redirect:SJblackListBoard.do";
	}
	
}
