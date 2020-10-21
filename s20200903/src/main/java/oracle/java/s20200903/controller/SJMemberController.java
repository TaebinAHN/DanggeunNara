package oracle.java.s20200903.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import oracle.java.s20200903.model.SJMember;
import oracle.java.s20200903.service.SJPaging;
import oracle.java.s20200903.service.SJMemberService;


@Controller
public class SJMemberController {
	

	
	@Autowired
	private SJMemberService ss;
	
	@RequestMapping(value="adminList")
	public String list(SJMember sjm, String currentPage, Model model) {
		int adminTotal = ss.adminTotal();
		System.out.println("total=>" + adminTotal);
		
		SJPaging pg = new SJPaging(adminTotal, currentPage);
		sjm.setStart(pg.getStart());
		sjm.setEnd(pg.getEnd());
		List<SJMember> adminList = ss.adminList(sjm);
		
		model.addAttribute("adminList", adminList);
		model.addAttribute("pg", pg);
		return "SJMemberlist";
	}	
	
//	@RequestMapping(value="SJUserDetail")
//	public String userDetail(HttpServletRequest request, Model model) {
//		SJMember sjm = new SJMember();
//		sjm.setmId(request.getParameter("mId"));
//		SJMember sjm2 = ss.SJUserDetail(sjm);
//		System.out.println("SJUserDetail mId->" + sjm);
//		model.addAttribute("sjm", sjm2);
//		return "SJUserDetail";
//	}
	
	@RequestMapping(value="SJUserDetail")
	public String userDetail(HttpServletRequest request, String currentPage, String mId, Model model) {
		SJMember sjm = new SJMember();
		sjm.setmId(request.getParameter("mId"));
		sjm.setmNick(request.getParameter("mNick"));
		int userDetailTotal = ss.userDetailTotal(sjm);
		System.out.println("mId=>" + request.getParameter("mId"));	
		System.out.println("userDetailTotal=>" + userDetailTotal);		
		
		SJPaging pg1 = new SJPaging(userDetailTotal, currentPage);
		sjm.setStart(pg1.getStart());
		sjm.setEnd(pg1.getEnd());
		System.out.println("SJUserDetail getStart->" + pg1.getStart());
		System.out.println("SJUserDetail getEnd->" + pg1.getEnd());
		
		List<SJMember> sjmember = ss.SJUserDetail(sjm);
		
		SJMember sjmm = ss.SJDetail(mId);
		System.out.println("SJUserDetail mId->" + sjmm.getmId());
		System.out.println("SJUserDetail mNick->" + sjmm.getmNick());
		model.addAttribute("sjmm", sjmm);
		model.addAttribute("sjmember", sjmember);
		model.addAttribute("pg1", pg1);
		return "SJUserDetail";
	}
}
