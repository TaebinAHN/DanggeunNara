package oracle.java.s20200903.service;

import java.util.List;

import oracle.java.s20200903.model.Member;

public interface MemberService {
	List<Member> 	list(Member sjm);
	int 			total();
}
