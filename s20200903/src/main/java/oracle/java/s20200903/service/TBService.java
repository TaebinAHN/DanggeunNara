package oracle.java.s20200903.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import oracle.java.s20200903.model.NEPost;
import oracle.java.s20200903.model.TBMember;

public interface TBService {
	List<TBMember> 	list(TBMember tbm);
	int				TBBuytotal();
	int				joinMember(TBMember tbm);
	String 			idCheck(String mId);
	String			checkNick(String mNick);
	int 			loginMember(TBMember tbm);
	int				TBfindPwgo(TBMember tbm);
	int				passwdUpdate(TBMember tbm);
	TBMember		TBmyPageUp(String mId);
	int				userInfoUpdate(TBMember tbm);
	int				checkMlevel(TBMember tbm);
	int				TBMemberLeave(TBMember tbm);
	int				checkMstatus(TBMember tbm);
	int				mlf(TBMember tbm);
	int				stopmember(TBMember tbm);
	int				checkMlf(TBMember tbm);
	String			getMnick(TBMember tbm);
	int				mlfReset(TBMember tbm);
	List<NEPost> 	toBuyList(NEPost np);
	
}
