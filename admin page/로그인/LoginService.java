package folio.port.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import folio.port.domain.adminDAO;
import folio.port.mapper.LoginMapper;
import folio.port.module.module1;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class LoginService {
	module1 module1 = new module1();

	@Setter(onMethod_= {@Autowired})
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_= @Autowired)
	private LoginMapper mapper;
	
	
	// --[아이디 중복체크]-------------- 
	public int idcheck(String aid) {
		return mapper.idcheck(aid);
	}
	// --[회원가입]-------------- 
	public String memberInsert(adminDAO dao) {
		dao.setApwd(pwencoder.encode(dao.getApwd()));
		int result = mapper.insert(dao);
		
		if(result == 1) {
			return this.module1.move("회원가입이 완료되었습니다", "/r/raemian_admin/ramian_admin_login");
		}else {
			return this.module1.back("회원가입에 실패하였습니다 [번호 : 002]");
		}
	}
	
}
