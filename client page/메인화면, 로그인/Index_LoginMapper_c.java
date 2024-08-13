package folio.port.mapper;

import java.util.List;

import folio.port.domain.customerDAO;
import folio.port.domain.infoDAO;

public interface Index_LoginMapper_c {
	
	public int insert(customerDAO dao);

	public customerDAO read(String cid);
	
	public List<infoDAO> infoList();
	
	public int idcheck(String cid);
	
	public String idsearch(customerDAO dao);

	public List<customerDAO> pwdsearch(customerDAO dao);
	
	public int pwdupdate(customerDAO dao);
}
