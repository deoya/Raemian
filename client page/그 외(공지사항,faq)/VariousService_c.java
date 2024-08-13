package folio.port.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import folio.port.domain.faqDAO;
import folio.port.domain.noticeDAO;
import folio.port.mapper.VariousMapper_c;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class VariousService_c {
	
	@Setter(onMethod_ = @Autowired)
	private VariousMapper_c mapper;
	//--[FAQ 데이터 출력]-------------------
	public List<faqDAO> faqList(){
		return mapper.faqList();
	}
	//--[공지사항 데이터 출력]-------------------
	public List<noticeDAO> noticeList(){
		return mapper.noticeList();
	}
	public List<noticeDAO> notice_select_pg(int page) {
 		return mapper.notice_select_pg(page);
	}
	// 해당 데이터의 페이지
	public List<noticeDAO> notice_select_search_pg(int page, String search) {
		Map<String, Object> sh = new HashMap<>();
	    sh.put("page", page);
	    sh.put("search", search);
	    return mapper.notice_select_search_pg(sh);
	}
	// 데이터 검색
	public List<noticeDAO> notice_select_search(String search) {
		return mapper.notice_select_search(search);
	}
	//--[공지사항 단일 데이터 출력]-------------------
	@Transactional
	public noticeDAO getNotice(int nidx) {
		mapper.updateNotice_cnt(nidx); // 조회수 카운팅
		return mapper.getNotice(nidx);
	}
	
}
