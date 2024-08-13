package folio.port.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.multipart.MultipartFile;

import folio.port.domain.AttachDAO;
import folio.port.domain.infoDAO;
import folio.port.domain.memberDAO;
import folio.port.domain.noticeDAO;
import folio.port.mapper.NoticeMapper;
import folio.port.module.module1;
import folio.port.module.module_cdn;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Log4j
@Service
public class NoticeService {
	module1 module1 = new module1();
	module_cdn<noticeDAO> cdn = null;
	
	@Setter(onMethod_= @Autowired)
	private NoticeMapper mapper;
	
	@Autowired
	private PlatformTransactionManager transactionManager;
	
	
	//--[데이터 출력]------------------
	public List<noticeDAO> getList(){
		return mapper.getList();
	}
	public List<noticeDAO> select_pg(int page) {
 		return mapper.select_page(page);
	}
	// 데이터 검색
	public List<noticeDAO> select_search(String search) {
		return mapper.select_search(search);
	}
	// 해당 데이터의 페이지
	public List<noticeDAO> select_search_pg(int page, String search) {
		Map<String, Object> sh = new HashMap<>();
	    sh.put("page", page);
	    sh.put("search", search);
	    return mapper.select_search_pg(sh);
	}
	
	
	//--[글 등록]------------------
	@Transactional
	public String insert(noticeDAO dao, String[] files, String[] uploadPaths, String[] uuids, String[] types) {
		if(mapper.insert(dao) == 0) return module1.back("등록에 실패하였습니다 [번호 : 015]");
		log.info("갯수 확인");
		if(files != null)  { //파일 첨부가 있을 경우
			int i = 0;
			int num = dao.getNidx();
			ArrayList<String> errorFile = new ArrayList<>();
			while(i < files.length) {
				AttachDAO dto = new AttachDAO();
				dto.setNfile(files[i]);
				dto.setUuid(uuids[i]);
				dto.setUploadPath(uploadPaths[i]);
				dto.setFiletype(types[i]);
				dto.setNidx(num);

				if(mapper.filedata(dto) == 0) errorFile.add(dto.getNfile());
				i++;
			}
			if(errorFile.size() != 0) {
				TransactionStatus status = transactionManager.getTransaction(new DefaultTransactionDefinition());
		        status.setRollbackOnly();
		        return module1.back("일부 파일의 저장에 문제가 있습니다 "+errorFile.toString());
			}
		} 
		
		
		return module1.move("등록을 완료 하였습니다","/r/raemian_admin/notice/notice_main");
		
	}
	
	
	//--[글 삭제]------------------
	public String delete(int nidx, String nfile,String filetype, String path) {
	
		if(!nfile.isEmpty()) {
			if(mapper.delete_file(nidx) > 0) {
				this.cdn = new module_cdn<>();
				cdn.cdn_delete(path, nfile, filetype);
			}else return "삭제에 실패하였습니다 [번호 :043]";
		}
		if(mapper.delete(nidx) > 0) return "삭제가 완료되었습니다";
		else return "삭제에 실패하였습니다 [번호 :017]";
	
	}
	
	//--[단일 데이터 출력]------------------
	public noticeDAO get(int nidx) {
		return mapper.get(nidx);
	}
	
	public List<AttachDAO> filesget(int nidx){
		return mapper.filesget(nidx);
	}
	
	
	
	
	//--[섬네일 저장]------------------
	public List<AttachDAO> fileajax(MultipartFile[] files) {
		
		List<AttachDAO> dtoList = new ArrayList<>();
		module_cdn<AttachDAO> cdn = new module_cdn<>();
		
		String uuid = UUID.randomUUID().toString()+"_";
		
		for(MultipartFile f : files) {
			
			AttachDAO dto = new AttachDAO();
			
			dto.setUuid(uuid);
			
			dto.setNfile(f.getOriginalFilename());
			
			
			if (cdn.cdn(uuid+dto.getNfile(), f, dto)) {
				dtoList.add(dto);
			}
		}
		
		if(dtoList.size() == files.length) {
			// jsp로 데이터 보내기
			return dtoList;
		}else {
			return null;
		}
	}
	
}
