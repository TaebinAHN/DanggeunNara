package oracle.java.s20200903.controller;

import java.util.List;


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
		int total = ss.total();
		System.out.println("total=>" + total);
		
		SJPaging pg = new SJPaging(total, currentPage);
		sjm.setStart(pg.getStart());
		sjm.setEnd(pg.getEnd());
		List<SJMember> list = ss.list(sjm);
		
		
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
		return "SJMemberlist.do";
	}	
}
