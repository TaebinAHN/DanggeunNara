package oracle.java.s20200903.dao;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import oracle.java.s20200903.model.HBSaleBoard;
import oracle.java.s20200903.model.NEPost;
import oracle.java.s20200903.model.TBMember;


public interface TBDao {
	List<TBMember> 	list(TBMember tbm);
	int					joinMember(TBMember tbm);
	String				idCheck(String mId);
	String				checkNick(String mNick);
	int					loginMember(TBMember tbm);
	int					TBfindPwgo(TBMember tbm);
	int					passwdUpdate(TBMember tbm);
	TBMember			TBmyPageUp(String mId);
	int					userInfoUpdate(TBMember tbm);
	int					checkMlevel(TBMember tbm);
	int					TBMemberLeave(TBMember tbm);
	int					checkMstatus(TBMember tbm);
	int					mlf(TBMember tbm);
	int					stopmember(TBMember tbm);
	int					checkMlf(TBMember tbm);
	String				getMnick(TBMember tbm);
	int					mlfReset(TBMember tbm);
	int					TBBuytotalA(HttpServletRequest request, NEPost np);
	List<NEPost> 		toBuyListA(NEPost np);
	int					TBBuytotalB(HttpServletRequest request, NEPost np);
	List<NEPost>		toBuyListB(NEPost np);
	int					TBSaletotal();
	List<HBSaleBoard>	toSaleList(HBSaleBoard sb);
}
