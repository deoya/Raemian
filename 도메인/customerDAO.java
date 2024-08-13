package folio.port.domain;

import java.util.Date;

import lombok.Data;

@Data
public class customerDAO {
	private int cidx;
	private String cname,cid,auth,cpwd,ctel,cemail,cadrr_n,cadrr_1,cadrr_2,cad,approval;
	private Date cdate;

}
