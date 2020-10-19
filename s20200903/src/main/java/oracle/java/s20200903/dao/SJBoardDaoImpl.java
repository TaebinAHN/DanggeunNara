package oracle.java.s20200903.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20200903.model.SJBoard;

@Repository
public class SJBoardDaoImpl implements SJBoardDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<SJBoard> SJblackListBoard(SJBoard sjb) {
		// TODO Auto-generated method stub
		return session.selectList("BoardAll", sjb);
	}

	@Override
	public int total() {
		// TODO Auto-generated method stub
		return session.selectOne("blTotal");
	}

	@Override
	public SJBoard SJblackListBoardRead(SJBoard sjb) {
		System.out.println("BoardDaoImpl start..");
		SJBoard sjb2  = new SJBoard();
		try {
			sjb2 = session.selectOne("blackListBoardRead", sjb);
			System.out.println("BoardDaoImpl blbr getPTitle-> "+ sjb.getpTitle());
		} catch (Exception e) {
			System.out.println("BoardDaoImpl detail Exception->"+ e.getMessage());
		}
		return sjb2;
	}
	@Override
	public int SJblackListBoardInsert(SJBoard sjb) {
		// TODO Auto-generated method stub
		return session.insert("SJblackListBoardInsert", sjb);
	}
	
	@Override
	public SJBoard SJblackListBoardUpdateForm(SJBoard sjb) {
		System.out.println("BoardDaoImpl start..");
		SJBoard sjb2  = new SJBoard();
		try {
			sjb2 = session.selectOne("blackListBoardRead", sjb);
			System.out.println("BoardDaoImpl blbr getPTitle-> "+ sjb.getpTitle());
		} catch (Exception e) {
			System.out.println("BoardDaoImpl detail Exception->"+ e.getMessage());
		}
		return sjb2;
	}

	@Override
	public int SJblackListBoardUpdate(SJBoard sjb) {
		System.out.println("BoardDaoImpl update start....");
		int kkk=0;
		try {
			kkk = session.update("sjblackListBoardUpdate", sjb);
		} catch (Exception e) {
			System.out.println("BoardDaoImpl update Exception->"+ e.getMessage());
		}
		return kkk;
	}

	@Override
	public int SJblackListBoardDelete(int pNum) {
		System.out.println("BoardDaoImpl delete start....");		
		int kkk = 0;
		try {
			kkk = session.delete("SJblackListBoardDelete", pNum);
		} catch (Exception e) {
			System.out.println("BoardDaoImpl delete Exception->"+ e.getMessage());
		}
		return kkk;
	}

	@Override
	public void SJUpdateViewCnt(SJBoard sjb) {
		// TODO Auto-generated method stub
		session.update("SJUpdateViewCnt", sjb);
	}




}
