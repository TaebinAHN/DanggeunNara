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
			if(result > 0) {
				System.out.println("result 값: " + result);
			}
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
		System.out.println("mNick =>" + mNick);
		return session.selectOne("checkNick", mNick);
	}

	@Override
	public int loginMember(TBMember tbm) {

		System.out.println("loginMember start.... dao");
		int result = 0;
		try {
			System.out.println(tbm.getmId());
			System.out.println(tbm.getmPw());
			result = session.selectOne("loginMember", tbm);
			if(result > 0) {
				result = session.selectOne("mLevel", tbm);
				System.out.println("tbm.getmLevel()=>"+tbm.getmLevel());
				System.out.println("result 값: " + result);
				System.out.println("로그인 성공");
			} else {
				System.out.println("result 값: " + result);
				System.out.println("로그인 실패~");
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;

	}

	@Override
	public int TBfindPwgo(TBMember tbm) {
		System.out.println("TBfindPwgo start.... dao");
		int result = 0;
		try {
			System.out.println(tbm.getmId());
			System.out.println(tbm.getmName());
			result = session.selectOne("TBfindPwgo", tbm);
			System.out.println("TBfindPwgo try.....");
			if(result > 0) {
				System.out.println("result 값 : " + result);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	@Override
	public int passwdUpdate(TBMember tbm) {
		System.out.println("passwdUpdate tbm.getmId()->"+tbm.getmId());
		System.out.println("passwdUpdate tbm.getmPw()->"+tbm.getmPw());
		int result = 0;
		try {
			System.out.println("passwdUpdate....start...dao try...");
			result = session.update("passwdUpdate", tbm);
			if(result > 0) {
				System.out.println("result 값 : " + result);
				System.out.println("변경성공");
			} else {
				System.out.println("result 값 : " + result);
				System.out.println("변경실패");
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	@Override
	public TBMember TBmyPageUp(String mId) {
		System.out.println("EmpDaoImpl TBmyPageUp start...");
		TBMember tbm = new TBMember();
		try {
			tbm = session.selectOne("TBmyPageUp", mId);
			System.out.println(mId);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return tbm;
	} 


}
