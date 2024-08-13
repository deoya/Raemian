package folio.port.mapper;

import java.util.List;
import java.util.Map;

import folio.port.domain.infoDAO;

public interface InfoMapper {
	public int insert(infoDAO dao);
	
	public List<infoDAO> getList();
	
	public infoDAO get(int fidx);
	
	public int update(infoDAO dao);
	
	public int imgp_update(infoDAO dao);
	
	public int delete(int fidx);
	
	public List<infoDAO> select_page(int page);
	
	public List<infoDAO> select_search(String search);
		
	public List<infoDAO> select_search_pg(Map<String, Object> sh);
	
	public int usecount();
}
