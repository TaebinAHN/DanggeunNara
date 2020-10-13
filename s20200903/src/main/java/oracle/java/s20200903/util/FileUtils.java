package oracle.java.s20200903.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import oracle.java.s20200903.model.saleBoard;

@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "C:\\s20200903\\s20200903\\src\\main\\webapp\\img\\sale\\"; // 파일이 저장될 위치
	
	public List<saleBoard> parseInsertFileInfo(saleBoard sb, HttpServletRequest reqeust) throws Exception{
		
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
		String storedFileName = null;
		
		List<saleBoard> list = new ArrayList<saleBoard>();
		
		File file = new File(filePath);
		 // 파일이 존재하는지 여부를 알기위해
		if(file.exists() == false) {
			file.mkdirs();  //만들고자 하는 디렉토리의 상위 디렉토리가 존재하지 않을 경우, 상위 디렉토리까지 생성

		}
		int i=1;
		String[] strArr = new String [5];
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				System.out.println("filePath :"+filePath+originalFileName);
				file = new File(filePath + originalFileName);
				multipartFile.transferTo(file);
				
				switch(i) {
				case 0:
					System.out.println("HBSaleBoardWritePro strArr[0] -> " + strArr[i]);
					sb.setPimg1(strArr[i]);
					break;
				case 1:
					System.out.println("HBSaleBoardWritePro strArr[1] -> " + strArr[i]);
					sb.setPimg2(strArr[i]);
					break;
				case 2:
					System.out.println("HBSaleBoardWritePro strArr[2] -> " + strArr[i]);
					sb.setPimg3(strArr[i]);
					break;
				case 3:
					System.out.println("HBSaleBoardWritePro strArr[3] -> " + strArr[i]);
					sb.setPimg4(strArr[i]);
					break;
				case 4:
					System.out.println("HBSaleBoardWritePro strArr[4] -> " + strArr[i]);
					sb.setPimg5(strArr[i]);
					break;
					
				default:
					
					break;
				}
				
				/*if(i==1) {
					sb.setPimg1(originalFileName);
				}
				if(i==2) {
					sb.setPimg2(originalFileName);
				}
				if(i==3) {
					sb.setPimg3(originalFileName);
				}
				if(i==4) {
					sb.setPimg4(originalFileName);
				}
				if(i==5) {
					sb.setPimg5(originalFileName);
				}*/
				list.add(sb);
				i++;
			}
		}
		return list;
	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}