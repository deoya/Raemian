package folio.port.mapper;

import java.util.List;
import java.util.Map;

import folio.port.domain.faqDAO;

public interface FaqMapper {
	
	public List<faqDAO> getList();
	
	public List<faqDAO> select_page(int page);
	
	public List<faqDAO> select_search(String search);
		
	public List<faqDAO> select_search_pg(Map<String, Object> sh);
	
	public int insert(faqDAO dao);
	
	public int delete(int fidx);
}
