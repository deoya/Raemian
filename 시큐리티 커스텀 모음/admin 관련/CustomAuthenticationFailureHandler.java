package folio.port.security;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import folio.port.domain.adminDAO;
import folio.port.mapper.LoginMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {


	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
	        AuthenticationException exception) throws IOException, ServletException {
		
	    
	    String errorMessage = "로그인에 실패했습니다 [번호 : 038]"; 
	    
	    if(exception instanceof InternalAuthenticationServiceException){  
	    	  errorMessage = "존재하지 않는 사용자입니다";
	    } else if (exception instanceof BadCredentialsException) {
	    	errorMessage = "비밀번호가 틀렸습니다(실패 횟수 5회 초과시 자동 차단됩니다)";
	    } else if (exception instanceof DisabledException) {
	        errorMessage = "해당 사용자는 로그인이 불가능합니다";
	    }
	    
	    request.getSession().setAttribute("errorMessage", errorMessage);
	    
	    response.sendRedirect("/r/raemian_admin/ramian_admin_login");
	}
	
}