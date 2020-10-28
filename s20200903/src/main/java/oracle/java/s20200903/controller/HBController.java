package oracle.java.s20200903.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import oracle.java.s20200903.model.HBSaleBoard;
import oracle.java.s20200903.model.TBMember;
import oracle.java.s20200903.service.HBService;
import oracle.java.s20200903.service.Paging;
import oracle.java.s20200903.util.FileUtils;
import scala.util.parsing.json.JSONObject;

@Controller
public class HBController {
	
	@Resource(name="hbService")
	private HBService hs;

	@Resource(name="fileUtils")
	private FileUtils fu;
	
	@RequestMapping(value="asd")
	public String asd (HttpServletRequest request, HBSaleBoard sb, TBMember tbm, Model model) {
		HttpSession session = request.getSession();
		session.setAttribute("mId", tbm.getmId());
		
		System.out.println("tbmId =>" + tbm.getmId());
		int bId = Integer.parseInt(request.getParameter("bId"));
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		
		
		sb.setbId(bId);
		sb.setpNum(pNum);
		
		System.out.println("bid" + sb.getbId());
		System.out.println("pnum" + sb.getpNum());
		
		return "forward:like.do";
	}

	@RequestMapping(value="list")
	public String list(HttpServletRequest request, HBSaleBoard sb, TBMember tbm, String currentPage, Model model) {
		int total = hs.total();
		
		HttpSession session = request.getSession();
		session.setAttribute("mId", tbm.getmId());
		
		System.out.println("mId =>" + tbm.getmId());
		
		
		Paging pg = new Paging(total, currentPage);
		sb.setStart(pg.getStart());
		sb.setEnd(pg.getEnd());
		
		System.out.println("total =>" + total);
		System.out.println("currentPage =>" + currentPage);
		
//		sb.setMid((String) request.getSession().getAttribute("mid"));
		List<HBSaleBoard> list = hs.list(sb);		
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
		return "HBSaleBoard";
	}
	
	@RequestMapping(value="HBSaleBoardRead", method=RequestMethod.GET)
	public String HBSaleBoardRead( HttpServletRequest request, TBMember tbm, HBSaleBoard sb, Model model ) {
		/*HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		System.out.println("session id -> " + id);*/
		
		HttpSession session = request.getSession();
		session.setAttribute("mId", tbm.getmId());
		
		System.out.println("HBSaleBoardRead mId =>" + tbm.getmId());
		
		int bId = Integer.parseInt(request.getParameter("bId"));
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		
		sb.setbId(bId);
		sb.setpNum(pNum);		
		
		System.out.println(" HBSaleBoardRead pnum->" + sb.getbId());
		System.out.println("HBSaleBoardRead bId->" + sb.getpNum());
		
		
		HBSaleBoard hbsb = hs.HBSaleBoardRead(sb);
		
		model.addAttribute("sb", hbsb);
		return "HBSaleBoardRead";
	}
	
	
	@RequestMapping(value="HBSaleBoardWrite", method= {RequestMethod.GET, RequestMethod.POST})
	public String HBSaleBoardWrite(HttpServletRequest request, TBMember tbm, HBSaleBoard sb, Model model) {
		HttpSession session = request.getSession();
		session.setAttribute("mId", tbm.getmId());
		
		System.out.println("mId =>" + tbm.getmId());
		System.out.println("HBController HBSaleBoardWrite start....");
		
		List<HBSaleBoard> list = hs.listManager();
		System.out.println("HBController HBSaleBoardWrite list.size - >" + list.size());
		
		model.addAttribute("saleBoardMngList", list);
		return "HBSaleBoardWrite";
	}
	
	@RequestMapping(value="HBSaleBoardWritePro", method= {RequestMethod.GET, RequestMethod.POST})
	public String upload(HBSaleBoard sb, Model model, TBMember tbm, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("mId", tbm.getmId());
		
		System.out.println("mId =>" + tbm.getmId());
		System.out.println("HBController HBSaleBoardWritePro start.....");	
		
		
		
		List<HBSaleBoard> list = fu.parseInsertFileInfo(sb, request);
		// bid �ĸ����� �޾ƿ��� �ڵ�¥��
		
		if(list!=null && list.size() > 0) {
			sb.setpImg1(list.get(0).getpImg1());
			sb.setpImg2(list.get(0).getpImg2());
			sb.setpImg3(list.get(0).getpImg3());
			sb.setpImg4(list.get(0).getpImg4());
			sb.setpImg5(list.get(0).getpImg5());
		} 
		
		hs.insert(sb);
	
		
		return "redirect:list.do";
		
	}
	
	
	@RequestMapping(value="HBSaleBoardUpdate", method= {RequestMethod.POST, RequestMethod.GET})
	public String update(HttpServletRequest request, TBMember tbm, HBSaleBoard sb , Model model) {
		HttpSession session = request.getSession();
		session.setAttribute("mId", tbm.getmId());
		
		System.out.println("mId =>" + tbm.getmId());
		System.out.println("HBController HBSaleBoardUpdate start...");
		int bId = Integer.parseInt(request.getParameter("bId"));
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		
		
		sb.setbId(bId);
		sb.setpNum(pNum);
		
		System.out.println("HBSaleBoardUpdate bId->" + sb.getbId());
		System.out.println("HBSaleBoardUpdate pNum->" + sb.getpNum());
		System.out.println("pImg1 - >" + sb.getpImg1());
		
		HBSaleBoard resultSb = hs.HBSaleBoardUpdate(sb);
		model.addAttribute("sb", resultSb);
		return "HBSaleBoardUpdate";
	} 
	
