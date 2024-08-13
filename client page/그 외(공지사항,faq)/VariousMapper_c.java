package folio.port.mapper;

import java.util.List;
import java.util.Map;

import folio.port.domain.faqDAO;
import folio.port.domain.noticeDAO;

public interface VariousMapper_c {

	public List<faqDAO> faqList();

	public List<noticeDAO> noticeList();
	
	public List<noticeDAO> notice_select_pg(int page);
	
	public List<noticeDAO> notice_select_search_pg(Map<String, Object> sh);
	
	public List<noticeDAO> notice_select_search(String search);
	
	public noticeDAO getNotice(int nidx);
	
	public int updateNotice_cnt(int nidx);
}
