package oracle.java.s20200903.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import oracle.java.s20200903.model.HBSaleBoard;


@Component("fileUtils")
public class FileUtils {
	
	private static final String filePath = "C:\\s20200903\\s20200903\\src\\main\\webapp\\img\\sale\\"; // 파일이 저장될 위치

	public List<HBSaleBoard> parseInsertFileInfo(HBSaleBoard sb, HttpServletRequest reqeust) throws Exception{
		
		/*
			Iterator은 데이터들의 집합체? 에서 컬렉션으로부터 정보를 얻어올 수 있는 인터페이스입니다.
			List나 배열은 순차적으로 데이터의 접근이 가능하지만, Map등의 클래스들은 순차적으로 접근할 수가 없습니다.
			Iterator을 이용하여 Map에 있는 데이터들을 while문을 이용하여 순차적으로 접근합니다.
		*/
		
		MultipartHttpServletRequest mpRequest=(MultipartHttpServletRequest)reqeust;
		Iterator<String> iterator = mpRequest.getFileNames();
		System.out.println("filePath 1 :"+filePath);
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String savedName = null;
		String storedFileName = null;
		
		
		List<HBSaleBoard> list = new ArrayList<HBSaleBoard>();
		
		
		File file = new File(filePath);
		

		
		 // 파일이 존재하는지 여부를 알기위해
		if(file.exists() == false) {
			file.mkdirs();  //만들고자 하는 디렉토리의 상위 디렉토리가 존재하지 않을 경우, 상위 디렉토리까지 생성

		}
		int i=1;
		
		
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			
			
			
			if(multipartFile.isEmpty() == false) {
				// 기존 파일 이름을 받고 확장자 저장
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				
				// 이름 값 변경을 위한 설정 
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS"); 
				int rand = (int)(Math.random()*1000);
				// 파일 이름 변경
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rand + "_" + originalFileName;


				//storedFileName = getRandomString() + originalFileExtension;
				System.out.println("filePath :" + filePath + reName);
				
				
				file = new File(filePath + reName);
				/*multipartFile.transferTo(file);*/
				multipartFile.transferTo(file);
				
				
				
				if(i==1) {
					System.out.println("originalFileName1 : "+reName);
					sb.setPimg1(reName);
				}
				if(i==2) {
					System.out.println("originalFileName2 : "+reName);
					sb.setPimg2(reName);
				}
				if(i==3) {
					System.out.println("originalFileName3 : "+reName);
					sb.setPimg3(reName);
				}
				if(i==4) {
					System.out.println("originalFileName4 : "+reName);
					sb.setPimg4(reName);
				}
				if(i==5) {
					System.out.println("originalFileName5 : "+reName);
					sb.setPimg5(reName);
				}
			}
			i++;
		}
		list.add(sb);
		return list;
	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}