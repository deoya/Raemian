package folio.port.security;

import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import folio.port.domain.adminDAO;
import lombok.Getter;

@Getter
public class CustomUser extends User {
	
	private int index; 

    private static final long serialVersionUID = 1L;
    
    private adminDAO adminDao;
    
    public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }
    
    public CustomUser(adminDAO adminDao) {
        super(adminDao.getAid(), adminDao.getApwd(), Collections.singleton(new SimpleGrantedAuthority(adminDao.getAuth())));
        this.adminDao = adminDao;
        this.index = adminDao.getAidx();
    }
    
    @Override
    public boolean isEnabled() {
        return "Y".equals(adminDao.getApproval());
    }
    
    
    //로그인 성공 시 비번 틀린 횟수 초기화를 위한 메소드
    public int getIndex() {
        return this.index;
    }

}