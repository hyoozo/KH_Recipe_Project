package com.boot.common.file;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.print.DocFlavor.URL;

import org.apache.jasper.tagplugins.jstl.core.Url;
import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FileUploadUtil {
	
	public static void makeDir(String docRoot){
		File fileDir =new File(docRoot);
		if(fileDir.exists()){
			return;
		}
		fileDir.mkdirs();
	}
	
	public static String fileUpload(MultipartFile file, String fileName) throws IOException{
		log.info("fileUpload 호출 성공 ");
		
		String	real_name=null;
		String org_name = file.getOriginalFilename();
		log.info("업로드 파일명 :" +org_name);
		
		
		if(org_name != null && (!org_name.equals(""))){
			real_name = fileName +"_"+ System.currentTimeMillis() +"_"+ org_name;
			
			String docRoot = "C://uploadStorage//"+fileName;
			makeDir(docRoot);
				
			File fileAdd = new File(docRoot+"/"+real_name);	
			log.info("업로드할 파일(fileAdd) : " + fileAdd);
			
			file.transferTo(fileAdd);
			
		}
		return real_name;
	}
	
	
	
	
	public static void fileDelete(String fileName) throws IOException{
		log.info("fileDelete 호출 성공 ");
		boolean result = false; 
		String startDirName = "", docRoot = "";
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		
		if(dirName.equals("thumbnail")) {
			startDirName = fileName.substring(dirName.length()+1, fileName.indexOf("_", dirName.length()+1));
			docRoot = "C://uploadStorage//"+startDirName+"//"+dirName;
		}else {
			docRoot = "C://uploadStorage//"+dirName;
		}

		File fileDelete =new File(docRoot+"/"+fileName);

		if(fileDelete.exists() && fileDelete.isFile()){
			result = fileDelete.delete();
		}
		log.info("파일 삭제 여부(true/false) : " + result);
	}

}
