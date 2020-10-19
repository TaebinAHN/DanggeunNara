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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import oracle.java.s20200903.model.HBSaleBoard;
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
	public String list(HBSaleBoard sb, String currentPage, Model model) {
		int total = hs.total();
		System.out.println("total =>" + total);
		System.out.println("currentPage =>" + currentPage);
		
		Paging pg = new Paging(total, currentPage);
		sb.setStart(pg.getStart());
		sb.setEnd(pg.getEnd());
		List<HBSaleBoard> list = hs.list(sb);
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
		return "HBSaleBoard";
	}
	
	@RequestMapping(value="HBSaleBoardRead", method=RequestMethod.GET)
	public String HBSaleBoardRead( HttpServletRequest request, HBSaleBoard sb, Model model ) {
		/*HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		System.out.println("session id -> " + id);*/
		
		int bid = Integer.parseInt(request.getParameter("bid"));
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		
		sb.setBid(bid);
		sb.setPnum(pnum);		
		
		System.out.println(" HBSaleBoardRead pnum->" + sb.getBid());
		System.out.println("HBSaleBoardRead bId->" + sb.getPnum());

		
		HBSaleBoard hbsb = hs.HBSaleBoardRead(sb);
		
		model.addAttribute("sb", hbsb);
		return "HBSaleBoardRead";
	}
	
	
	@RequestMapping(value="HBSaleBoardWrite", method= {RequestMethod.GET, RequestMethod.POST})
	public String HBSaleBoardWrite(Model model) {
		System.out.println("HBController HBSaleBoardWrite start....");
		List<HBSaleBoard> list = hs.listManager();
		System.out.println("HBController HBSaleBoardWrite list.size - >" + list.size());
		model.addAttribute("saleBoardMngList", list);
		return "HBSaleBoardWrite";
	}
	
	@RequestMapping(value="HBSaleBoardWritePro", method= {RequestMethod.GET, RequestMethod.POST})
	public String upload(HBSaleBoard sb, Model model, HttpServletRequest request) throws Exception {
		System.out.println("HBController HBSaleBoardWritePro start.....");	
		
		List<HBSaleBoard> list = fu.parseInsertFileInfo(sb, request);
		// bid 파리미터 받아오는 코드짜기
			
		
		if(list.size() > 0) {
			sb.setPimg1(list.get(0).getPimg1());
			sb.setPimg2(list.get(0).getPimg2());
			sb.setPimg3(list.get(0).getPimg3());
			sb.setPimg4(list.get(0).getPimg4());
			sb.setPimg5(list.get(0).getPimg5());
		}
		
		hs.insert(sb);
	
		
		return "redirect:list.do";
		
	}
	
	
	@RequestMapping(value="HBSaleBoardUpdate", method= {RequestMethod.POST, RequestMethod.GET})
	public String update(HttpServletRequest request, HBSaleBoard sb , Model model) {
		System.out.println("HBController HBSaleBoardUpdate start...");
		int bid = Integer.parseInt(request.getParameter("bid"));
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		
		// jsp파일에서 이미지 넣는 기능이 안됨
		// 찾아서 해결
		// 관심목록 누르고 마이페이지 넘기는거
		// 글 수정시 이미지 x버튼 누르면 db에서 사라지게 하는거
		
		sb.setBid(bid);
		sb.setPnum(pnum);
		
		System.out.println(" HBSaleBoardUpdate pnum->" + sb.getBid());
		System.out.println("HBSaleBoardUpdate bId->" + sb.getPnum());
		
		HBSaleBoard resultSb = hs.HBSaleBoardUpdate(sb);
		model.addAttribute("sb", resultSb);
		return "HBSaleBoardUpdate";
	} 
	
	@RequestMapping(value="HBSaleBoardUpdatePro", method=RequestMethod.POST)
	public String update(HBSaleBoard sb, Model model) {
		System.out.println("HBController updatePro start.....");
		System.out.println("HBSaleBoardUpdatePro getPtitle() ->" + sb.getPtitle());
		System.out.println("HBSaleBoardUpdatePro getBid() ->" + sb.getBid());
		System.out.println("HBSaleBoardUpdatePro getPnum() ->" + sb.getPnum());
		int result = hs.update(sb);
		System.out.println("updatePro pnum ->" + result);
		
		if(result > 0) {
			System.out.println("수정완료");
			return "redirect:list.do";
		} else {
			System.out.println("다시 입력하세요");
			model.addAttribute("Message", "다시 입력하세요");
			
			return "forward:HBSaleBoardUpdate.do";
		}
	}
	
	
	@RequestMapping(value="delete", method= {RequestMethod.GET, RequestMethod.POST})
	public String delete(HBSaleBoard sb, Model model) {
		
		System.out.println("HBController delete pnum->"+ sb);
		int result = hs.delete(sb);
		System.out.println("HBController delete result->"+ result);
		return "redirect:list.do";
	}
	
	
	
}
