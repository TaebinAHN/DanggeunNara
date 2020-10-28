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
	
	private static final String filePath = "C:\\s20200903\\s20200903\\src\\main\\webapp\\img\\sale\\"; // ������ ����� ��ġ

	public List<HBSaleBoard> parseInsertFileInfo(HBSaleBoard sb, HttpServletRequest reqeust) throws Exception{
		
		
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
		

		
		 // ������ �����ϴ��� ���θ� �˱�����
		if(file.exists() == false) {
			file.mkdirs();  //������� �ϴ� ���丮�� ���� ���丮�� �������� ���� ���, ���� ���丮���� ����

		}
		int i=1;
		
		
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			
			
			
			if(multipartFile.isEmpty() == false) {
				// ���� ���� �̸��� �ް� Ȯ���� ����
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				
				// �̸� �� ������ ���� ���� 
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS"); 
				int rand = (int)(Math.random()*1000);
				// ���� �̸� ����
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rand + "_" + originalFileName;


				//storedFileName = getRandomString() + originalFileExtension;
				System.out.println("filePath :" + filePath + reName);
				
				
				file = new File(filePath + reName);
				/*multipartFile.transferTo(file);*/
				multipartFile.transferTo(file);
				
				
				
				if(i==1) {
					System.out.println("originalFileName1 : "+reName);
					sb.setpImg1(reName);
				}
				if(i==2) {
					System.out.println("originalFileName2 : "+reName);
					sb.setpImg2(reName);
				}
				if(i==3) {
					System.out.println("originalFileName3 : "+reName);
					sb.setpImg3(reName);
				}
				if(i==4) {
					System.out.println("originalFileName4 : "+reName);
					sb.setpImg4(reName);
				}
				if(i==5) {
					System.out.println("originalFileName5 : "+reName);
					sb.setpImg5(reName);
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