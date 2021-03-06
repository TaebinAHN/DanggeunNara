package oracle.java.s20200903.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20200903.model.JHBoard;
import oracle.java.s20200903.service.JHService;

@Repository
public class JHDaoImpl implements JHDao {
	
	@Autowired
	private SqlSession session;
	
	@Autowired
	private JHService jhs;

	@Override
	public int jhtotal() {
		System.out.println("JHDaoImpl jhtotal start..");
		return session.selectOne("jhtotal");
	}

	@Override
	public List<JHBoard> jhList(JHBoard jhb) {
		System.out.println("JHDaoImpl jhList start..");
		return session.selectList("BRBoardAll", jhb);
	}

	@Override
	public JHBoard jhRead(int pNum) {
		System.out.println("JHDaoImpl jhRead start..");
		JHBoard jhBoard = new JHBoard();
		
		try {
			jhBoard = session.selectOne("jhBRBoardRead",     pNum);
			//       					mapper ID      , Parameter
			//JHBoard.xml의 jhBRBoardRead SQL문에 pNum을 세팅 후 실행			
			System.out.println("JHDaoImpl jhRead getpNum->" + jhBoard.getpNum());
		} catch (Exception e) {
			System.out.println("JHDaoImpl jhRead Exception->"+e.getMessage());
		}
		return jhBoard;
	}

	@Override
	public int jhDelete(int pNum) {
		System.out.println("JHDaoImpl jhDelete start..");
		System.out.println("pNum" + pNum);
		int dn = 0;
		try {
			dn  = session.delete("jhBRBoardDelete", pNum);
			//					   mapper ID      , Parameter
			//JHBoard.xml의 jhBRBoardDelete SQL문에 pNum을 세팅 밑 실행	
			System.out.println("EmpDaoImpl delete dn->" + dn);
		} catch (Exception e) {
			System.out.println("EmpDaoImpl delete Exception->"+e.getMessage());
		}
		return dn;
	}

	@Override
	public int jhInsert(JHBoard jhb) {
		System.out.println("JHDaoImpl jhInsert start..");		
		//JHBoard.xml의 inset 중 jhBRBoardInsert 의 SQL문에 jhb의 값들을 넣고 실행
		return session.insert("jhBRBoardInsert",jhb);
	}

	@Override
	public void jhHitUp(int pNum) {
		System.out.println("JHDaoImpl jhHitUp start..");
		int a = 0;
		a = session.update("jhBRreadCount", pNum);
		System.out.println("조회수 증가 a: " + a);		
	}

	@Override
	public int jhUpdate(JHBoard jhb) {
		System.out.println("JHDaoImpl jhUpdate start..");
		return session.update("jhBRBoardUpdate", jhb);
	}

	@Override
	public JHBoard jhMember(String mId) {
		System.out.println("JHDaoImpl jhMember start..");
		return session.selectOne("jhmemberselect", mId);
	}

	@Override
	public List<JHBoard> jhComments(int pNum) {
		System.out.println("JHDaoImpl jhComments start..");
		return session.selectList("jhCommentsAll", pNum);
	}

	@Override
	public int jhCtotal(int pNum) {
		System.out.println("JHDaoImpl jhCtotal start..");
		return session.selectOne("jhCtotal", pNum);
	}

	@Override
	public int jhCommInsert(JHBoard jhb) {
		System.out.println("JHDaoImpl jhCommInsert start..");
		return session.insert("jhBRCommentsInsert",jhb);
	}

	@Override
	public int jhCommDelete(int cNum) {
		System.out.println("JHDaoImpl jhCommDelete start..");
		return session.delete("jhCommentsDelete", cNum);
	}

	@Override
	public int jhCommUpdate(JHBoard jhb) {
		System.out.println("JHDaoImpl jhCommUpdate start..");
		return session.update("jhCommentsUpdate", jhb);
	}
	
	@Override
	public int jhCommReseqUp(JHBoard jhb) {
		System.out.println("JHDaoImpl jhCommReseqUp start..");
		return session.update("jhCommentsReplySeqUp", jhb);
	}

	@Override
	public int jhCommReInsert(JHBoard jhb) {
		System.out.println("JHDaoImpl jhCommReInsert start..");
		return session.insert("jhCommentsReplyInsert",jhb);
	}

	@Override
	public int jhCommReReInsert(JHBoard jhb) {
		System.out.println("JHDaoImpl jhCommReReInsert start..");
		return session.insert("jhCommentsReReInsert",jhb);
	}

	

}
