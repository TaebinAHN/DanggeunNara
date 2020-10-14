package oracle.java.s20200903.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import oracle.java.s20200903.model.HBSaleBoard;


public interface HBService {

	int                  total();
	List<HBSaleBoard>    list(HBSaleBoard sb);
	HBSaleBoard          HBSaleBoardRead(int pnum);
	int                  insert(HBSaleBoard sb);
	List<HBSaleBoard>    listManager();
	int                  delete(HBSaleBoard sb);
	
	
	
	
}
