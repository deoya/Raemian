package folio.port.domain;

import java.util.Date;

import lombok.Data;

@Data
public class faqDAO {
	private int fqidx,aidx;
	private String fqtitle,aname,fqanswer;
	private Date fqdate;
}
