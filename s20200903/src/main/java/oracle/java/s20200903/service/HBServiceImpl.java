package oracle.java.s20200903.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import oracle.java.s20200903.dao.HBDao;
import oracle.java.s20200903.model.HBSaleBoard;


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
	public List<HBSaleBoard> list(HBSaleBoard sb) {
		// TODO Auto-generated method stub
		System.out.println("HBServiceImpl list....");
		return hd.list(sb);
	}

	@Override
	public HBSaleBoard HBSaleBoardRead(HBSaleBoard sb) {
		// TODO Auto-generated method stub
		System.out.println("HBServiceImpl HBSaleBoardRead sb ->" + sb);
		hd.updateViewCnt(sb.getpNum());
		return hd.HBSaleBoardRead(sb);
	}
	

	

	@Override
	public int insert(HBSaleBoard sb) {
		// TODO Auto-generated method stub
		System.out.println("HBServiceImpl insert....");
		return hd.insert(sb);
	}


	@Override
	public List<HBSaleBoard> listManager() {
		// TODO Auto-generated method stub
		System.out.println("HBServiceImpl listManager()....");
		return hd.listManager();
	}

	@Override
	public HBSaleBoard HBSaleBoardUpdate(HBSaleBoard sb) {
		// TODO Auto-generated method stub
		System.out.println("HBServiceImpl HBSaleBoardUpdate....");
		return hd.HBSaleBoardUpdate(sb);
	}
	
	@Override
	public int update(HBSaleBoard sb) {
		// TODO Auto-generated method stub
		System.out.println("HBServiceImpl update....");
		return hd.update(sb);
	}
	

	@Override
	public int delete(HBSaleBoard sb) {
		// TODO Auto-generated method stub
		System.out.println("HBServiceImpl delete sb->"+sb);
		return hd.delete(sb);
	}

	@Override
	public int likeUpdate(HBSaleBoard sb) {
		// TODO Auto-generated method stub
		System.out.println("HBServiceImpl update....");
		hd.likeUpdateCnt(sb.getpNum());
		return hd.likeUpdate(sb);
	}

/*	@Override
	public void like_checkupdate(HBSaleBoard sb) {
		// TODO Auto-generated method stub
		System.out.println("HBServiceImpl update....");
		hd.like_checkupdate(sb.getPnum());
		return;
	}*/

	@Override
	public void dlike_checkUpdate(HBSaleBoard sb) {
		// TODO Auto-generated method stub
		System.out.println("HBServiceImpl update....");
		hd.dlikeUpdateCnt(sb.getpNum());
		hd.dlike_checkUpdate(sb);
		return;
	}






	
	
	
}
	
