package oracle.java.s20200903.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20200903.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Member> list(Member sjm) {
		
		
		// TODO Auto-generated method stub
		return session.selectList("MemberAll", sjm);
	}

	@Override
	public int total() {
		// TODO Auto-generated method stub
		return session.selectOne("total");
	}

}
