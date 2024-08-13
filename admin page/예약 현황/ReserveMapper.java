package folio.port.mapper;

import java.util.List;
import java.util.Map;

import folio.port.domain.reserveDAO;

public interface ReserveMapper {
	
	public List<reserveDAO> getList();
	
	public List<reserveDAO> select_page(int page);
	
	public List<reserveDAO> select_search(Map<String, Object> sh);
	
	public List<reserveDAO> select_search_pg(Map<String, Object> sh);

	public int delete(int ridx);
	
	public reserveDAO getdata(int cidx);
}
