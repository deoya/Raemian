package folio.port.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import folio.port.domain.adminDAO;
import folio.port.mapper.AdminMapper;
import folio.port.mapper.LoginMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	@Setter(onMethod_= @Autowired)
	private LoginMapper mapper;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		
        Object principal = auth.getPrincipal();
        
        List<String> roleNames = new ArrayList<>();
        
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
        
        if(principal instanceof CustomUser) {
        	int index = ((CustomUser) principal).getIndex();
        	mapper.update_cnt_reset(index);
        	response.sendRedirect("/r/raemian_admin/admin/admin_main");
        }else {
        	response.sendRedirect("/r/raemian_client/index");
        }
	}
}
