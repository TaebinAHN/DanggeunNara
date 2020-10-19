package oracle.java.s20200903.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200903.dao.SJMemberDao;
import oracle.java.s20200903.model.SJMember;

@Service
public class SJMemberServiceIpl implements SJMemberService {

	
	@Autowired
	private SJMemberDao sd;


	@Override
	public List<SJMember> adminList(SJMember sjm) {
		// TODO Auto-generated method stub
		return sd.adminList(sjm);
	}

	@Override
	public int adminTotal() {
		// TODO Auto-generated method stub
		return sd.adminTotal();
	}


}
