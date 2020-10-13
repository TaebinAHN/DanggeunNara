package oracle.java.s20200903.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import oracle.java.s20200903.dao.HBDao;
import oracle.java.s20200903.model.saleBoard;

@Service("hbService")
public class HBServiceImpl implements HBService {
	
	@Resource(name="hbDao")
	private HBDao hd;
	
	@Override
	public int total() {
		// TODO Auto-generated method stub
		return hd.total();
	}

	@Override
	public List<saleBoard> list(saleBoard sb) {
		// TODO Auto-generated method stub
		System.out.println("HBServiceImpl list....");
		return hd.list(sb);
	}


	@Override
	public saleBoard HBSaleBoardRead(int pnum) {
		// TODO Auto-generated method stub
		System.out.println("HBServiceImpl HBSaleBoardRead....");
		hd.updateViewCnt(pnum);
		return hd.HBSaleBoardRead(pnum);
	}
	

	

	@Override
	public int insert(saleBoard sb) {
		// TODO Auto-generated method stub
		System.out.println("HBServiceImpl insert....");
		return hd.insert(sb);
	}


	@Override
	public List<saleBoard> listManager() {
		// TODO Auto-generated method stub
		System.out.println("HBServiceImpl listManager()....");
		return hd.listManager();
	}

	@Override
	public int delete(int pnum) {
		// TODO Auto-generated method stub
		System.out.println("HBServiceImpl delete....");
		return hd.delete(pnum);
	}

	
	
	
}
	
