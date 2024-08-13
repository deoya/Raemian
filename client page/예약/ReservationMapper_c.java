package folio.port.mapper;

import java.util.List;

import folio.port.domain.reserveDAO;

public interface ReservationMapper_c {
	
	public int insert(reserveDAO dao);
	
	public int count(int cidx);
	
	public reserveDAO getdata(int idx);
	
	public int delete(int idx);
	
	public int update(reserveDAO dao);
}
