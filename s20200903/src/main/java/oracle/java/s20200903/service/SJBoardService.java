package oracle.java.s20200903.service;

import java.util.List;

import oracle.java.s20200903.model.SJBoard;


public interface SJBoardService {
	List<SJBoard>		SJblackListBoard(SJBoard sjb);
	int				total();
	int 			SJblackListBoardUpdate(SJBoard sjb);
	int 			delete(int pNum);
	int 			SJblackListBoardInsert(SJBoard sjb);
	SJBoard 		SJblackListBoardUpdateForm(SJBoard sjb);
	SJBoard 		SJblackListBoardRead(SJBoard sjb);

	
}
