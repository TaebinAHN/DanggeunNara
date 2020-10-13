package oracle.java.s20200903.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import oracle.java.s20200903.model.JYPost;

@Repository
public class JYDaoImpl implements JYDao {

	@Autowired
	private SqlSession session;

	@Override
	public int total_Sharing() {
		return session.selectOne("total_Sharing");
	}
	@Override
	public int total_Notice() {
		return session.selectOne("total_Notice");
	}
	

	// 나눔 목록 출력
	@Override
	public List<JYPost> selectSharing(JYPost jyPost) {
		List<JYPost> listJYPost = null;

		try {
			listJYPost = session.selectList("selectSharing", jyPost);
			System.out.println("List<JYPost> listJYPost.size()->" + listJYPost.size());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		
		return listJYPost;

	}

	// 나눔 글 상세보기
	@Override
	public JYPost selectSharingDetail(JYPost jyPost) {

		JYPost resultJyPost = new JYPost();
		try {
			resultJyPost = session.selectOne("selectSharingDetail", jyPost);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return resultJyPost;
	}
	
	//나눔 글 등록
	@Override
	public int insertSharing(JYPost jyPost) {
		return session.insert("insertSharing",jyPost);
	}
	
	
	//나눔 글 수정 페이지 이동
	@Override
	public JYPost updateSharingForm(JYPost jyPost) {
		JYPost resultJyPost = new JYPost();
		try {
			resultJyPost = session.selectOne("updateSharingForm", jyPost);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return resultJyPost;
	}

	//나눔 글 수정
	@Override
	public int updateSharing(JYPost jyPost) {
		int result = 0;

		try {
			result = session.update("updateSharing", jyPost);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	//나눔글 삭제
	@Override
	public int deleteSharing(JYPost jyPost) {	
		int result = 0;
		
		try {
			result =session.delete("deleteSharing",jyPost);
		} catch (Exception e) {
			e.getMessage();
		}
		
		return result;
	}
	
	
	
	

	
	// 공지사항 목록 출력
	@Override
	public List<JYPost> selectNotice(JYPost jyPost) {
		return session.selectList("selectNotice", jyPost);
	}

	// 공지사항 상세보기
	@Override
	public JYPost selectNoticeDetail(JYPost jyPost) {

		JYPost resultJyPost = new JYPost();
		try {
			resultJyPost = session.selectOne("selectNoticeDetail", jyPost);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return resultJyPost;
	}

	//공지사항 등록
	@Override
	public int insertNotice(JYPost jyPost) {
		return session.insert("insertNotice", jyPost);
	}

	
	//공지사항 수정 페이지 이동
	@Override
	public JYPost updateNoticeForm(JYPost jyPost) {
		JYPost resultJyPost = new JYPost();
		try {
			resultJyPost = session.selectOne("updateNoticeForm", jyPost);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return resultJyPost;
	}

	//공지사항 수정
	@Override
	public int updateNotice(JYPost jyPost) {
		int result = 0;

		try {
			result = session.update("updateNotice", jyPost);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	//공지사항 삭제
	@Override
	public int deleteNotice(JYPost jyPost) {
		int result = 0;
		
		try {
			result =session.delete("deleteNotice",jyPost);
		} catch (Exception e) {
			e.getMessage();
		}
		
		return result;
	}
	


	


	
}
