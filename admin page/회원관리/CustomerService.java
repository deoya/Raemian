package folio.port.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import folio.port.domain.infoDAO;
import folio.port.domain.reserveDAO;
import folio.port.domain.customerDAO;
import folio.port.mapper.CustomerMapper;
import folio.port.mapper.ReserveMapper;
import folio.port.module.module1;
import folio.port.module.module_cdn;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CustomerService {
	
	@Setter(onMethod_= @Autowired)
	private CustomerMapper mapper;
	
	@Setter(onMethod_= @Autowired)
	private ReserveMapper reservemapper;
	
	//---[고객 삭제]---------------
	@Transactional
	public String delete(int cidx) {
		//만약 예약정보가 있을경우 함께삭제
		reserveDAO reserve = reservemapper.getdata(cidx);
		if(reserve != null) {
			reservemapper.delete(reserve.getRidx());
		}
		
		if(mapper.delete(cidx) > 0) {
			return "삭제에 성공 했습니다";
		}else{
			return "삭제에 실패 했습니다 [번호 : 012]";
		}
	}
	//---[데이터 출력]---------------
	public List<customerDAO> getList(){
		return mapper.getList();
	}
	public List<customerDAO> select_pg(int page) {
		return mapper.select_page(page);
	}
	public List<customerDAO> select_search(String search, String search_ch) {
		Map<String, Object> sh = new HashMap<>();
	    sh.put("search", search);
	    sh.put("search_ch", search_ch);
		return mapper.select_search(sh);
	}
	public List<customerDAO> select_search_pg(String search, String search_ch, int page) {
		Map<String, Object> sh = new HashMap<>();
	    sh.put("search", search);
	    sh.put("search_ch", search_ch);
	    sh.put("page", page);
		return mapper.select_search_pg(sh);
	}
}
