package folio.port.mapper;

import folio.port.domain.adminDAO;

public interface LoginMapper {
	
	public int idcheck(String aid);
	
	public int insert(adminDAO dao);
	
	public adminDAO read(String aid);
	
	public int update_cnt (int aidx);
	
	public int update_cnt_reset (int aidx);
}
