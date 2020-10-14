package oracle.java.s20200903.service;

import java.util.List;

import oracle.java.s20200903.model.SJMember;

public interface SJMemberService {
	List<SJMember> 	list(SJMember sjm);
	int 			total();
}
