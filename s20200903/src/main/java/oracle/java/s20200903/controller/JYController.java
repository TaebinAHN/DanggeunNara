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

import oracle.java.s20200903.model.JYPost;
import oracle.java.s20200903.service.JYService;
import oracle.java.s20200903.service.Paging;

@MultipartConfig(
		// location="" 상대경로"/../.."불가. 절대경로를 적어야 함. 절대경로는 리눅스/윈도우에 차이가 있으므로 차라리 설정하지 않고
		// 자바 지정 임시 디렉토리 사용
		fileSizeThreshold = 1024 * 1024, // 1M (전송파일크기가 1M이상일 경우 메모리가 아니라 위의 디스크 사용
		maxFileSize = 1024 * 1024 * 50, // 첨부파일 한 개 당 사이즈 제한 (5MB)
		maxRequestSize = 1024 * 1024 * 50 * 5 // 전체 요청에 대한 사이즈 제한 (5MB 5개까지)
)

@Controller
public class JYController {

	private static final Logger logger = LoggerFactory.getLogger(JYController.class);

	@Autowired
	private JYService jyService;

	// 나눔 목록 출력
	@RequestMapping(value = "JYtoSharingBoard")
	public String selectSharing(JYPost jyPost, String currentPage, Model model) {

		int total = jyService.total_Sharing();
		Paging pg = new Paging(total, currentPage);
		System.out.println("total->" + total);
		System.out.println("JYController currentPage->" + currentPage); // 넘어가는 페이지 눌렀을때 값 생김

		jyPost.setStart(pg.getStart());
		jyPost.setEnd(pg.getEnd());

		List<JYPost> listSharing = jyService.selectSharing(jyPost);

		model.addAttribute("jyPost_list", listSharing);
		model.addAttribute("pg", pg);

		return "JYtoSharingBoard";
	}

	// 나눔 글 상세보기
	@RequestMapping(value = "JYtoSharingBoardRead")
	public String selectSharingDetail(HttpServletRequest request, Model model, JYPost jyPost) {

		int bId = Integer.parseInt(request.getParameter("bId"));
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		// bId와 pNum값을 받아온다
		// getParameter()메서드의 경우 String타입을 리턴하는반면,
		// getAttribute()는 Object 타입을 리턴하기 때문에
		// 주로 빈 객체나 다른 클래스를 받아올때 사용된다.

		jyPost.setbId(bId);
		jyPost.setpNum(pNum);

		JYPost resultJyPost = jyService.selectSharingDetail(jyPost);
		model.addAttribute("jyPost", resultJyPost);

		System.out.println("pnum->" + pNum);
		System.out.println("bId->" + bId);

		return "JYtoSharingBoardRead";
	}

	// 나눔 글 작성 페이지 이동
	@RequestMapping(value = "JYtoSharingBoardWrite")
	public String insertSharingForm() {
		return "JYtoSharingBoardWrite";
	}

	// 나눔 글 등록
	@RequestMapping(value = "JYtoSharingBoardWrite", method = RequestMethod.POST)
	public String insertSharing(HttpServletRequest request, Model model,
			@RequestParam("img") MultipartFile[] uploadFile) throws IOException, Exception {

		// String uploadPath =
		// "C:\\Spring-Project\\s20200903\\src\\main\\webapp\\resources\\image";
		String uploadPath = "D:\\Spring\\springSrc\\s20200903\\src\\main\\webapp\\resources\\image";

		JYPost jyPost = new JYPost();
		//// 통합 후 neJoin.setMid((String) request.getSession().getAttribute("mid"));
		jyPost.setmId("user@naver.com");
		jyPost.setCtCode(Integer.parseInt(request.getParameter("ctCode")));
		jyPost.setpTitle(request.getParameter("pTitle"));
		jyPost.setpContent(request.getParameter("pContent"));

		for (int i = 0; i < uploadFile.length; i++) {
			MultipartFile img = uploadFile[i];
			logger.info("upload File Name : " + img.getOriginalFilename());
			logger.info("upload File Size : " + img.getSize());
			String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
			if (i == 0) {
				jyPost.setpImg1(savedName);
				System.out.println(savedName);
			}
			if (i == 1)
				jyPost.setpImg2(savedName);
			if (i == 2)
				jyPost.setpImg3(savedName);
			if (i == 3)
				jyPost.setpImg4(savedName);
			if (i == 4)
				jyPost.setpImg5(savedName);

		}

		int result = jyService.insertSharing(jyPost);

		if (result > 0) {
			System.out.println("나눔 글 입력성공");
			return "redirect:JYtoSharingBoard.do";
		} else {
			System.out.println("나눔 글 등록 실패");
			model.addAttribute("msg", " 나눔 글 등록 실패");

			return "forward:JYtoSharingBoardWrite.do";
		}
	}

	// 파일 저장
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

	// 나눔 글 수정 화면 출력
	@RequestMapping(value = "JYtoSharingBoardUpdate", method = RequestMethod.GET)
	public String updateSharingForm(HttpServletRequest request, Model model, JYPost jyPost) {

		int bId = Integer.parseInt(request.getParameter("bId"));
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		// String mId= request.getParameter("mId");

		jyPost.setbId(bId);
		jyPost.setpNum(pNum);
		// jyPost.setmId(mId);

		JYPost resultJyPost = jyService.updateSharingForm(jyPost);
		model.addAttribute("jyPost", resultJyPost);
		System.out.println("controller updateSharingForm start... ");

		return "JYtoSharingBoardUpdate";

	}

