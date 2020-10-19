package oracle.java.s20200903.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import oracle.java.s20200903.model.HBSaleBoard;


public interface HBService {

	int                  total();
	List<HBSaleBoard>    list(HBSaleBoard sb);
	HBSaleBoard          HBSaleBoardRead(HBSaleBoard sb);
	int                  insert(HBSaleBoard sb);
	List<HBSaleBoard>    listManager();	
	HBSaleBoard          HBSaleBoardUpdate(HBSaleBoard sb);
	int                  update(HBSaleBoard sb);
	int                  delete(HBSaleBoard sb);
		
	
	
	
}
