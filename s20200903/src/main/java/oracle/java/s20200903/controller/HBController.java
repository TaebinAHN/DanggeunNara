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
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		// bid �ĸ����� �޾ƿ��� �ڵ�¥��
			
		
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
		
		// ���ɸ�� ������ ���������� �ѱ�°�
		// �� ������ �̹��� x��ư ������ db���� ������� �ϴ°�
		
		sb.setBid(bid);
		sb.setPnum(pnum);
		
		System.out.println("HBSaleBoardUpdate bid->" + sb.getBid());
		System.out.println("HBSaleBoardUpdate pnum->" + sb.getPnum());
		
		HBSaleBoard resultSb = hs.HBSaleBoardUpdate(sb);
		model.addAttribute("sb", resultSb);
		return "HBSaleBoardUpdate";
	} 
	
	@RequestMapping(value="HBSaleBoardUpdatePro", method={RequestMethod.POST, RequestMethod.GET})
	public String updatePro(HttpServletRequest request, HBSaleBoard sb, Model model) throws Exception {
		System.out.println("HBController updatePro start.....");
		System.out.println("HBSaleBoardUpdatePro getPtitle() ->" + sb.getPtitle());
		System.out.println("HBSaleBoardUpdatePro getBid() ->" + sb.getBid());
		System.out.println("HBSaleBoardUpdatePro getPnum() ->" + sb.getPnum());
		
				
		List<HBSaleBoard> list = fu.parseInsertFileInfo(sb, request);
				
		
		if(list.size() > 0) {
			sb.setPimg1(list.get(0).getPimg1());
			System.out.println("getPimg1()" + sb.getPimg1());
			sb.setPimg2(list.get(0).getPimg2());
			System.out.println("getPimg2()" + sb.getPimg2());
			sb.setPimg3(list.get(0).getPimg3());
			System.out.println("getPimg3()" + sb.getPimg3());
			sb.setPimg4(list.get(0).getPimg4());
			System.out.println("getPimg4()" + sb.getPimg4());
			sb.setPimg5(list.get(0).getPimg5());
			System.out.println("getPimg5()" + sb.getPimg5());
		}
		
		
		int result = hs.update(sb);
		model.addAttribute("result", result);
		System.out.println("updatePro pnum ->" + result);
		
		if(result > 0) {
			System.out.println("�����Ϸ�");
			return "redirect:list.do";
		} else {
			System.out.println("�ٽ� �Է��ϼ���");
			model.addAttribute("Message", "�ٽ� �Է��ϼ���");
			
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
