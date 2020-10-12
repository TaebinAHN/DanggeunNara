package oracle.java.s20200903.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import oracle.java.s20200903.model.Member;
import oracle.java.s20200903.service.Paging;
import oracle.java.s20200903.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService ss;
	
	@RequestMapping(value="list")
	public String list(Member sjm, String currentPage, Model model) {
		int total = ss.total();
		System.out.println("total=>" + total);
		
		Paging pg = new Paging(total, currentPage);
		sjm.setStart(pg.getStart());
		sjm.setEnd(pg.getEnd());
		List<Member> list = ss.list(sjm);
		
		
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
		return "list";
	}	
}
