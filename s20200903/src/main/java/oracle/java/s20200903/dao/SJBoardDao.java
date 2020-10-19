package oracle.java.s20200903.dao;

import java.util.List;

import oracle.java.s20200903.model.SJBoard;

public interface SJBoardDao {
	List<SJBoard>		SJblackListBoard(SJBoard sjb);
	int					total();
	SJBoard 			SJblackListBoardRead(SJBoard sjb);
	int 				SJblackListBoardInsert(SJBoard sjb);	
	SJBoard 			SJblackListBoardUpdateForm(SJBoard sjb);
	int 				SJblackListBoardUpdate(SJBoard sjb);
	int 				SJblackListBoardDelete(int pNum);
	void 				SJUpdateViewCnt(SJBoard sjb);
}

