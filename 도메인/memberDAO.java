package folio.port.domain;

import java.util.Date;

import lombok.Data;

@Data
public class memberDAO {
	private int midx;
	private String mname,mid,mpwd,mtel,memail,madrr_n,madrr_1,madrr_2,mad;
	private Date mdate;
}
