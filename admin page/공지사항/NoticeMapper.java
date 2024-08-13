package folio.port.mapper;

import java.util.List;
import java.util.Map;

import folio.port.domain.AttachDAO;
import folio.port.domain.infoDAO;
import folio.port.domain.noticeDAO;

public interface NoticeMapper {
	public List<noticeDAO> getList();
	
	public List<noticeDAO> select_page(int page);
	
	public int insert(noticeDAO dao);
	
	public int delete(int nidx);
	
	public noticeDAO get(int nidx);
	
	public List<noticeDAO> select_search(String search);
	
	public List<noticeDAO> select_search_pg(Map<String, Object> sh);
	
	public int filedata(AttachDAO dto);
	
	public int delete_file(int nidx);
	
	public List<AttachDAO> filesget(int nidx);
	
}