	// 나눔 글 수정
	@RequestMapping(value = "JYtoSharingBoardUpdate", method = RequestMethod.POST)
	public String updateSharing(Model model, JYPost jyPost) {

		int result = jyService.updateSharing(jyPost);
		model.addAttribute("result", result);

		if (result > 0) {
			System.out.println("나눔 글 수정 성공");
			return "redirect:JYtoSharingBoard.do";
		} else {
			System.out.println("나눔 글 수정 실패");
			model.addAttribute("msg", " 나눔 글 수정 실패");

			return "forward:JYtoSharingBoardUpdate.do";
		}

	}

	// 나눔 글 삭제
	@RequestMapping(value = "deleteSharing")
	public String deleteSharing(Model model, JYPost jyPost) {
		int result = jyService.deleteSharing(jyPost);
		return "redirect:JYtoSharingBoard.do";
	}

	// 공지사항 목록 출력
	@RequestMapping(value = "JYnoticeBoard")
	public String selectNotice(JYPost jyPost, String currentPage, Model model) {
		int total = jyService.total_Notice();
		Paging pg = new Paging(total, currentPage);
		System.out.println("total->" + total);

		jyPost.setStart(pg.getStart());
		jyPost.setEnd(pg.getEnd());
		List<JYPost> listNotice = jyService.selectNotice(jyPost);

		model.addAttribute("jyPost_list", listNotice);
		model.addAttribute("pg", pg);

		return "JYnoticeBoard";
	}

	// 공지사항 상세보기
	@RequestMapping(value = "JYnoticeBoardRead")
	public String selectNoticeDetail(HttpServletRequest request, Model model, JYPost jyPost) {

		int bId = Integer.parseInt(request.getParameter("bId"));
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		// String mId = request.getParameter("mId");

		jyPost.setbId(bId);
		jyPost.setpNum(pNum);
		// jyPost.setmId(mId);

		JYPost resultJyPost = jyService.selectNoticeDetail(jyPost);
		model.addAttribute("jyPost", resultJyPost);

		System.out.println("pnum->" + pNum);
		System.out.println("bId->" + bId);
		// System.out.println("mId->" + mId);

		return "JYnoticeBoardRead";
	}

	// 공지사항 목록에서 공지사항 글작성 페이지 이동
	@RequestMapping(value = "JYnoticeBoardWrite")
	public String insertNoticeForm() {
		return "JYnoticeBoardWrite";
	}

	// 공지사항 등록
	@RequestMapping(value = "JYnoticeBoardWrite", method = RequestMethod.POST)
	public String insertNotice(HttpServletRequest request, Model model, @RequestParam("img") MultipartFile[] uploadFile)
			throws IOException, Exception {

		// String uploadPath =
		// "C:\\Spring-Project\\s20200903\\src\\main\\webapp\\resources\\image";
		String uploadPath = "D:\\Spring\\springSrc\\s20200903\\src\\main\\webapp\\resources\\image";

		JYPost jyPost = new JYPost();
		//// 통합 후 neJoin.setMid((String) request.getSession().getAttribute("mid"));
		jyPost.setmId("admin");
		jyPost.setpTitle(request.getParameter("pTitle"));
		jyPost.setpContent(request.getParameter("pContent"));

		for (int i = 0; i < uploadFile.length; i++) {
			MultipartFile img = uploadFile[i];
			logger.info("upload File Name : " + img.getOriginalFilename());
			logger.info("upload File Size : " + img.getSize());
			String savedName = uploadFile(img.getOriginalFilename(), img.getBytes(), uploadPath);
			if (i == 0) {
				jyPost.setpImg1(savedName);
				System.out.println(savedName);
			}
			if (i == 1)
				jyPost.setpImg2(savedName);
			if (i == 2)
				jyPost.setpImg3(savedName);
			if (i == 3)
				jyPost.setpImg4(savedName);
			if (i == 4)
				jyPost.setpImg5(savedName);
		}

		int result = jyService.insertNotice(jyPost);

		if (result > 0) {
			System.out.println("공지사항 입력성공");
			return "redirect:JYnoticeBoard.do";
		} else {
			System.out.println("공지사항 등록 실패");
			model.addAttribute("msg", " 공지사항 등록 실패");

			return "forward:JYnoticeBoardWrite.do";

		}
	}

	// 공지사항 수정 화면 출력
	@RequestMapping(value = "JYnoticeBoardUpdate", method = RequestMethod.GET)
	public String updateNoticeForm(HttpServletRequest request, Model model, JYPost jyPost) {

		int bId = Integer.parseInt(request.getParameter("bId"));
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		// String mId= request.getParameter("mId");

		jyPost.setbId(bId);
		jyPost.setpNum(pNum);
		// jyPost.setmId(mId);

		JYPost resultJyPost = jyService.updateNoticeForm(jyPost);
		model.addAttribute("jyPost", resultJyPost);

		return "JYnoticeBoardUpdate";

	}

	// 공지사항 수정
	@RequestMapping(value = "JYnoticeBoardUpdate", method = RequestMethod.POST)
	public String updateNotice(Model model, JYPost jyPost) {
		System.out.println("controller updateNotice start...");

		int result = jyService.updateNotice(jyPost);
		model.addAttribute("result", result);

		if (result > 0) {
			System.out.println("공지사항 수정 성공");
			return "redirect:JYnoticeBoard.do";
		} else {
			System.out.println("공지사항 수정 실패");
			model.addAttribute("msg", " 공지사항 수정 실패");

			return "forward:JYnoticeBoardUpdate.do";
		}

	}

	// 공지사항 삭제
	@RequestMapping(value = "deleteNotice")
	public String deleteNotice(Model model, JYPost jyPost) {
		int result = jyService.deleteNotice(jyPost);
		return "redirect:JYnoticeBoard.do";
	}

}
