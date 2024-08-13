package folio.port.mapper;

import java.util.List;
import java.util.Map;

import folio.port.domain.adminDAO;
import folio.port.domain.customerDAO;
import folio.port.domain.faqDAO;
import folio.port.domain.noticeDAO;
import folio.port.domain.reserveDAO;

public interface AdminMapper {
	
	public customerDAO getcustomer();
	
	public faqDAO getfaq();

	public List<reserveDAO> getreserve();
	
	public int appupdate(adminDAO dao);
	
	
	
	//-----
	public List<adminDAO> select_page(int page);
	
	public List<adminDAO> getList();
	
	public List<adminDAO> select_search(Map<String, Object> sh);
	
	
	public List<adminDAO> select_search_pg(Map<String, Object> sh);

	public List<adminDAO> select_assign_pg(Map<String, Object> sh);
	
	public List<adminDAO> select_assignList(String search_assign);
	
	public List<adminDAO> select_search_assign(Map<String, Object> sh);

	public List<adminDAO> select_search_assign_pg(Map<String, Object> sh);
	
}
