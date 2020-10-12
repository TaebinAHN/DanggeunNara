package oracle.java.s20200903.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200903.dao.MemberDao;
import oracle.java.s20200903.model.Member;

@Service
public class MemberServiceIpl implements MemberService {

	
	@Autowired
	private MemberDao sd;


	@Override
	public List<Member> list(Member sjm) {
		// TODO Auto-generated method stub
		return sd.list(sjm);
	}

	@Override
	public int total() {
		// TODO Auto-generated method stub
		return sd.total();
	}


}
