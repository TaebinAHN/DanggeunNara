package oracle.java.s20200903.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import oracle.java.s20200903.dao.TBDao;
import oracle.java.s20200903.model.TBMember;

@Service
public class TBServiceImpl implements TBService {
	
	@Autowired
	private TBDao td;
	
	
	@Override
	public List<TBMember> list(TBMember tbm) {
		// TODO Auto-generated method stub
		return td.list(tbm);
	}


	@Override
	public int total() {
		// TODO Auto-generated method stub
		return td.total();
	}


	@Override
	public int joinMember(TBMember tbm) {
		// TODO Auto-generated method stub
		return td.joinMember(tbm);
	}




	@Override
	public String idCheck(String mId) {
		System.out.println("TBService idCheck start...");
		return td.idCheck(mId);
	}


	@Override
	public String checkNick(String mNick) {
		// TODO Auto-generated method stub
		return td.checkNick(mNick);
	}


	@Override
	public int loginMember(TBMember tbm) {
		System.out.println("loginMember start.... service");
		return td.loginMember(tbm);
	}


	@Override
	public int TBfindPwgo(TBMember tbm) {
		System.out.println("TBfindPwgo start.... service");
		return td.TBfindPwgo(tbm);
	}


	@Override
	public int passwdUpdate(TBMember tbm) {
		System.out.println("passwdUpdate start.... service");
		return td.passwdUpdate(tbm);
	}


	@Override
	public TBMember TBmyPageUp(String mId) {
		// TODO Auto-generated method stub
		return td.TBmyPageUp(mId);
	}


	@Override
	public int userInfoUpdate(TBMember tbm) {
		// TODO Auto-generated method stub
		return td.userInfoUpdate(tbm);
	}


	@Override
	public int checkMlevel(TBMember tbm) {
		// TODO Auto-generated method stub
		return td.checkMlevel(tbm);
	}




}
