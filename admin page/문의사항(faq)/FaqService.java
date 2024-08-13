package folio.port.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import folio.port.domain.faqDAO;
import folio.port.domain.infoDAO;
import folio.port.mapper.FaqMapper;
import folio.port.module.module1;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class FaqService {
	module1 module1 = new module1();
	
	@Setter(onMethod_ = @Autowired)
	private FaqMapper mapper;
	
	//--[데이터 출력]----------------------
	public List<faqDAO> getList() {
		return mapper.getList();
	}
	// 페이지 검색
	public List<faqDAO> select_pg(int page) {
		return mapper.select_page(page);
	}
	// 데이터 검색
	public List<faqDAO> select_search(String search) {
		return mapper.select_search(search);
	}
	// 해당 데이터의 페이지
	public List<faqDAO> select_search_pg(int page, String search) {
		Map<String, Object> sh = new HashMap<>();
	    sh.put("page", page);
	    sh.put("search", search);
	    return mapper.select_search_pg(sh);
	}
	//--[글 등록]----------------------
	public String insert(faqDAO dao) {
		if(mapper.insert(dao) > 0) { return module1.move("등록이 완료 되었습니다", "/r/raemian_admin/faq/faq_main");}
		else {return module1.back("등록에 실패하였습니다 [번호 : 018]");}
	}
	//--[글 삭제]----------------------
	public String delete(int fqidx) {
		if(mapper.delete(fqidx) > 0) { return "삭제 완료 되었습니다";
		}else { return "삭제에 실패하였습니다 [번호 : 021]";}
	}
}
