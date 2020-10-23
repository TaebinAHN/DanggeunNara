package oracle.java.s20200903.dao;

import java.util.List;

import oracle.java.s20200903.model.JHBoard;

public interface JHDao {

	int				jhtotal();						//게시글 총 개수
	List<JHBoard> 	jhList(JHBoard jhb);			//게시글 리스트
	JHBoard			jhRead(int pNum);				//게시글 상세
	int 			jhDelete(int pNum);				//게시글 삭제
	int				jhInsert(JHBoard jhb);			//게시글 등록
	void			jhHitUp(int pNum);				//게시글 조회수 상승
	int				jhUpdate(JHBoard jhb);			//게시글 수정
	JHBoard			jhMember(String mId);			//게시글 등록폼에서 띄워줄 회원 정보 가져옴
	List<JHBoard>	jhComments(int pNum);			//댓글 리스트
	int				jhCtotal(int pNum);				//댓글 총 갯수
	int				jhCommInsert(JHBoard jhb);		//댓글 등록
	int				jhCommDelete(int cNum);			//댓글 삭제
	int				jhCommUpdate(JHBoard jhb);		//댓글 수정
	int				jhCommReseqUp(JHBoard jhb);		//답글 seq 증가
	int				jhCommReInsert(JHBoard jhb);	//답글 등록
	int				jhCommReReInsert(JHBoard jhb);	//답글의 답글 등록
}
