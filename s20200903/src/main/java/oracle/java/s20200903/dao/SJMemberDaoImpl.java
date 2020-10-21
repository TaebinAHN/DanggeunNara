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
 


	
	@Override
	public List<SJMember> SJUserDetail(SJMember sjm) {
		System.out.println("SJMemberDaoImpl SJUserDetail start");
//		SJMember sjm2 = new SJMember();
//		try {
//			sjm2 = session.selectList("SJUserDetail", sjm);
//			System.out.println("SJMemberDaoImpl detail getmNick-> "+ sjm.getmNick());
//			System.out.println("SJMemberDaoImpl detail getpTitle-> "+ sjm.getpTitle());
//		} catch (Exception e) {
//			System.out.println("BoardDaoImpl detail Exception->"+ e.getMessage());
//		}
		return session.selectList("SJUserDetail", sjm);
	}
	
	@Override
	public int userDetailTotal(SJMember sjm) {
		int result = session.selectOne("userDetailTotal", sjm);
		System.out.println("SJMemberDaoImpl userDetailTotal start" + result);
		return result;
	}

	@Override
	public SJMember SJDetail(String mId) {
		System.out.println("SJMemberDaoImpl SJDetail start..");
		SJMember sjmm = new SJMember();
		try {
			sjmm = session.selectOne("SJDetail",    mId);
			System.out.println("EmpDaoImpl detail getEname->"+sjmm.getmNick());
		} catch (Exception e) {
			System.out.println("EmpDaoImpl detail Exception->"+e.getMessage());
		}
		
	return sjmm;
	}
}
