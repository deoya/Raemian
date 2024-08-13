package folio.port.mapper;

import java.util.List;
import java.util.Map;

import folio.port.domain.customerDAO;

public interface CustomerMapper {
	public List<customerDAO> getList();
	
	public List<customerDAO> select_page(int page);
	
	public int delete(int cidx);
	
	public List<customerDAO> select_search(Map<String, Object> sh);
	
	public List<customerDAO> select_search_pg(Map<String, Object> sh);
}
