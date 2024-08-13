package folio.port.module;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.springframework.web.multipart.MultipartFile;

import folio.port.domain.UploadPathSettable;
import folio.port.domain.infoDAO;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;



@Log4j
public class module_cdn<D extends UploadPathSettable> {
	 private String host = "";
	  
	  private String user = "";
	  
	  private String pass = "";
	  
	  private int port = ;
    
    // 날짜별 생성
    private String getFolder() {
    	SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy");
        SimpleDateFormat sdfMonth = new SimpleDateFormat("MM");
        SimpleDateFormat sdfDay = new SimpleDateFormat("dd");

        String year = sdfYear.format(new Date());
        String month = sdfMonth.format(new Date());
        String day = sdfDay.format(new Date());

        return year + "/" + month + "/" + day + "/";
    }
    // 폴더 생성
    private void createDirectories(FTPClient ftp, String remoteDirPath) throws IOException {
        String[] folders = remoteDirPath.split("/");
        for (String folder : folders) {
            if (!folder.isEmpty()) {
                if (!ftp.changeWorkingDirectory(folder)) {
                    ftp.makeDirectory(folder);
                    ftp.changeWorkingDirectory(folder);
                }
            }
        }
    }
    
    // 파일이 이미지인지 확인
    public static boolean isImage(MultipartFile file) {
        String contentType = file.getContentType();
        return contentType != null && contentType.startsWith("image/");
    }
    

    // FTP 파일 업로드(단일)
    public boolean cdn(String filename, MultipartFile file, D dao) {
    	
        FTPClient ftp = new FTPClient();
        boolean result = false;
        try {
            ftp.setControlEncoding("euc-kr"); //"utf-8");
            ftp.connect(host, port);
            ftp.login(user, pass);
            ftp.setFileType(FTP.BINARY_FILE_TYPE);
            ftp.changeWorkingDirectory("/");
           
            
            String folderPath = getFolder();
            String remoteDirPath =  "/www/" + folderPath; 
            
            createDirectories(ftp, remoteDirPath);

            dao.setUploadPath(folderPath);
            
            
            File tempFile = File.createTempFile("temp", ".tmp");
            file.transferTo(tempFile);
            FileInputStream inputStream = new FileInputStream(tempFile);
            
            
            
            // 이미지 타입인지 확인 후 섬네일 별도 저장
        	if(isImage(file)) {
        		dao.setFiletype("I");
        		 String thumbnailFilename = "s_" + filename;
        		 
        		 try {
        			 File thumbnailFile = new File(thumbnailFilename);
        			 
        			 
        			 Thumbnails.of(file.getInputStream())
                     .size(100, 100)
                     .toFile(thumbnailFile);
        			 
        			 try (InputStream input = new FileInputStream(thumbnailFile)) {
        	                ftp.storeFile(remoteDirPath + thumbnailFilename, input);
        	            }
        		 }catch (Exception e) {
        			 // 섬네일 저장 실패 했을때 
        			 log.info(e);
        		 }
        	}else dao.setFiletype("E");
            
            result = ftp.storeFile(remoteDirPath + filename, inputStream);
            
            inputStream.close();
            tempFile.delete();
            
            
        } catch (Exception e) {
            log.info("FTP 파일 업로드 오류: " + e.getMessage());
        } finally {
            try {
                if (ftp.isConnected()) {
                    ftp.logout();
                    ftp.disconnect();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }
    
    
    
    
    //파일 삭제(단일)
    public boolean cdn_delete(String uploadPath, String filename, String filetype) {
    	FTPClient ftp = new FTPClient();
        boolean result = false;
        try {
            ftp.setControlEncoding("utf-8");
            ftp.connect(host, port);
            ftp.login(user, pass);
            ftp.changeWorkingDirectory("/");
            
            
            result = ftp.deleteFile("/www/"+uploadPath+filename);
           
            if(filetype.equals("I")) {
            	ftp.deleteFile("/www/"+uploadPath+"s_"+filename);
            }
            
			
		}catch (Exception e) {
            log.info("FTP 파일 삭제 오류: " + e.getMessage());
        } finally {
            try {
                if (ftp.isConnected()) {
                    ftp.logout();
                    ftp.disconnect();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
	}
    
    
    
}

