package folio.port.security;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import folio.port.domain.customerDAO;
import folio.port.mapper.Index_LoginMapper_c;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService_c implements UserDetailsService{
		

	
	@Setter(onMethod_= @Autowired)
	private Index_LoginMapper_c mapper;
	
	@Override
	public UserDetails loadUserByUsername(String userName){
		
		customerDAO dao = mapper.read(userName);
		
		return dao == null ? null : new CustomUser_c(dao);
	}
	
	
}
