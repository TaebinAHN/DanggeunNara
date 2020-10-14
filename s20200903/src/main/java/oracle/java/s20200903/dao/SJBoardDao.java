package oracle.java.s20200903.dao;

import java.util.List;

import oracle.java.s20200903.model.SJBoard;

public interface SJBoardDao {
	List<SJBoard>		SJblackListBoard(SJBoard sjb);
	int					total();
	SJBoard				SJblackListBoardRead(int pNum);
	int 				SJblackListBoardInsert(SJBoard sjb);	
	int 				SJblackListBoardUpdate(SJBoard sjb);
	int 				SJblackListBoardDelete(int pNum);
	void				SJUpdateViewCnt(int pNum);
}
