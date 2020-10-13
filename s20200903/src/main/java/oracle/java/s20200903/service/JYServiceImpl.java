package oracle.java.s20200903.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200903.dao.JYDao;
import oracle.java.s20200903.model.JYPost;


@Service
public class JYServiceImpl implements JYService {
	
	@Autowired
	private JYDao jyDao;

	@Override
	public int total_Sharing() {
		return jyDao.total_Sharing();
	}
	
	@Override
	public int total_Notice() {
		return jyDao.total_Notice();
	}
	
	

	// 나눔 목록 출력
	@Override
	public List<JYPost> selectSharing(JYPost jyPost) {
		return jyDao.selectSharing(jyPost);
	}

	// 나눔 글 상세보기
	@Override
	public JYPost selectSharingDetail(JYPost jyPost) {
		return jyDao.selectSharingDetail(jyPost);
	}

	
	
	//공지사항 목록 출력
	@Override
	public List<JYPost> selectNotice(JYPost jyPost) {
		return jyDao.selectNotice(jyPost);
	}

	//공지사항 상세보기
	@Override
	public JYPost selectNoticeDetail(JYPost jyPost) {		
		return jyDao.selectNoticeDetail(jyPost);
	}

	//공지사항 등록
	@Override
	public int insertNotice(JYPost jyPost) {
		return jyDao.insertNotice(jyPost);
	}

	@Override
	public JYPost updateNoticeForm(JYPost jyPost) {
		return jyDao.updateNoticeForm(jyPost);
	}

	@Override
	public int updateNotice(JYPost jyPost) {
		return jyDao.updateNotice(jyPost);
	}

	@Override
	public int insertSharing(JYPost jyPost) {
		return jyDao.insertSharing(jyPost);
	}

	@Override
	public JYPost updateSharingForm(JYPost jyPost) {
		return jyDao.updateSharingForm(jyPost);
	}

	@Override
	public int updateSharing(JYPost jyPost) {
		return jyDao.updateSharing(jyPost);
	}

	@Override
	public int deleteNotice(JYPost jyPost) {
		return jyDao.deleteNotice(jyPost);
	}

	@Override
	public int deleteSharing(JYPost jyPost) {
		return jyDao.deleteSharing(jyPost);
	}






	

}
