package oracle.java.s20200903.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import oracle.java.s20200903.model.HBsaleBoard;
import oracle.java.s20200903.service.HBService;
import oracle.java.s20200903.service.Paging;
import oracle.java.s20200903.util.FileUtils;

@Controller
public class HBController {
	
	@Resource(name="hbService")
	private HBService hs;
	
	@Resource(name="fileUtils")
	private FileUtils fu;
	
	
	
	
	@RequestMapping(value="list")
	public String list(HBsaleBoard sb, String currentPage, Model model) {
		int total = hs.total();
		System.out.println("total =>" + total);
		System.out.println("currentPage =>" + currentPage);
		
		Paging pg = new Paging(total, currentPage);
		sb.setStart(pg.getStart());
		sb.setEnd(pg.getEnd());
		List<HBsaleBoard> list = hs.list(sb);
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
		return "HBSaleBoard";
	}
	
	@RequestMapping(value="HBSaleBoardRead", method=RequestMethod.GET)
	public String HBSaleBoardRead( HttpServletRequest request, int pnum, Model model ) {
		/*HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		System.out.println("session id -> " + id);*/
		HBsaleBoard sb = hs.HBSaleBoardRead(pnum);
		System.out.println("pnum ->" + pnum);
		model.addAttribute("sb", sb);
		return "HBSaleBoardRead";
	}
	
	
	@RequestMapping(value="HBSaleBoardWrite", method= {RequestMethod.GET, RequestMethod.POST})
	public String HBSaleBoardWrite(Model model) {
		System.out.println("EmpController HBSaleBoardWrite start....");
		List<HBsaleBoard> list = hs.listManager();
		System.out.println("EmpController HBSaleBoardWrite list.size - >" + list.size());
		model.addAttribute("saleBoardMngList", list);
		return "HBSaleBoardWrite";
	}
	
	@RequestMapping(value="HBSaleBoardWritePro", method= {RequestMethod.GET, RequestMethod.POST})
	public String upload(HBsaleBoard sb, Model model, HttpServletRequest request) throws Exception {
		System.out.println("EmpController HBSaleBoardWritePro start.....");
		List<HBsaleBoard> list = fu.parseInsertFileInfo(sb, request);
		sb.setPimg1(list.get(0).getPimg1());
		sb.setPimg2(list.get(1).getPimg2());
		sb.setPimg3(list.get(2).getPimg3());
		sb.setPimg4(list.get(3).getPimg4());
		sb.setPimg5(list.get(4).getPimg5());
		
		hs.insert(sb);
	
		
		return "redirect:list.do";
		
	}
	
	@RequestMapping(value="delete", method= {RequestMethod.GET, RequestMethod.POST})
	public String delete(int pnum, Model model) {
		int result = hs.delete(pnum);
		return "redirect:list.do";
	}
	
}
