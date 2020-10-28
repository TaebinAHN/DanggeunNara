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
	public HBSaleBoard HBSaleBoardRead(HBSaleBoard sb) {
		// TODO Auto-generated method stub
		System.out.println("HBDaoImpl HBSaleBoardRead start...");
		System.out.println("HBDaoImpl HBSaleBoardRead start... bid : " + sb.getbId() + ", pnum" + sb.getpNum());
		HBSaleBoard sb1 = new HBSaleBoard();
		try {
			sb1 = sqlSessionTemplate.selectOne("HBSaleBoardSelOne", sb);
			System.out.println("HBDaoImpl HBSaleBoardRead getpTitle -> " + sb1.getpTitle());
			System.out.println("HBDaoImpl HBSaleBoardRead getpTitle -> Pimg2 : " + sb1.getpImg2());
		} catch (Exception e) {
			System.out.println("HBDaoImpl HBSaleBoardRead Exception -> " + e.getMessage());
		}
		return sb1;
	}
	
	@Override
	public void updateViewCnt(int pNum) {
		// TODO Auto-generated method stub
		System.out.println("HBDaoImpl HBSaleBoardPhitUpdate start...");
		sqlSessionTemplate.update("updateViewCnt", pNum);
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

	
	@Override
	public HBSaleBoard HBSaleBoardUpdate(HBSaleBoard sb) {
		// TODO Auto-generated method stub
		HBSaleBoard resultSb1 = new HBSaleBoard();
		
		try {
			resultSb1 = sqlSessionTemplate.selectOne("HBSaleBoardUpdate", sb);
			System.out.println("HBDaoImpl HBSaleBoardUpdate start -> " + resultSb1);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("HBDaoImpl HBSaleBoardUpdate start -> " + e.getMessage());
		}
		return resultSb1;
	}
	
	
	@Override
	public int update(HBSaleBoard sb) {
		// TODO Auto-generated method stub
		System.out.println("HBDaoImpl update start....");
		
		int result = 0;
		try {
			result = sqlSessionTemplate.update("update", sb);
			System.out.println("HBDaoImpl update start...." + sb);
			System.out.println("result ==>" + result);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("HBDaoImpl update start...." + e.getMessage());
		}
		return result;
	}

	@Override
	public int likeUpdate(HBSaleBoard sb) {
		System.out.println("HBDaoImpl HBSaleBoardPhitUpdate start...");
		return sqlSessionTemplate.update("updateViewCnt", sb);
	}

/*	@Override
	public void like_checkupdate(int pnum) {
		// TODO Auto-generated method stub
		System.out.println("HBDaoImpl HBSaleBoardPhitUpdate start...");
		sqlSessionTemplate.update("like_checkupdate", pnum);
	}*/

	@Override
	public void dlike_checkUpdate(HBSaleBoard sb) {
		// TODO Auto-generated method stub
		System.out.println("HBDaoImpl HBSaleBoardPhitUpdate start...");
		sqlSessionTemplate.update("dlike_checkupdate", sb);
	}

	@Override
	public void likeUpdateCnt(int pNum) {
		// TODO Auto-generated method stub
		System.out.println("HBDaoImpl HBSaleBoardPhitUpdate start...");
		sqlSessionTemplate.update("likeUpdateCnt", pNum);
	}

	@Override
	public void dlikeUpdateCnt(int pNum) {
		// TODO Auto-generated method stub
		System.out.println("HBDaoImpl HBSaleBoardPhitUpdate start...");
		sqlSessionTemplate.update("dlikeUpdateCnt", pNum);
	}


	}

	