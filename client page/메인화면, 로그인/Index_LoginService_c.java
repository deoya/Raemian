package folio.port.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import folio.port.domain.customerDAO;
import folio.port.domain.infoDAO;
import folio.port.mapper.Index_LoginMapper_c;
import folio.port.module.module1;
import folio.port.module.module_sns;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Log4j
@Service
public class Index_LoginService_c {
	private static final String String = null;
	module1 module1 = new module1();
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private Index_LoginMapper_c mapper;
	
	//--[회원가입]-------------------------------
	public String insert(customerDAO dao) {
		dao.setCpwd(pwencoder.encode(dao.getCpwd()));
		
		if(mapper.insert(dao) > 0 ) { return module1.move("회원가입 완료 되었습니다","/r/raemian_client/userlogin");}
		else { return module1.back("회원가입에 실패하였습니다 [번호 : 019]");}
	}
	//--[info 데이터 출력]--------------------------
	public List<infoDAO> infoList(){
		return mapper.infoList();
	}
	//--[회원가입시 인증번호]--------------------------
	public String tel_ck(String ctel) throws CoolsmsException {
		module_sns sns = new module_sns();
		return sns.module_sns(ctel);
	}
	//--[회원가입시 아이디 중복 체크]--------------------------
	public int idcheck(String cid) {
		return mapper.idcheck(cid);
	}
	//--[아이디 찾기]-------------------------------
	public String idsearch(customerDAO dao) {
		return mapper.idsearch(dao);
	}
	//--[비번 찾기]-------------------------------
	public List<customerDAO> pwdsearch(customerDAO dao) {
		return mapper.pwdsearch(dao);
	}
	//--[비번 변경]-------------------------------
	public String pwdupdate(customerDAO dao) {
		dao.setCpwd(pwencoder.encode(dao.getCpwd())); 
		if(mapper.pwdupdate(dao) > 0) {
			return module1.move("비밀번호 변경이 완료되었습니다","/r/raemian_client/userlogin");
		}else {
			return module1.move("변경에 실패하였습니다 [번호 : 037]", "/r/raemian_client/search");
		}
	}
	
}
