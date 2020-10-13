package oracle.java.s20200903.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200903.dao.JHDao;
import oracle.java.s20200903.model.JHBoard;

@Service
public class JHServiceImpl implements JHService {

	@Autowired
	private JHDao jhd;

	@Override
	public int jhtotal() {
		System.out.println("JHServiceImpl jhtotal");
		return jhd.jhtotal();
	}

	@Override
	public List<JHBoard> jhList(JHBoard jhb) {
		System.out.println("JHServiceImpl jhList");
		return jhd.jhList(jhb);
	}

	@Override
	public JHBoard jhRead(int pNum) {
		System.out.println("JHServiceImpl jhRead");
		return jhd.jhRead(pNum);
	}

	@Override
	public int jhDelete(int pNum) {
		System.out.println("JHServiceImpl jhDelete");
		return jhd.jhDelete(pNum);
	}

	@Override
	public int jhInsert(JHBoard jhb) {
		System.out.println("JHServiceImpl jhInsert");
		return jhd.jhInsert(jhb);
	}

	@Override
	public void jhHitUp(int pNum) {
		System.out.println("JHServiceImpl jhHitUp");
		jhd.jhHitUp(pNum);
	}

	@Override
	public int jhUpdate(JHBoard jhb) {
		System.out.println("JHServiceImpl jhUpdate");
		return jhd.jhUpdate(jhb);
	}

	@Override
	public JHBoard jhMember(String mId) {
		// TODO Auto-generated method stub
		return jhd.jhMember(mId);
	}
}
