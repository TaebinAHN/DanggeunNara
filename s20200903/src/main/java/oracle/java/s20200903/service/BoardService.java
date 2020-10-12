package oracle.java.s20200903.service;

import java.util.List;

import oracle.java.s20200903.model.Board;


public interface BoardService {
	List<Board>		blackListBoard(Board sjb);
	int				total();
	Board			blackListBoardRead(int pNum);
	int 			insert(Board sjb);
	int 			blackListBoardUpdate(Board sjb);
	int 			delete(int pNum);
	
}
