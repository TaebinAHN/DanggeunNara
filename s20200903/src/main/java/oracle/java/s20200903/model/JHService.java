package oracle.java.s20200903.service;

import java.util.List;

import oracle.java.s20200903.model.JHBoard;

public interface JHService {
	
	int				jhtotal();
	List<JHBoard> 	jhList(JHBoard jhb);
	JHBoard			jhRead(int pNum);
	int 			jhDelete(int pNum);
	int				jhInsert(JHBoard jhb);
	void			jhHitUp(int pNum);
	int				jhUpdate(JHBoard jhb);
	JHBoard			jhMember(String mId);
}
