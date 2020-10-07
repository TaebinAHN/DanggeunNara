package oracle.java.s20200903.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import oracle.java.s20200903.model.TBMember;
import oracle.java.s20200903.service.TBService;
import oracle.java.s20200903.service.Paging;

@Controller
public class TBController {
	
	@Autowired
	private TBService ts;
	
	@Autowired
	private JavaMailSender mailSender; 
	
/*	@RequestMapping(value="list")
	public String list(TBMember tbm, String currentPage, Model model) {
		int total = ts.total();
		System.out.println("total=>" + total);
		
		Paging pg = new Paging(total, currentPage);
		tbm.setStart(pg.getStart());
		tbm.setEnd(pg.getEnd());
		List<TBMember> list = ts.list(tbm);
		
		
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
		
		
		return "list";
	}*/

	@RequestMapping (value="main")
	public String main(Model model) {
		
		return "Main2";
	}
	
	@RequestMapping (value="TBlogin")
	public String login(TBMember tbm, Model model) {
		
		return "TBlogin";
	}
	
	@RequestMapping(value="mainLogin", method=RequestMethod.POST) 
	public String mainLogin(Model model) {
		
		return "mainLogin";
	}
	
	@RequestMapping (value="TBjoinForm")
	public String joinForm(Model model) {

		return "TBjoinForm";
		
	}
	
	@RequestMapping (value="TBfindPw", method=RequestMethod.GET)
	public String TBfindPwGet(Model model) {
		System.out.println("TBController TBfindPwGet start...");
		return "TBfindPw";
	}
	@RequestMapping (value="TBfindPw", method=RequestMethod.POST)
	public String TBfindPwPost(Model model) {
		System.out.println("TBController TBfindPwPost start...");
		return "TBfindPw";
	}
	
	@RequestMapping (value="TBfindPwReset")
	public String TBfindPwReset(Model model) {
		
		return "TBfindPwReset";
	}
	
	@RequestMapping (value="TBfindPwUpdate")
	public String TBfindPwUpdate(Model model) {
		
		return "TBfindPwUpdate";
	}
	
	@RequestMapping (value="TBLogout")
	public String TBLogout (HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "Main2";
	}
	
	@RequestMapping(value="TBmyPage")
	public String TBmyPage (HttpServletRequest request, String mId, Model model) {
		System.out.println("controller TBmyPageUp start...");
		mId = request.getParameter("mId");
		TBMember tbm = ts.TBmyPageUp(mId);
		System.out.println("TBmyPageUp controller"+mId);
		System.out.println("controller ts.TBmyPageUp after..");
		if (tbm != null) {
			System.out.println("값 있음");
			System.out.println(tbm.getmName());
			System.out.println(tbm.getmNick());
		}
		model.addAttribute("tbm", tbm);
		
		return "TBmyPage";
	}
	
	@RequestMapping (value="joinMember", method=RequestMethod.POST)
	public String joinMember(TBMember tbm ,Model model) {
		System.out.println("joinMember() start,..");
		int result = ts.joinMember(tbm);
		System.out.println("TBController joinMember start..." + result);
		if(result > 0) {
			System.out.println("joinMember result 값 : " + result);
		} else {
			model.addAttribute("msg", "");
		}
		if(tbm.getmSms() != null) {
			tbm.setmSms("동의");
		} else if (tbm.getmSms() == null){
			tbm.setmSms("비동의");
		}
		
		if(tbm.getmTel() != null) {
			tbm.setmTel("동의");
		} else if(tbm.getmTel() == null) {
			tbm.setmTel("비동의");
		}
		
		return "redirect:TBlogin.do";
	}
	
	@RequestMapping (value="loginMember", method=RequestMethod.POST)
	public String loginMember(HttpServletRequest request, HttpServletResponse response ,TBMember tbm, Model model) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("mId", tbm.getmId());
		
		System.out.println("tbm.getmLevel()=>"+tbm.getmLevel());

