package oracle.java.s20200903.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200903.dao.BoardDao;
import oracle.java.s20200903.model.Board;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao bd;

	@Override
	public List<Board> blackListBoard(Board sjb) {
		// TODO Auto-generated method stub
		return bd.blackListBoard(sjb);
	}

	@Override
	public int total() {
		// TODO Auto-generated method stub
		return bd.total();
	}

	@Override
	public Board blackListBoardRead(int pNum) {
		// TODO Auto-generated method stub
		System.out.println("blbrServiceImpl pNum->"+pNum);
		return bd.blackListBoardRead(pNum);
	}

	@Override
	public int insert(Board sjb) {
		// TODO Auto-generated method stub
		return bd.insert(sjb);
	}

	@Override
	public int blackListBoardUpdate(Board sjb) {
		// TODO Auto-generated method stub
		return bd.blackListBoardUpdate(sjb);
	}

	@Override
	public int delete(int pNum) {
		// TODO Auto-generated method stub
		return bd.blackListBoardDelete(pNum);
	}
}
