package folio.port.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import folio.port.domain.adminDAO;
import folio.port.domain.customerDAO;
import folio.port.domain.faqDAO;
import folio.port.domain.noticeDAO;
import folio.port.domain.reserveDAO;
import folio.port.mapper.AdminMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdminService {
	
	@Setter(onMethod_= @Autowired)
	private AdminMapper mapper;
	
	//--[데이터 출력 - main페이지]----------
	public customerDAO getcustomer(){
		return mapper.getcustomer();
	}
	public faqDAO getfaq(){
		return mapper.getfaq();
	}
	public List<reserveDAO> getreserve(){
		return mapper.getreserve();
	}
	
	//--[관리자 현황 변경]----------
	public int appupdate(int aidx, String approval) {
		adminDAO dao = new adminDAO();
		dao.setAidx(aidx);
		dao.setApproval(approval);
		return mapper.appupdate(dao);
	}
	
	
	//--[데이터 출력]----------
	public List<adminDAO> select_pg(int page) {
 		return mapper.select_page(page);
	}
	public List<adminDAO> getList(){
		return mapper.getList();
	}
	// 데이터 검색
	public List<adminDAO> select_search(String search,String search_ch) {
		Map<String, Object> sh = new HashMap<>();
	    sh.put("search", search);
	    sh.put("search_ch", search_ch);
		
		return mapper.select_search(sh);
	}
	// 해당 검색 데이터의 페이지
	public List<adminDAO> select_search_pg(int page, String search,String search_ch) {
		Map<String, Object> sh = new HashMap<>();
	    sh.put("page", page);
	    sh.put("search", search);
	    sh.put("search_ch", search_ch);
	    return mapper.select_search_pg(sh);
	}
	
	// 소속 검색 데이터의 페이지
	public List<adminDAO> select_assign_pg(int page, String search_assign){
		Map<String, Object> sh = new HashMap<>();
	    sh.put("page", page);
	    sh.put("search", search_assign);
	    return mapper.select_assign_pg(sh);
	}
	// 소속 검색
	public List<adminDAO> select_assignList(String search_assign) {
		return mapper.select_assignList(search_assign);
	}
	
	// 소속 + 데이터 검색 
	public List<adminDAO> select_search_assign(String search,String search_ch, String search_assign) {
		Map<String, Object> sh = new HashMap<>();
	    sh.put("search", search);
	    sh.put("search_ch", search_ch);
	    sh.put("search_assign", search_assign);
		
		return mapper.select_search(sh);
	}
	//소속 + 데이터 검색의 페이지
	public List<adminDAO> select_search_assign_pg(int page, String search,String search_ch, String search_assign) {
		Map<String, Object> sh = new HashMap<>();
	    sh.put("page", page);
	    sh.put("search", search);
	    sh.put("search_ch", search_ch);
	    sh.put("search_assign", search_assign);
	    return mapper.select_search_assign_pg(sh);
	}

}
