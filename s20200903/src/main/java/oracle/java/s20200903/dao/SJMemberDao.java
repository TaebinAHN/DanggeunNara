package oracle.java.s20200903.dao;

import java.util.List;

import oracle.java.s20200903.model.SJMember;

public interface SJMemberDao {
	List<SJMember>	adminList(SJMember sjm);
	int 			adminTotal();
}
