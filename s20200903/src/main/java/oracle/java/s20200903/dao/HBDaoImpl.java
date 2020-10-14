package oracle.java.s20200903.dao;

import java.util.List;

import javax.mail.Session;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import oracle.java.s20200903.model.HBSaleBoard;
import oracle.java.s20200903.util.FileUtils;

@Repository("hbDao")
public class HBDaoImpl implements HBDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int total() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("HBTotal");
	}

	@Override
	public List<HBSaleBoard> list(HBSaleBoard sb) {
		System.out.println("List<saleBoard> dao......");
		return sqlSessionTemplate.selectList("HBListAll", sb);
	}

	@Override                      // 여기에 있는 매기인수를 VO로 선언해주기
	public HBSaleBoard HBSaleBoardRead(int pnum) {
		// TODO Auto-generated method stub
		System.out.println("HBDaoImpl HBSaleBoardRead start...");
		HBSaleBoard sb = new HBSaleBoard();
		try {
			sb = sqlSessionTemplate.selectOne("HBSaleBoardSelOne", pnum);
			System.out.println("HBDaoImpl HBSaleBoardRead getpNum -> " + sb.getPtitle());
		} catch (Exception e) {
			System.out.println("HBDaoImpl HBSaleBoardRead Exception -> " + e.getMessage());
		}
		return sb;
	}
	
	@Override
	public void updateViewCnt(int pnum) {
		// TODO Auto-generated method stub
		System.out.println("HBDaoImpl HBSaleBoardPhitUpdate start...");
		sqlSessionTemplate.update("updateViewCnt", pnum);
	}


	@Override
	public int insert(HBSaleBoard sb) {
		// TODO Auto-generated method stub
		System.out.println("HBDaoImpl insert start...");
		return sqlSessionTemplate.insert("insert", sb);
	}

	@Override
	public List<HBSaleBoard> listManager() {
		// TODO Auto-generated method stub
		System.out.println("HBDaoImpl listManager() start...");
		return sqlSessionTemplate.selectList("selectManager");
	}


	@Override
	public int delete(HBSaleBoard sb) {
		// TODO Auto-generated method stub
		System.out.println("HBDaoImpl delete start...");

		int result = 0;
		
		try {
			result = sqlSessionTemplate.delete("delete", sb);
			System.out.println("HBDaoImpl delete kkk ->" + result);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("HBDaoImpl delete start ->" + e.getMessage());
		}
		return result;
	}


	


}
