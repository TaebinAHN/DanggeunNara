package oracle.java.s20200903.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ietf.jgss.Oid;
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

import oracle.java.s20200903.model.HBSaleBoard;
import oracle.java.s20200903.model.NEPost;
import oracle.java.s20200903.model.TBMember;
import oracle.java.s20200903.service.TBService;
import oracle.java.s20200903.service.TBtoListPaging;
import scala.util.hashing.Hashing;

@Controller
public class TBController {

	@Autowired
	private TBService ts;
	
	@Autowired
	private JavaMailSender mailSender; 
	
	
	// 페이지 호출 부분
	
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
		
		return "main";
	}
	
	@RequestMapping (value="TBlogin")
	public String login(TBMember tbm, Model model) {
		return "TBlogin";
	}
	
	@RequestMapping (value="TBjoinForm")
	public String joinForm(Model model) {
		return "TBjoinForm";
		
	}
	
	@RequestMapping (value="TBfindPw")
	public String TBfindPwPost(Model model) {
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
	
	@RequestMapping (value="TBLogout.do")
	public String TBLogout (HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "main";
	}
	
	@RequestMapping(value="TBmyPage")
	public String TBmyPage (HttpServletRequest request, String mId, Model model) {
		mId = request.getParameter("mId");
		TBMember tbm = ts.TBmyPageUp(mId);
		model.addAttribute("tbm", tbm);
		
		return "TBmyPage";
	}
	
	@RequestMapping(value="TBuserLeave")
	public String TBuserLeave (TBMember tbm, Model model) {
		
		return "TBuserLeave";
	}
	
	@RequestMapping (value="TBpicksList")
	public String TBpicksList (TBMember tbm, Model model) {
		
		return "TBpicksList";
	}
	
/*	@RequestMapping(value="TBtoSaleList")
	public String TBtoSaleList (TBMember tbm, Model model) {
		
		return "TBtoSaleList";
	}*/
	
/*	@RequestMapping (value="TBtoBuyList")
	public String TBtoBuyList(TBMember tbm, Model model) {
		
		return "TBtoBuyList";
	}*/
	
	// 기능부분
	
	
	@RequestMapping(value="userInfoUpdate")
	public String userInfoUpdate (HttpServletRequest request, HttpServletResponse response, TBMember tbm, Model model) throws IOException {
		PrintWriter pw = response.getWriter();
		MessageDigest messageDigest;
		try {
/*			SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
			byte[] bytes = new byte[16];
			random.nextBytes(bytes);
			String salt = new String(Base64.getEncoder().encode(bytes));*/
			
			String mixPassword = tbm.getmPw();
			
			messageDigest = MessageDigest.getInstance("SHA-512");
			messageDigest.update(mixPassword.getBytes());
//			messageDigest.update(salt.getBytes());
			String enPassword = String.format("%0128x", new BigInteger(1, messageDigest.digest()));
			tbm.setmPw(enPassword);

			System.out.println("enPassword ==>" + enPassword);
			response.setContentType("text/html charset=UTF-8");
			int result = ts.userInfoUpdate(tbm);
			if(result > 0) {
				pw.println("<script>alert('회원정보가 수정 되었습니다. 다시 로그인 후 이용 부탁드립니다.');</script>");
				pw.flush();
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return "forward:TBlogin.do";
	}
	
	@RequestMapping (value="joinMember.do", method=RequestMethod.POST)
	public String joinMember(TBMember tbm ,Model model) throws UnsupportedEncodingException {

		MessageDigest messageDigest;
		try {
/*			SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
			byte[] bytes = new byte[16];
			random.nextBytes(bytes);
			String salt = new String(Base64.getEncoder().encode(bytes));*/
			
			String mixPassword = tbm.getmPw();
			
			messageDigest = MessageDigest.getInstance("SHA-512");
			messageDigest.update(mixPassword.getBytes());
//			messageDigest.update(salt.getBytes());
			String enPassword = String.format("%0128x", new BigInteger(1, messageDigest.digest()));
			tbm.setmPw(enPassword);
			System.out.println(mixPassword);
			System.out.println(messageDigest);
//			System.out.println(salt);
			System.out.println("enPassword ==>" + enPassword);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		int result = ts.joinMember(tbm);
		return "forward:TBlogin.do";
	}
	
	@RequestMapping (value="loginMember", method=RequestMethod.POST)
	public String loginMember(HttpServletRequest request, HttpServletResponse response ,TBMember tbm, Model model) throws UnsupportedEncodingException, ServletException, IOException {	
		String mNick = ts.getMnick(tbm);
		MessageDigest messageDigest;
		try {
			
/*			SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
			byte[] bytes = new byte[16];
			random.nextBytes(bytes);
			String salt = new String(Base64.getEncoder().encode(bytes));*/
			
			String mixPassword = tbm.getmPw();
			
			messageDigest = MessageDigest.getInstance("SHA-512");
			messageDigest.update(mixPassword.getBytes());
//			messageDigest.update(salt.getBytes());
			String enPassword = String.format("%0128x", new BigInteger(1, messageDigest.digest()));
			
			tbm.setmPw(enPassword);
			
			int result = ts.loginMember(tbm);
			System.out.println("tbm.getmPw => " + tbm.getmPw());
			System.out.println("mNick" + mNick);
			response.setContentType("text/html charset=UTF-8");
			PrintWriter pw = response.getWriter();
			int checkMstatus = ts.checkMstatus(tbm);
			if(result > 0) {
				int checklevel = ts.checkMlevel(tbm);
				if(checkMstatus == 9) {
					pw.println("<script>alert('탈퇴된 회원입니다.');</script>");
					pw.flush();
					return "TBlogin";
				}
				if(checklevel == 3) {
					HttpSession session = request.getSession();
					session.setAttribute("mId", tbm.getmId());
					session.setAttribute("mNick", mNick);
					session.setAttribute("checklevel", checklevel);
					pw.println("<script>alert('관리자님 어서오세요.');</script>");
					pw.flush();
					return "forward:main.do";
				} else if(checklevel == 2) {
					pw.println("<script>alert('이용정지된 계정입니다.');</script>");
					pw.flush();
					return "TBlogin";
				}
				pw.println("<script>alert('어서오세요 환영합니다~');</script>");
				pw.flush();
				ts.mlfReset(tbm);
				HttpSession session = request.getSession();
				session.setAttribute("mId", tbm.getmId());
				session.setAttribute("mNick", mNick);
				System.out.println("tbm.getmNick()" + mNick);
				System.out.println("tbm.getmId()" + tbm.getmId());
				return "forward:main.do";
			} else {
				int checkMlf = ts.checkMlf(tbm);
				int mlfcnt = ts.mlf(tbm);
				if(checkMlf > 4) { 
					System.out.println("checkMlf ==>" + checkMlf);
					int stopmember = ts.stopmember(tbm);
					if(checkMstatus == 7) {
						System.out.println(checkMlf + "==" + tbm.getMlf());
						System.out.println(stopmember);
						pw.println("<script>alert('로그인 5회 입력 실패하여 비밀번호 변경 후 이용바랍니다.');</script>");
						pw.flush();
						return "TBlogin";
					}
				}
				pw.println("<script>alert('아이디와 비밀번호를 확인해주세요.');</script>");
				pw.flush();
				return "TBlogin";
			} 
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "TBlogin";
		}

	@RequestMapping(value="TBfindPwgo", method=RequestMethod.POST)
	public String TBfindPwgo(HttpServletRequest request, HttpServletResponse response, TBMember tbm, Model model) throws ServletException, IOException  {
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

		response.setContentType("text/html charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		MessageDigest messageDigest;
		try {			
/*			SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
			byte[] bytes = new byte[16];
			random.nextBytes(bytes);
			String salt = new String(Base64.getEncoder().encode(bytes));*/
			
			String mixPassword = tbm.getmPw();
			
			messageDigest = MessageDigest.getInstance("SHA-512");
			messageDigest.update(mixPassword.getBytes());
//			messageDigest.update(salt.getBytes());
			String enPassword = String.format("%0128x", new BigInteger(1, messageDigest.digest()));
			tbm.setmPw(enPassword);
			
			int result = ts.passwdUpdate(tbm);
			if(result > 0) {
				pw.println("<script>alert('변경이 완료 되었습니다. 다시 로그인 시도해주세요.');</script>");
				pw.flush();
				System.out.println("passwdUpdate result 값 : " + result);
			} else {
				pw.println("<script>alert('변경실패. 다시 입력해주세요.'); history.go(-1);</script>");
				pw.flush();
				System.out.println("passwdUpdate result 값 : " + result);
				return "redirect:TBfindPwUpdate.do";
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}	
		return "forward:TBlogin.do";
	}

	@RequestMapping (value="passwdUpdate", method=RequestMethod.GET)
	public String passwdUpdateGET(HttpServletRequest request, HttpServletResponse response, TBMember tbm, Model model) throws ServletException, IOException  {
		MessageDigest messageDigest;

		response.setContentType("text/html charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		try {					
/*			SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
			byte[] bytes = new byte[16];
			random.nextBytes(bytes);
			String salt = new String(Base64.getEncoder().encode(bytes));*/
			
			String mixPassword = tbm.getmPw();
			
			messageDigest = MessageDigest.getInstance("SHA-512");
			messageDigest.update(mixPassword.getBytes());
//			messageDigest.update(salt.getBytes());
			String enPassword = String.format("%0128x", new BigInteger(1, messageDigest.digest()));
			tbm.setmPw(enPassword);
			
			int result = ts.passwdUpdate(tbm);
			if(result > 0) {
				pw.println("<script>alert('변경이 완료 되었습니다. 다시 로그인 시도해주세요.');</script>");
				pw.flush();
				System.out.println("passwdUpdate result 값 : " + result);
			} else {
				pw.println("<script>alert('변경실패. 다시 입력해주세요.'); history.go(-1);</script>");
				pw.flush();
				System.out.println("passwdUpdate result 값 : " + result);
				return "TBfindPwUpdate";
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}	
		return "forward:TBlogin.do";
	}
	
	@RequestMapping(value="mailTransport")
	public String mailTransport(HttpServletRequest request, Model model, TBMember tbm) {
		HttpSession session;
		session = request.getSession();
		session.setAttribute("mId", request.getParameter("mId"));
		System.out.println("메일 발송 시작..");
		
		
		String adminMail = "danggeunnara@gmail.com"; //보내는 사람 메일
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
	
	
	@RequestMapping(value="TBMemberLeave", method=RequestMethod.POST)
	public String TBMemberLeave (HttpServletRequest request, HttpServletResponse response, TBMember tbm, Model model) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("mId", tbm.getmId());
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html charset=UTF-8");
		int result = ts.TBMemberLeave(tbm);
		if(result > 0) {
			pw.println("<script>alert('탈퇴되었습니다. 그동안 이용해주셔서 감사했습니다.');</script>");
			pw.flush();
			session.setAttribute("mId", null);
			return "TBlogin";
		} else {
			pw.println("<script>alert('탈퇴에 실패했습니다. 비밀번호를 확인 바랍니다.');</script>");
			pw.flush();
			return "TBuserLeave";
		}
		
	}
	
	@RequestMapping(value="TBtoBuyListUp") 
	public String toBuyList(HttpServletRequest request, TBMember tbm, NEPost np, String currentPage, Model model) {
		String mId = request.getParameter("mId");
		int Buytotal = ts.TBBuytotal(request, np);
		
		HttpSession session = request.getSession();
		session.setAttribute("mId", tbm.getmId());

		
		System.out.println("toBuyList mId => " + mId);
		System.out.println("total=>" + Buytotal);
		TBtoListPaging pg = new TBtoListPaging(Buytotal, currentPage);
		np.setStart(pg.getStart());
		np.setEnd(pg.getEnd());
		List<NEPost> blist = ts.toBuyList(np);
			
		model.addAttribute("blist", blist);
		model.addAttribute("pg", pg);
		
		return "TBtoBuyList";
	}

	@RequestMapping(value="TBtoSaleListUp") 
	public String toSaleList(HttpServletRequest request, TBMember tbm, HBSaleBoard hsb, String currentPage, Model model) {
		HttpSession session = request.getSession();
		session.setAttribute("mId", tbm.getmId());
		System.out.println("toSaleList mId => " + tbm.getmId());
		int Saletotal = ts.TBSaletotal();
		System.out.println("total=>" + Saletotal);
		TBtoListPaging pg = new TBtoListPaging(Saletotal, currentPage);
		hsb.setStart(pg.getStart());
		hsb.setEnd(pg.getEnd());
		List<HBSaleBoard> hblist = ts.toSaleList(hsb);

		model.addAttribute("hblist", hblist);
		model.addAttribute("pg", pg);
		
		return "TBtoSaleList";
	}
	
	// 중복검사 AJAX
	
	
	@RequestMapping(value="checkid", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String idCheck(String mId, Model model) {
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
		return sNick;
	}
	
}
