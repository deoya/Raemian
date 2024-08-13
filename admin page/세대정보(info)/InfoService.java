package folio.port.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import folio.port.domain.infoDAO;
import folio.port.mapper.InfoMapper;
import folio.port.module.module1;
import folio.port.module.module_cdn;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class InfoService {
	module1 module1 = new module1();
	module_cdn<infoDAO> cdn = null;
	
	@Setter(onMethod_= @Autowired)
	private InfoMapper mapper;
	
	//--[데이터 출력]-------------------
	public List<infoDAO> getList() {
		return mapper.getList();
	}
	// 페이지 검색
	public List<infoDAO> select_pg(int page) {
		return mapper.select_page(page);
	}
	// 데이터 검색
	public List<infoDAO> select_search(String search) {
		return mapper.select_search(search);
	}
	// 해당 데이터의 페이지
	public List<infoDAO> select_search_pg(int page, String search) {
		Map<String, Object> sh = new HashMap<>();
		sh.put("page", page);
		sh.put("search", search);
		return mapper.select_search_pg(sh);
	}
	
	//--[단일 데이터 보기]-------------------
	public infoDAO get(int fidx) {
		return mapper.get(fidx);
	}
	
	//--[설정 등록]-------------------
	//설정 저장 + 데이터 수정(이미지 수정 O)
	public String insert(infoDAO dao, MultipartFile file, String category){
		this.cdn = new module_cdn<>();
		// 구 이미지 파일 삭제 
		if(category != "new") {
				// 임시
			boolean del = cdn.cdn_delete(dao.getUploadPath(), dao.getFimg(), "E");
			if(del == false) {
				return module1.back("등록에 실패하였습니다 [번호 : 008]");
			}
		}
        UUID uuid = UUID.randomUUID();
        String upfilename =  uuid.toString()+"_"+ file.getOriginalFilename();
        dao.setFimg(upfilename);

        boolean result = cdn.cdn(upfilename, file, dao);
        
		if(result == true) {
			int inresult = 0;
			if(category == "new") {
				inresult = mapper.insert(dao);
			}else {
				inresult = mapper.imgp_update(dao); 
			}
			
			if(inresult > 0) {
				if(category == "new") {
					 return module1.back("등록을 완료 하였습니다");	
				}else {
					 return module1.move("수정을 완료 하였습니다","/r/raemian_admin/info/info_main");
				}

			}else {
				//임시
				boolean dresult = cdn.cdn_delete(dao.getUploadPath(), dao.getFimg(),"E");
				if(category == "new") {
					return module1.back("등록에 실패하였습니다 [번호 : 004]");
				} else {
					return module1.back("수정에 실패하였습니다 [번호 : 007]");
				}
			}			
		}else {
			if(category == "new") {
				return module1.back("등록에 실패하였습니다 [번호 : 003]");
			} else {
				return module1.back("등록에 실패하였습니다 [번호 : 006]");
			}
		}
	}
	//데이터 수정(이미지 수정 x)
	public String update(infoDAO dao) {
		int result = mapper.update(dao);
		if(result > 0) {
			return module1.move("수정을 완료 하였습니다","/r/raemian_admin/info/info_main");				
		}else {
			return module1.back("수정에 실패하였습니다 [번호 : 005]");
		}
	}
	//--[설정 삭제]-------------------
	public String delete(int fidx, String path, String fname) {
		this.cdn = new module_cdn<>();
		
		if(mapper.delete(fidx) > 0) {
			//임시
			if(cdn.cdn_delete(path, fname,"E")) {
				return "삭제에 성공하였습니다";
			}else {
				return "삭제에 실패 했습니다 [번호 : 010]";
			}
		}else{
			return "삭제에 실패 했습니다 [번호 : 011]";
		}
	}
	//--[사용 유/무 에서 사용함이 4개이상인지 체크]-------------
	public String usecount() {
		if (mapper.usecount() >= 4) {
			return "no";			
		}else { 
			return "yes";
		}
	}

}
