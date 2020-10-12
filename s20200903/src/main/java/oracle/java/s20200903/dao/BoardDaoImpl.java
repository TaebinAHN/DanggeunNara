package oracle.java.s20200903.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20200903.model.Board;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Board> blackListBoard(Board sjb) {
		// TODO Auto-generated method stub
		return session.selectList("BoardAll", sjb);
	}

	@Override
	public int total() {
		// TODO Auto-generated method stub
		return session.selectOne("blTotal");
	}

	@Override
	public Board blackListBoardRead(int pNum) {
		System.out.println("BoardDaoImpl start..");
		Board sjb = new Board();
		try {
			sjb = session.selectOne("blackListBoardRead", pNum);
			System.out.println("BoardDaoImpl blbr getPTitle-> "+ sjb.getpTitle());
		} catch (Exception e) {
			System.out.println("BoardDaoImpl detail Exception->"+ e.getMessage());
		}
		return sjb;
	}

	@Override
	public int insert(Board sjb) {
		// TODO Auto-generated method stub
		return session.insert("insert", sjb);
	}

	@Override
	public int blackListBoardUpdate(Board sjb) {
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
	public int blackListBoardDelete(int pNum) {
		System.out.println("BoardDaoImpl delete start....");		
		int kkk = 0;
		try {
			kkk = session.delete("sjblackListBoardDelete", pNum);
		} catch (Exception e) {
			System.out.println("BoardDaoImpl delete Exception->"+ e.getMessage());
		}
		return kkk;
	}
}
