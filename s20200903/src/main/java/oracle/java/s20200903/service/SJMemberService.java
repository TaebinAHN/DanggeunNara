package oracle.java.s20200903.service;

import java.util.List;

import oracle.java.s20200903.model.SJMember;

public interface SJMemberService {
	List<SJMember> 		adminList(SJMember sjm);
	int 				adminTotal();
	List<SJMember> 		SJUserDetail(SJMember sjm);
	int 				userDetailTotal(SJMember sjm);
	SJMember 			SJDetail(String mId);

}
