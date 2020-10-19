package oracle.java.s20200903.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20200903.model.SJMember;

@Repository
public class SJMemberDaoImpl implements SJMemberDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<SJMember> adminList(SJMember sjm) {
		
		
		// TODO Auto-generated method stub
		return session.selectList("SJMemberAll", sjm);
	}

	@Override
	public int adminTotal() {
		// TODO Auto-generated method stub
		return session.selectOne("adminTotal");
	}

}
