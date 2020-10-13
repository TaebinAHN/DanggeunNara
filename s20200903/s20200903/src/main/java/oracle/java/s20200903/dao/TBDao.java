package oracle.java.s20200903.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import oracle.java.s20200903.model.TBMember;


public interface TBDao {
	List<TBMember> 	list(TBMember tbm);
	int				total();
	int				joinMember(TBMember tbm);
	String			idCheck(String mId);
	String			checkNick(String mNick);
	int				loginMember(TBMember tbm);
	int				TBfindPwgo(TBMember tbm);
	int				passwdUpdate(TBMember tbm);
	TBMember		TBmyPageUp(String mId);
	int				userInfoUpdate(TBMember tbm);
	int				checkMlevel(TBMember tbm);
}
