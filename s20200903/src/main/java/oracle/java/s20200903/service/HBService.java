package oracle.java.s20200903.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import oracle.java.s20200903.model.saleBoard;

public interface HBService {

	int                total();
	List<saleBoard>    list(saleBoard sb);
	saleBoard          HBSaleBoardRead(int pnum);
	int                insert(saleBoard sb);
	List<saleBoard>    listManager();
	int                delete(int pnum);
	
	
	
	
}
