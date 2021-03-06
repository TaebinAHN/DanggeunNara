package oracle.java.s20200903.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import oracle.java.s20200903.dao.TBDao;
import oracle.java.s20200903.model.HBSaleBoard;
import oracle.java.s20200903.model.NEPost;
import oracle.java.s20200903.model.TBMember;

@Service
public class TBServiceImpl implements TBService {
	
	@Autowired
	private TBDao td;
	
	
/*	@Override
	public List<TBMember> list(TBMember tbm) {
		// TODO Auto-generated method stub
		return td.list(tbm);
	}*/

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


	@Override
	public int TBMemberLeave(TBMember tbm) {
		// TODO Auto-generated method stub
		return td.TBMemberLeave(tbm);
	}


	@Override
	public int checkMstatus(TBMember tbm) {
		// TODO Auto-generated method stub
		return td.checkMstatus(tbm);
	}


	@Override
	public int mlf(TBMember tbm) {
		// TODO Auto-generated method stub
		return td.mlf(tbm);
	}


	@Override
	public int stopmember(TBMember tbm) {
		// TODO Auto-generated method stub
		return td.stopmember(tbm);
	}

	@Override
	public int checkMlf(TBMember tbm) {
		// TODO Auto-generated method stub
		return td.checkMlf(tbm);
	}


	@Override
	public String getMnick(TBMember tbm) {
		// TODO Auto-generated method stub
		return td.getMnick(tbm);
	}


	@Override
	public int mlfReset(TBMember tbm) {
		// TODO Auto-generated method stub
		return td.mlfReset(tbm);
	}

	@Override
	public int TBBuytotalA(HttpServletRequest request, NEPost np) {
		String mId = request.getParameter("mId");
		np.setmId(mId);
		return td.TBBuytotalA(request, np);
	}
	@Override
	public List<NEPost> toBuyListA(NEPost np) {
		
		return td.toBuyListA(np);
	}
	
	@Override
	public int TBBuytotalB(HttpServletRequest request, NEPost np) {
		String mId = request.getParameter("mId");
		np.setmId(mId);
		return td.TBBuytotalB(request, np);
	}
	@Override
	public List<NEPost> toBuyListB(NEPost np) {
		
		return td.toBuyListB(np);
	}

	@Override
	public List<HBSaleBoard> toSaleList(HBSaleBoard hsb) {
		// TODO Auto-generated method stub
		return td.toSaleList(hsb);
	}
	
	@Override
	public int TBSaletotal() {
		return td.TBSaletotal();
	}






}
