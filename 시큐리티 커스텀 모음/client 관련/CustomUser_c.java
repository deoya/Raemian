package folio.port.security;

import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import folio.port.domain.customerDAO;
import lombok.Getter;


@Getter
public class CustomUser_c extends User {
    
    private static final long serialVersionUID = 1L;
    
    private customerDAO dao;
    
    
    public CustomUser_c(String username, String password,Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }
    
    public CustomUser_c(customerDAO dao) {
        super(dao.getCid(), dao.getCpwd(), Collections.singleton(new SimpleGrantedAuthority(dao.getAuth())));
        this.dao = dao;
    }
}