package oracle.java.s20200903.dao;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import oracle.java.s20200903.model.HBsaleBoard;

public interface HBDao {

	int               total();
	List<HBsaleBoard>   list(HBsaleBoard sb);
	HBsaleBoard         HBSaleBoardRead(int pnum);
	void              updateViewCnt(int pnum);
	int               insert(HBsaleBoard sb);
	List<HBsaleBoard>   listManager();
	int               delete(int pnum);
	
	
	
}
