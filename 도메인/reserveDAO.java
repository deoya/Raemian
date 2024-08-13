package folio.port.domain;

import java.util.Date;

import lombok.Data;

@Data
public class reserveDAO {
	private int ridx, cidx, updatecnt;
	private String cid,cname,String,ctel,rpersonnel;
	private Date reservedate,rdate,reservetime;
}
