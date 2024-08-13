package folio.port.security;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import folio.port.domain.adminDAO;
import folio.port.domain.customerDAO;
import folio.port.mapper.AdminMapper;
import folio.port.mapper.Index_LoginMapper_c;
import folio.port.mapper.LoginMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	
	
	private static final adminDAO NULL_DAO  = null;
	
	
	@Setter(onMethod_= @Autowired)
	private LoginMapper mapper;
	
	@Setter(onMethod_= @Autowired)
	private AdminMapper adminMapper;
	
	/*
	안녕하세요. 면접관분들이 보시기에 왜 UsernameNotFoundException을 사용하지 않은 것 인지 의아해 하실 수 있을것 같아,
	부연 설명을 위해 주석을 답니다.
	현재 원인 파악중에 있어, 어떤 요인이 원인이 되었을지 모르겠습니다.
	왜인지 dao를 로그로 확인하면 분명 null로 나옴에도 불구하고,
	비교문(==)과 equals로 null를 인식하지 못하는 현상이 발견되었습니다.(문자형 "null"도 마찬가지)
	그리하여 임의로 nullposition을 만들었으며 (private static final adminDAO NULL_DAO  = null;이 있는 이유가 이것)

	그 영향인것인지  UsernameNotFoundException도 작동하지 않아(throw로 던져도 AuthenticationFailureHandler에서는 BadCredentialsException로 변환됨), 
	부득이하게 InternalAuthenticationServiceException를 활용케 되었습니다.
	참고 부탁드립니다.
	*/
	
	
	@Override
	public UserDetails loadUserByUsername(String userName) {
		
		adminDAO dao = mapper.read(userName);
		
		if (dao == NULL_DAO) {
			   throw new InternalAuthenticationServiceException(userName);
		    }else {
		    	if(dao.getAidx() != 1 && dao.getAidx() != 2 ) {
			    	if(dao.getApwdck() < 5) {
			    		mapper.update_cnt(dao.getAidx());
			    		
			    	}else {
			    		dao.setApproval("N");
			    		adminMapper.appupdate(dao);
			    	}
		    	}
		    }

		
		return new CustomUser(dao);
	}
}