	@RequestMapping(value="HBSaleBoardUpdatePro", method=RequestMethod.POST)
	public String updatePro(HttpServletRequest request, TBMember tbm, HBSaleBoard sb, Model model) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("mId", tbm.getmId());
		
		System.out.println("mId =>" + tbm.getmId());
		System.out.println("HBController updatePro start.....");
		System.out.println("HBSaleBoardUpdatePro getPtitle() ->" + sb.getpTitle());
		System.out.println("HBSaleBoardUpdatePro getBid() ->" + sb.getbId());
		System.out.println("HBSaleBoardUpdatePro getPnum() ->" + sb.getpNum());
		
				
		List<HBSaleBoard> list = fu.parseInsertFileInfo(sb, request);
				
		if(list!=null && list.size() > 0) {
			sb.setpImg1(list.get(0).getpImg1());
			System.out.println("getPimg1()" + sb.getpImg1());
			sb.setpImg2(list.get(0).getpImg2());
			System.out.println("getPimg2()" + sb.getpImg2());
			sb.setpImg3(list.get(0).getpImg3());
			System.out.println("getPimg3()" + sb.getpImg3());
			sb.setpImg4(list.get(0).getpImg4());
			System.out.println("getPimg4()" + sb.getpImg4());
			sb.setpImg5(list.get(0).getpImg5());
			System.out.println("getPimg5()" + sb.getpImg5());
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
	public String delete(HttpServletRequest request, TBMember tbm, HBSaleBoard sb, Model model) {
		HttpSession session = request.getSession();
		session.setAttribute("mId", tbm.getmId());
		
		System.out.println("mId =>" + tbm.getmId());
		
		System.out.println("HBController delete pnum->"+ sb);
		int result = hs.delete(sb);
		System.out.println("HBController delete result->"+ result);
		return "redirect:list.do";
	}
	
	@RequestMapping(value="like", method={RequestMethod.GET, RequestMethod.POST})
	public String like(HttpServletRequest request, TBMember tbm, HBSaleBoard sb, Model model) {
		System.out.println("HBController like start...");
		//@ModelAttribute�� submit�� form�� ������ �����ؼ� ���޹ްų�, �ٽ� ��� �Ѱܼ� ����ϱ� ���� ���Ǵ� ������Ʈ �̴�.

        //������ ������Ʈ�� DTO�� ������Ƽ�� ��û �Ķ���͸� ���ε��ؼ� �ѹ��� ������ @ModelAttribute ��� �� �� �ִ�.

        //@ModelAttribute�� ��Ʈ�ѷ��� �����ϴ� �𵨿� �Ķ���ͷ� ������ ������Ʈ�� �ڵ����� �߰����ش�.     
       
        //�α��� ���θ� üũ�ϱ� ���� ���ǿ� ����� ���̵� Ȯ��
		HttpSession session = request.getSession();
		session.setAttribute("mId", tbm.getmId());
		
		System.out.println("mId =>" + tbm.getmId());
		
		String mId = (String)session.getAttribute("mId");
		int bId = Integer.parseInt(request.getParameter("bId"));
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		
		sb.setbId(bId);
		sb.setpNum(pNum);
		
		System.out.println("sb.getBid() =>" + sb.getbId());
		System.out.println("sb.getPnum() =>" + sb.getpNum());
		 
		
		
		
		if(mId == null) {	
			//�α������� ���� �����̸� �α��� ȭ������ �̵�
			return "redirect:TBlogin.do";
		} if(mId != null) {
			
			int plike_check = 0;
			model.addAttribute("plike_check", plike_check);
			System.out.println("updatePro pnum ->" + plike_check);
			
			if(plike_check == 0) {
				System.out.println("like_check 0: " + plike_check);
				System.out.println("���ɸ�Ͽ� ��ϵǾ����ϴ�");
				hs.likeUpdate(sb);
				return "redirect:HBSaleboardRead.do";
			} if(plike_check > 0) {
				System.out.println("like_check 1: " + plike_check);
				System.out.println("���ɸ�Ͽ��� ���ܵǾ����ϴ�");
				hs.dlike_checkUpdate(sb);
				model.addAttribute("Message", "���ɸ�Ͽ��� ���ܵǾ����ϴ�");
				
				return "redirect:HBSaleboardRead.do";
			}
		}
		return "redirect:HBSaleboardRead.do";
	}
	
	
}
