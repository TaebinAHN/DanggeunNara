package oracle.java.s20200903.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200903.dao.SJBoardDao;
import oracle.java.s20200903.model.SJBoard;

@Service
public class SJBoardServiceImpl implements SJBoardService {

	@Autowired
	private SJBoardDao bd;

	@Override
	public List<SJBoard> SJblackListBoard(SJBoard sjb) {
		// TODO Auto-generated method stub
		return bd.SJblackListBoard(sjb);
	}

	@Override
	public int total() {
		// TODO Auto-generated method stub
		return bd.total();
	}

	@Override
	public SJBoard SJblackListBoardRead(SJBoard sjb) {
		// TODO Auto-generated method stub
		bd.SJUpdateViewCnt(sjb);
		System.out.println("blbrServiceImpl pNum->"+sjb);
		return bd.SJblackListBoardRead(sjb);
	}

	@Override
	public int SJblackListBoardInsert(SJBoard sjb) {
		// TODO Auto-generated method stub
		return bd.SJblackListBoardInsert(sjb);
	}

	@Override
	public int SJblackListBoardUpdate(SJBoard sjb) {
		// TODO Auto-generated method stub
		return bd.SJblackListBoardUpdate(sjb);
	}

	@Override
	public int delete(int pNum) {
		// TODO Auto-generated method stub
		return bd.SJblackListBoardDelete(pNum);
	}

	@Override
	public SJBoard SJblackListBoardUpdateForm(SJBoard sjb) {
		// TODO Auto-generated method stub
		return bd.SJblackListBoardUpdateForm(sjb);
	}


}
