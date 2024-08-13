package folio.port.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import folio.port.domain.reserveDAO;
import folio.port.mapper.CustomerMapper;
import folio.port.mapper.ReserveMapper;
import folio.port.module.module1;
import folio.port.module.module_cdn;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReserveService {
	module1 module1 = new module1();
	
	@Setter(onMethod_= @Autowired)
	private ReserveMapper mapper;
	//--[데이터 출력]-----------------------
	public List<reserveDAO> getList(){
		return mapper.getList();
	}
	public List<reserveDAO> select_pg(int page) {
		return mapper.select_page(page);
	}
	public List<reserveDAO> select_search(String search, String search_ch) {
		Map<String, Object> sh = new HashMap<>();
	    sh.put("search", search);
	    sh.put("search_ch", search_ch);
		return mapper.select_search(sh);
	}
	public List<reserveDAO> select_search_pg(String search, String search_ch, int page) {
		Map<String, Object> sh = new HashMap<>();
	    sh.put("search", search);
	    sh.put("search_ch", search_ch);
	    sh.put("page", page);
		return mapper.select_search_pg(sh);
	}
	//--[예약 취소]-----------------------
	public String delete(int ridx) {
		if(mapper.delete(ridx) > 0) {
			return "삭제에 성공 했습니다";
		}else return "삭제에 실패 했습니다 [번호 : 041]";
	}
	

}
