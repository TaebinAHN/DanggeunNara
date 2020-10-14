package oracle.java.s20200903.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import oracle.java.s20200903.model.TBMember;

 
@Repository
public class TBDaoImpl implements TBDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<TBMember> list(TBMember tbm) {
		
		
		// TODO Auto-generated method stub
		return session.selectList("MemberAll", tbm);
	}

	@Override
	public int total() {
		// TODO Auto-generated method stub
		return session.selectOne("total");
	}

	@Override
	public int joinMember(TBMember tbm) {
		int result = 0;
		try {
			result = session.insert("joinMember", tbm);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
		
	}

	@Override
	@ResponseBody
	public String idCheck(String mId) { 
		// TODO Auto-generated method stub
		System.out.println(mId);
		return session.selectOne("idCheck", mId);
	}

	@Override
	public String checkNick(String mNick) {
		return session.selectOne("checkNick", mNick);
	}

	@Override
	public int loginMember(TBMember tbm) {
		int result = 0;
		try {
			result = session.selectOne("loginMember", tbm);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;

	}

	@Override
	public int TBfindPwgo(TBMember tbm) {
		int result = 0;
		try {
			result = session.selectOne("TBfindPwgo", tbm);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	@Override
	public int passwdUpdate(TBMember tbm) {
		int result = 0;
		try {
			result = session.update("passwdUpdate", tbm);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	@Override
	public TBMember TBmyPageUp(String mId) {
		TBMember tbm = new TBMember();
		try {
			tbm = session.selectOne("TBmyPageUp", mId);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return tbm;
	}

	@Override
	public int userInfoUpdate(TBMember tbm) {
		int result = 0;
		try {
			result = session.update("userInfoUpdate", tbm);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}	
		return result;
	}

	@Override
	public int checkMlevel(TBMember tbm) {
		int result = 0;
		try {
			result = session.selectOne("mLevel", tbm);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	@Override
	public int TBMemberLeave(TBMember tbm) {
		int result = 0;
		result = session.update("TBMemberLeave", tbm);
		return result;
	}

	@Override
	public int checkMstatus(TBMember tbm) {
		int result = 0;
		result = session.selectOne("checkMstatus", tbm);
		return result;
	} 


}