		System.out.println(session.getAttribute("mId"));
		System.out.println(session.getAttribute("mNick"));
		System.out.println(session.getAttribute("mName"));
		int result = ts.loginMember(tbm);
		response.setContentType("text/html charset=UTF-8");
		PrintWriter pw = response.getWriter();
		if(result > 0) {
			pw.println("<script>alert('어서오세요 환영합니다~');</script>");
			pw.flush();
			System.out.println("loginMember result 값 : " + result);
			if(tbm.getmLevel() == 3) {
				pw.println("<script>alert('관리자님 어서오세요.');</script>");
				pw.flush();
				return "forward:main.do";
			}
			return "forward:main.do";
		} else {
			pw.println("<script>alert('아이디와 비밀번호를 확인해주세요.');</script>");
			pw.flush();
			return "TBlogin";
		} 
	}
	
	@RequestMapping(value="TBfindPwgo", method=RequestMethod.POST)
	public String TBfindPwgo(HttpServletRequest request, HttpServletResponse response, TBMember tbm, Model model) throws ServletException, IOException  {
		HttpSession session = request.getSession();
		session.setAttribute("mId", tbm.getmId());
		System.out.println(session.getAttribute("mId")); 
		int result = ts.TBfindPwgo(tbm);
		if(result > 0) {
			System.out.println("TBfindPwgo result 값 : " + result);
			return "forward:mailTransport.do";
		} else {
			System.out.println("입력한 정보와 일치하는 회원이 없습니다.");
			return "redirect:TBfindPw.do";
		}
		
	}
	@RequestMapping(value="TBfindPwgo", method=RequestMethod.GET)
	public String TBfindPwgoGet(HttpServletRequest request, HttpServletResponse response, TBMember tbm, Model model) throws ServletException, IOException  {
		HttpSession session = request.getSession();
		session.setAttribute("mId", tbm.getmId());
		System.out.println(session.getAttribute("mId")); 
		int result = ts.TBfindPwgo(tbm);
		if(result > 0) {
			System.out.println("TBfindPwgo result 값 : " + result);
			return "forward:mailTransport.do";
		} else {
			System.out.println("입력한 정보와 일치하는 회원이 없습니다.");
			return "redirect:TBfindPw.do";
		}
		
	}
	
	@RequestMapping (value="passwdUpdate", method=RequestMethod.POST)
	public String passwdUpdatePOST(HttpServletRequest request, HttpServletResponse response, TBMember tbm, Model model) throws ServletException, IOException  {
		System.out.println("controller tbm.getmId()=>" + " " + tbm.getmId());
		System.out.println("controller getmPw->" + " " + tbm.getmPw());
		int result = ts.passwdUpdate(tbm);
		response.setContentType("text/html charset=UTF-8");
		PrintWriter pw = response.getWriter();
		if(result > 0) {
			pw.println("<script>alert('변경이 완료 되었습니다. 다시 로그인 시도해주세요.');</script>");
			pw.flush();
			System.out.println("passwdUpdate result 값 : " + result);
			return "forward:TBlogin.do";
		} else {
			pw.println("<script>alert('변경실패. 다시 입력해주세요.'); history.go(-1);</script>");
			pw.flush();
			System.out.println("passwdUpdate result 값 : " + result);
			return "redirect:TBfindPwUpdate.do";
		}
	}

	@RequestMapping (value="passwdUpdate", method=RequestMethod.GET)
	public String passwdUpdateGET(HttpServletRequest request, HttpServletResponse response, TBMember tbm, Model model) throws ServletException, IOException  {
		System.out.println("controller tbm.getmId()=>" + " " + tbm.getmId());
		System.out.println("controller getmPw->" + " " + tbm.getmPw());
		int result = ts.passwdUpdate(tbm);
		response.setContentType("text/html charset=UTF-8");
		PrintWriter pw = response.getWriter();
		if(result > 0) {
			pw.println("<script>alert('변경이 완료 되었습니다. 다시 로그인 시도해주세요.');</script>");
			pw.flush();
			System.out.println("passwdUpdate result 값 : " + result);
			return "forward:TBlogin.do";
		} else {
			pw.println("<script>alert('변경실패. 다시 입력해주세요.'); history.go(-1);</script>");
			pw.flush();
			System.out.println("passwdUpdate result 값 : " + result);
			return "redirect:TBfindPwUpdate.do";
		}
	}
	
	@RequestMapping(value="mailTransport")
	public String mailTransport(HttpServletRequest request, Model model, TBMember tbm) {
		HttpSession session;
		session = request.getSession();
		session.setAttribute("mId", tbm.getmId());
		System.out.println("메일 발송 시작..");
		
		
		String adminMail = "danggeunnara@gmail.com"; //보내는 사람 메일
		System.out.println(adminMail);
		String userMail = (String) session.getAttribute("mId"); // 받는사람 메일
		String mailTitle = "당근나라 비밀번호 재설정 링크 입니다.";
		try {
			MimeMessage mailmessage = mailSender.createMimeMessage();
			MimeMessageHelper mailmessageHelper = new MimeMessageHelper(mailmessage, true, "UTF-8");
			mailmessageHelper.setFrom(adminMail);    // 보내는 사람 메일주소
			mailmessageHelper.setTo(userMail);       // 받는 사람 메일주소
			mailmessageHelper.setSubject(mailTitle); // 메일 제목
			mailmessageHelper.setText("http://localhost:8186/s20200903/TBfindPwUpdate.do?mId="+tbm.getmId());
			mailSender.send(mailmessage);
			model.addAttribute("check", 1);          // 정상 전달
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("check", 2);			 // 전송 실패
		}
		
		
		return "TBfindPwReset";
	}
	
	
	@RequestMapping(value="checkid", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String idCheck(String mId, Model model) {
//		System.out.println("mId => " + mId);
		String sId = ts.idCheck(mId);
		if(sId==null) {
			model.addAttribute("msg", "사용가능한 아이디 입니다.");
		} else {
			model.addAttribute("msg", "중복된 아이디 입니다.");
		}
		return sId;
	}
	
	@RequestMapping(value="checkNick", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String nickCheck(String mNick, Model model) {
		
		String sNick = ts.checkNick(mNick);
		if(sNick == null) {
			model.addAttribute("msg", "사용가능한 닉네임	 입니다.");
		} else {
			model.addAttribute("msg", "중복된 닉네임 입니다.");
		}
		System.out.println("sNick =>" + sNick);
		return sNick;
	}
}
