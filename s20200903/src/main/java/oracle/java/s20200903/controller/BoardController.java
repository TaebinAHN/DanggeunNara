package oracle.java.s20200903.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import oracle.java.s20200903.model.Board;
import oracle.java.s20200903.service.BoardService;
import oracle.java.s20200903.service.Paging;

@Controller
public class BoardController {

	@Autowired
	private BoardService bs;
	
	// 게시글 목록
	@RequestMapping(value="blackListBoard")
	public String blackListBoard(Board sjb, String currentPage, Model model) {
		int total = bs.total();
		System.out.println("total=>" + total);
		Paging pg = new Paging(total, currentPage);
		sjb.setStart(pg.getStart());
		sjb.setEnd(pg.getEnd());
		List<Board> blackListBoard = bs.blackListBoard(sjb);
		
		model.addAttribute("blackListBoard", blackListBoard);
		model.addAttribute("pg", pg);
		return "blackListBoard";
		
	}
	//게시글 내용
	@RequestMapping(value="blackListBoardRead")
	public String blackListBoardRead (HttpServletRequest request, int pNum, Model model) {
		Board sjb = bs.blackListBoardRead(pNum);
		System.out.println("blbr pNum->" + pNum);
		model.addAttribute("sjb", sjb);
		return "blackListBoardRead";
	}
	
	
	// 게시글 작성화면
	@RequestMapping(value="blackListBoardWrite")
	public String blackListBoardWrite(Model model) {
		return "blackListBoardWrite";
	}
	
	@RequestMapping(value="blackListBoardInsert", method=RequestMethod.POST)
	public String blackListBoardInsert(Board sjb ,Model model) {
		int result = bs.insert(sjb);
		if (result > 0) return "redirect:blackListBoard";
		else {
			model.addAttribute("msg", "입력 실패 확인해 보세요");
			return "forward:blackListBoardWrite";
			
		}
	}
	
	// 게시글 수정
	@RequestMapping(value="blackListBoardUpdateForm")
	public String blackListBoardUpdateForm(int pNum, Model model) {
		Board sjb = bs.blackListBoardRead(pNum);
		model.addAttribute("sjb", sjb);
		return "blackListBoardUpdateForm";
	}	
	@RequestMapping(value="blackListBoardUpdate",  method=RequestMethod.POST)
	public String update(Board sjb, Model model) {
		int k = bs.blackListBoardUpdate(sjb);
		System.out.println("bs.blackListBoardUpdate(sjb) CNT -->"+k);
		model.addAttribute("kkk",k);   // Test Controller간 Data 전달
		model.addAttribute("kk3","Message Test");   // Test Controller간 Data 전달
		// return "redirect:list.do";	
		return "forward:blackListBoard.do";   //  Controller간 Data 전달시 활용(Model등에 담아서리....)
	}
	
	//게시글 삭제
	@RequestMapping(value="blackListBoardDelete")
	public String delete(int pNum,Model model) {
		int k = bs.delete(pNum);
		return "redirect:blackListBoard.do";
	}
	
}
