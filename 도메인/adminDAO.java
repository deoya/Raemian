package folio.port.domain;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

//setter도 필요한 이유 - 전화번호를 input 3개로 받고 있기 때문에 합치는 작업이 필요했기 때문입니다
@Data
public class adminDAO {
	private int aidx, apwdck;
	private String assign, ateam, aname, aposition, aid, apwd, aemail, auth, atel;
	
	private String approval;
	
	private Date adate;
}
