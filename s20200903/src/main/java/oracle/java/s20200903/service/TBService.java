package oracle.java.s20200903.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import oracle.java.s20200903.model.HBSaleBoard;
import oracle.java.s20200903.model.NEPost;
import oracle.java.s20200903.model.TBMember;

public interface TBService {
//	List<TBMember> 		list(TBMember tbm);
	//회원가입
	int					joinMember(TBMember tbm);
	//아이디 중복체크
	String 				idCheck(String mId);
	//닉네임 중복체크
	String				checkNick(String mNick);
	//회원 로그인
	int 				loginMember(TBMember tbm);
	//비밀번호 찾기
	int					TBfindPwgo(TBMember tbm);
	//비밀번호 변경
	int					passwdUpdate(TBMember tbm);
	//마이페이지
	TBMember			TBmyPageUp(String mId);
	//회원정보수정
	int					userInfoUpdate(TBMember tbm);
	//회원 등급 체크
	int					checkMlevel(TBMember tbm);
	//회원탈퇴
	int					TBMemberLeave(TBMember tbm);
	//회원 상태 체크
	int					checkMstatus(TBMember tbm);
	//로그인 실패 카운트 +1
	int					mlf(TBMember tbm);
	//회원정지
	int					stopmember(TBMember tbm);
	//로그인 실패 카운트 체크
	int					checkMlf(TBMember tbm);
	// 아이디를 이용하여 닉네임 확인
	String				getMnick(TBMember tbm);
	//로그인 실패 카운트 초기화
	int					mlfReset(TBMember tbm);
	//나의 구매내역 (거래가능)
	List<NEPost>	 	toBuyListA(NEPost np);
	int					TBBuytotalA(HttpServletRequest request, NEPost np);
	//나의 구매내역 (거래중)
	List<NEPost>		toBuyListB(NEPost np);
	int					TBBuytotalB(HttpServletRequest request, NEPost np);
	
	//나의 판매내역
	int					TBSaletotal();
	List<HBSaleBoard> 	toSaleList(HBSaleBoard hsb);
	
}
