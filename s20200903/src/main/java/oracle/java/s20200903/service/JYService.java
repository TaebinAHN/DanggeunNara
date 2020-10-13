package oracle.java.s20200903.service;

import java.util.List;

import oracle.java.s20200903.model.JYPost;

public interface JYService {

	int total_Sharing();
	int total_Notice();

	
	List<JYPost> selectSharing(JYPost jyPost);

	JYPost selectSharingDetail(JYPost jyPost);

	List<JYPost> selectNotice(JYPost jyPost);

	JYPost selectNoticeDetail(JYPost jyPost);

	int insertNotice(JYPost jyPost);

	JYPost updateNoticeForm(JYPost jyPost);

	int updateNotice(JYPost jyPost);
	
	int insertSharing(JYPost jyPost);
	
	JYPost updateSharingForm(JYPost jyPost);
	
	int updateSharing(JYPost jyPost);
	
	int deleteNotice(JYPost jyPost);
	
	int deleteSharing(JYPost jyPost);




}
